#!/usr/bin/env bash
# Live checkpoint comparison: as the (slower) shifted replay writes each checkpoint
# screenshot, compare it to the matching replay's (already produced, since matching
# runs ahead). Reports OK/DIVERGE per checkpoint in real time; exits when shifted
# finishes or a divergence is confirmed.
OUT="${1:-/mnt/c/gbahawk_test/out}"
# Portable file mtime (epoch seconds): GNU `stat -c %Y` vs BSD/macOS `stat -f %m`.
mtime() { stat -c %Y "$1" 2>/dev/null || stat -f %m "$1"; }
declare -A seen
ndiv=0; nok=0
echo "live-compare started $(date +%H:%M:%S)  (OUT=$OUT)"
while true; do
  for f in "$OUT"/shifted_*.png; do
    [ -e "$f" ] || continue
    fr=$(basename "$f" .png); fr=${fr#shifted_}
    [ -n "${seen[$fr]:-}" ] && continue
    m="$OUT/matching_${fr}.png"
    [ -f "$m" ] || continue
    # stability guard: skip if written in the last 3s (avoid partial-write false diff)
    age=$(( $(date +%s) - $(mtime "$f") ))
    [ "$age" -lt 3 ] && continue
    s=$(sha1sum "$f" | cut -d' ' -f1); mm=$(sha1sum "$m" | cut -d' ' -f1)
    seen[$fr]=1
    if [ "$s" = "$mm" ]; then
      nok=$((nok+1)); echo "$(date +%H:%M:%S)  frame ${fr}: OK   (${nok} ok, ${ndiv} diverge)"
    else
      ndiv=$((ndiv+1)); echo "$(date +%H:%M:%S)  frame ${fr}: *** DIVERGE ***  shifted=$s matching=$mm"
    fi
  done
  if [ -f "$OUT/shifted_done.txt" ]; then
    echo "shifted reached the end: $(cat "$OUT/shifted_done.txt")"
    echo "FINAL: $nok checkpoints OK, $ndiv divergent"
    break
  fi
  sleep 12
done
