# Progress reporting

The user requests a standing progress meter without needing to ask for updates.
Maintain `PROGRESS.md` after every meaningful verified milestone, candidate match
improvement, integration result, or blocker change during the active decompilation
goal. Keep its verification revision/date, current work, next milestone, and
remaining inventory accurate. Do not equate full-ROM matching with C coverage or
invent an overall completion percentage before its denominator is audited.
Preserve the detailed evidence in `docs/decomp-completion.md`.

# Disk space

The user authorizes making space during this task. When storage is constrained,
prefer removing reproducible old build outputs or compressing old compiler
experiment output with verified archive contents. Preserve source files, ROMs,
compiler installations, verification logs and the current/recent verification
runs. Do not run clean targets that remove the required local compilers.
Verified older assembly-output archives and recovery manifests are stored in
`.deps/archived-compiler-output`.
