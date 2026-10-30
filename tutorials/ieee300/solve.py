"""IEEE 300 潮流：Python 客户端一次性调用。

    export ESML_HOME=/path/to/esml-academic-1.8.1-linux-x86_64
    pip install git+https://github.com/ai4energy/esml-python
    python solve.py "$ESML_HOME"
"""

from __future__ import annotations

import os
import pathlib
import sys

from esml import solve


def main() -> None:
    home = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else os.environ.get("ESML_HOME", "."))
    case = home / "library/domains/power/cases/case300.comp.esml"
    if not case.is_file():
        raise SystemExit(f"找不到用例：{case}（把 ESML_HOME 指向解包后的学术版目录）")

    out = solve(case, libraries=[home / "library"], binary=home / "esml")
    print(f"unknowns = {out.unknowns}")
    print(
        f"engine = {out.meta['engineVersion']}  "
        f"docHash = {out.meta['docHash'][:12]}…  "
        f"unitCoverage = {out.meta['unitCoverage']}"
    )
    for path in ("b1.net.Vm", "b1.net.Va", "b2.net.Vm", "b2.net.Va"):
        print(f"{path} = {out.values[path]:.10f}")


if __name__ == "__main__":
    main()
