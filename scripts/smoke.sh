#!/bin/sh
# 学术版端到端烟测：solve / simulate / DTIL 门 / 规模门。
#   sh scripts/smoke.sh /path/to/esml-academic-1.8.1-linux-x86_64
set -eu
home=${1:?usage: smoke.sh /path/to/esml-academic-1.8.1-linux-x86_64}
esml="$home/esml"
case300="$home/library/domains/power/cases/case300.comp.esml"
case2869="$home/library/domains/power/cases/case2869.comp.esml"
decay="$home/quickstart/decay.esml"

"$esml" --version | grep -q '学术版'
echo "version: OK"

out=$("$esml" solve "$case300" -L "$home/library" --json 2>/dev/null)
printf '%s' "$out" | grep -q '"unknowns":4604'
printf '%s' "$out" | grep -q '"path":"b1.net.Vm"'
printf '%s' "$out" | grep -q '"value":1.0284201462972262'
printf '%s' "$out" | grep -q '"docHash":"[0-9a-f]\{64\}"'
echo "solve IEEE 300 (4604 unknowns): OK"

out=$("$esml" simulate "$decay" --tspan 0,1 --steps 2 --json 2>/dev/null)
printf '%s' "$out" | grep -q '"apiVersion":"esml.simulate/v1"'
echo "simulate decay: OK"

if printf '%s\n' '{"op":"info"}' | "$esml" session "$decay" >/dev/null 2>&1; then
    echo "FAIL: 学术版没有拒绝 esml session"; exit 1
fi
printf '%s\n' '{"op":"info"}' | "$esml" session "$decay" 2>&1 | grep -q 'commercial-edition'
echo "DTIL gate (session rejected): OK"

if "$esml" solve "$case2869" -L "$home/library" >/dev/null 2>&1; then
    echo "FAIL: 学术版没有拒绝超限模型"; exit 1
fi
"$esml" solve "$case2869" -L "$home/library" 2>&1 | grep -q 'academic edition'
echo "size gate (2869 rejected): OK"

test -f "$home/libesml_mmprops_ffi.so"
echo "property backend present: OK"

echo "SMOKE OK"
