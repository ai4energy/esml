"""第一英里检查：用学术版引擎做一次稳态求解与一次时间积分。

    export ESML_BIN=/path/to/esml
    pip install git+https://github.com/ai4energy/esml-python
    python quickstart/python_quickstart.py
"""

from __future__ import annotations

import math
import pathlib

from esml import simulate, solve

DOC = pathlib.Path(__file__).with_name("decay.esml")


def main() -> None:
    steady = solve(DOC, system="S")
    print(f"稳态: {steady.values}")

    traj = simulate(DOC, (0.0, 1.0), 20, observe=["m.x"], system="S")
    got = traj.series["m.x"][-1]
    print(f"x(1) = {got:.6f}（解析解 {math.exp(-0.5):.6f}）")


if __name__ == "__main__":
    main()
