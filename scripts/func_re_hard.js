export const meta = {
  name: 'fe8-func-re',
  description: 'Reverse-engineer sub_XXXX functions and propose semantic names, then verify',
  phases: [
    { title: 'RE', detail: 'one agent per module batch proposes names from body+callers' },
    { title: 'Verify', detail: 'adversarial check of high-confidence proposals' },
  ],
}

const RE_SCHEMA = {
  type: 'object',
  properties: {
    names: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          old: { type: 'string' },
          new: { type: 'string', description: 'PascalCase semantic name, NO "sub_"/"Unknown_" substring, or empty to keep sub_' },
          confidence: { type: 'string', enum: ['high', 'medium', 'low'] },
          reason: { type: 'string', description: 'one short phrase: what the function does' },
        },
        required: ['old', 'new', 'confidence', 'reason'],
      },
    },
  },
  required: ['names'],
}

const VERIFY_SCHEMA = {
  type: 'object',
  properties: {
    verdicts: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          old: { type: 'string' },
          accept: { type: 'boolean', description: 'true if the name accurately reflects the function' },
          better: { type: 'string', description: 'optional improved name if rejecting' },
        },
        required: ['old', 'accept'],
      },
    },
  },
  required: ['verdicts'],
}

const BATCH_SCHEMA = {
  type: 'object',
  properties: {
    batches: {
      type: 'array',
      items: {
        type: 'object',
        properties: { file: { type: 'string' }, funcs: { type: 'array', items: { type: 'string' } } },
        required: ['file', 'funcs'],
      },
    },
  },
  required: ['batches'],
}
const boot = await agent(
  `Read the JSON file ${args} (an array of {file, funcs}) and return it verbatim as {batches: [...]}. Use the Read tool; the file may be large so read it fully.`,
  { label: 'load-batches', phase: 'RE', schema: BATCH_SCHEMA }
)
const batches = boot.batches
log(`RE over ${batches.length} module batches (${batches.reduce((a, b) => a + b.funcs.length, 0)} functions)`)

const results = await pipeline(
  batches,
  (b) => agent(
    `You are reverse-engineering Fire Emblem 8 (GBA) decompiled C to give meaningful names to placeholder functions.

File: ${b.file}
Functions to name: ${b.funcs.join(', ')}

For EACH function:
1. Read its body in ${b.file} (it is decompiled C). Use Grep to find ALL call sites across src/ and include/ — the callers' context and the function's arguments/returns reveal its purpose.
2. Look at how neighboring, already-named functions in the same file are named, and MATCH that convention (PascalCase; often a module prefix like the file suggests, e.g. StatScreen_, Sio, Worldmap, Face, Help, MapAnim). Look at the struct types of parameters (e.g. struct Proc*, struct Unit*) for hints.
3. Propose "new": a concise PascalCase name describing what it DOES (e.g. StatScreen_DrawHpBar, Sio_InitConnection, Face_LoadGfx). The name MUST NOT contain the substring "sub_" or "Unknown_". If a proc-script function, suffix conventions like _Loop/_Init/_OnEnd are common.
4. These are the FINAL hard-to-name leftovers — give EVERY function a name (confidence high or medium; avoid "low"/empty). For trivial stubs that just return a constant, name by behavior: <Module>_CondTrue / <Module>_CondFalse / <Module>_RetZero (the verifier will accept these). For near-duplicate functions, disambiguate by the specific value/check/index they differ on (e.g. _Gold9999 vs _Gold7999). Never output a name containing "sub_" or "Unknown_".

Be accurate over comprehensive — a wrong name is worse than keeping sub_. Return one entry per function.`,
    { label: `re:${b.file.replace('src/', '').replace('.c', '')}:${b.funcs.length}`, phase: 'RE', schema: RE_SCHEMA }
  ).then((r) => ({ file: b.file, names: (r?.names || []).filter((n) => n.new && n.confidence !== 'low') })),
  // Verify: re-check this batch's high/medium proposals against the code
  (re) => {
    const props = re.names
    if (!props.length) return { file: re.file, accepted: [] }
    return agent(
      `Adversarially verify proposed function names for Fire Emblem 8 decomp file ${re.file}.
For each, read the function body and its call sites, and decide if the proposed name ACCURATELY reflects what the function does. Reject misleading/guessed names (accept=false). If you reject but know a better name, give it in "better" (PascalCase, no "sub_"/"Unknown_").

Proposals:
${props.map((n) => `- ${n.old} -> ${n.new}  (${n.reason})`).join('\n')}`,
      { label: `verify:${re.file.replace('src/', '').replace('.c', '')}`, phase: 'Verify', schema: VERIFY_SCHEMA }
    ).then((v) => {
      const verd = {}
      for (const x of (v?.verdicts || [])) verd[x.old] = x
      const accepted = []
      for (const p of props) {
        const d = verd[p.old]
        if (!d) continue
        if (d.accept) accepted.push({ old: p.old, new: p.new })
        else if (d.better && /^[A-Za-z_]\w*$/.test(d.better) && !/sub_|Unknown_/.test(d.better))
          accepted.push({ old: p.old, new: d.better })
      }
      return { file: re.file, accepted }
    })
  }
)

const all = []
for (const r of results.filter(Boolean)) for (const a of (r.accepted || [])) all.push(a)
log(`accepted ${all.length} verified function names`)
return { renames: all }
