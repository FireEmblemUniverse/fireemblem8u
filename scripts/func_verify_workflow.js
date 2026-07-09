export const meta = {
  name: 'fe8-func-verify',
  description: 'Verify AI-assigned function names against their code; correct the wrong ones',
  phases: [
    { title: 'Verify', detail: 'per-file agent checks each name vs body+callers' },
    { title: 'Confirm', detail: 'adversarial double-check of proposed corrections' },
  ],
}

const VERIFY_SCHEMA = {
  type: 'object',
  properties: {
    results: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          name: { type: 'string', description: 'the current function name being judged' },
          ok: { type: 'boolean', description: 'true if the name accurately reflects what the function does' },
          better: { type: 'string', description: 'if not ok, a corrected PascalCase name (no "sub_"/"Unknown_"); empty if ok' },
          reason: { type: 'string', description: 'short: why wrong / what it actually does' },
        },
        required: ['name', 'ok'],
      },
    },
  },
  required: ['results'],
}

const CONFIRM_SCHEMA = {
  type: 'object',
  properties: {
    verdicts: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          name: { type: 'string' },
          apply: { type: 'boolean', description: 'true to apply the rename to "to"' },
          to: { type: 'string', description: 'final corrected name (valid C identifier, no sub_/Unknown_)' },
        },
        required: ['name', 'apply'],
      },
    },
  },
  required: ['verdicts'],
}

const boot = await agent(
  `Read the JSON file ${args} (an array of {file, names}) and return it verbatim as {batches: [...]}. Read the whole file.`,
  { label: 'load-batches', phase: 'Verify',
    schema: { type: 'object', properties: { batches: { type: 'array', items: { type: 'object', properties: { file: { type: 'string' }, names: { type: 'array', items: { type: 'string' } } }, required: ['file', 'names'] } } }, required: ['batches'] } }
)
const batches = boot.batches
log(`verify ${batches.length} batches (${batches.reduce((a, b) => a + b.names.length, 0)} function names)`)

const results = await pipeline(
  batches,
  // Phase 1: judge each name against the code
  (b) => agent(
    `These Fire Emblem 8 (GBA) decompiled C functions were given semantic names by an automated pass. Audit them for accuracy.

File: ${b.file}
Function names to check: ${b.names.join(', ')}

For EACH name: read that function's body in ${b.file}; if useful, Grep its call sites across src/ and include/ to see how it's used (arguments, return, caller context). Decide whether the NAME accurately describes what the function actually does.
- ok=true if the name is accurate (it does NOT need to be perfect — only flag names that are misleading or wrong).
- ok=false ONLY if the name misrepresents the function (wrong verb, wrong subject, wrong subsystem, copy-paste error, off-by-one index, etc.). Then give "better": a corrected concise PascalCase name matching neighboring conventions in the file (no "sub_"/"Unknown_" substring), and "reason".
Be conservative: prefer ok=true unless you are confident the name is wrong. A churny rename of an already-fine name is worse than leaving it.`,
    { label: `verify:${b.file.replace('src/', '').replace('.c', '')}:${b.names.length}`, phase: 'Verify', schema: VERIFY_SCHEMA }
  ).then((r) => ({ file: b.file, wrong: (r?.results || []).filter((x) => x.ok === false && x.better && /^[A-Za-z_]\w*$/.test(x.better) && !/sub_|Unknown_/.test(x.better)) })),
  // Phase 2: adversarially confirm each proposed correction before applying
  (v) => {
    if (!v.wrong.length) return { file: v.file, apply: [] }
    return agent(
      `Adversarially double-check proposed function-name CORRECTIONS in Fire Emblem 8 decomp file ${v.file}. For each, read the function body + call sites and decide if the correction is genuinely more accurate than the current name. Reject churn (apply=false) unless the new name is clearly better and correct. Provide the final name in "to".

Proposed corrections (current -> proposed):
${v.wrong.map((w) => `- ${w.name} -> ${w.better}  (${w.reason || ''})`).join('\n')}`,
      { label: `confirm:${v.file.replace('src/', '').replace('.c', '')}`, phase: 'Confirm', schema: CONFIRM_SCHEMA }
    ).then((c) => {
      const props = {}
      for (const w of v.wrong) props[w.name] = w.better
      const apply = []
      for (const d of (c?.verdicts || [])) {
        const to = d.to || props[d.name]
        if (d.apply && to && /^[A-Za-z_]\w*$/.test(to) && !/sub_|Unknown_/.test(to) && to !== d.name)
          apply.push({ from: d.name, to })
      }
      return { file: v.file, apply }
    })
  }
)

const fixes = []
for (const r of results.filter(Boolean)) for (const a of (r.apply || [])) fixes.push(a)
log(`confirmed ${fixes.length} corrections`)
return { fixes }
