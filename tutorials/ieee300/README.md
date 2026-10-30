# 十分钟跑通 IEEE 300 潮流

目标：用学术版引擎求解 IEEE 300 节点潮流，分别走 **命令行**、**Python 客户端**、
**Julia 客户端**。全程一次性调用，不依赖常驻会话。

## 准备

1. 下载并解包学术版（Linux x86_64）：

   ```bash
   tar -xzf esml-academic-1.9.0-linux-x86_64.tar.gz
   export ESML_HOME="$PWD/esml-academic-1.9.0-linux-x86_64"
   ```

2. 学术版上限 **16,384 展平未知量**；IEEE 300 是 **4,604**，在范围内。
   IEEE 2869 / 1354 / 9241 等更大规模需要商业版。

## 命令行

```bash
"$ESML_HOME/esml" solve \
  "$ESML_HOME/library/domains/power/cases/case300.comp.esml" \
  -L "$ESML_HOME/library" --json
```

输出是 `esml.solve/v1` JSON，`unknowns = 4604`。本机（release）实测整进程墙钟约
**0.32 s**。信封里的每个值都带 `unit`，`meta` 带版本、源文件 SHA-256、耗时、
收敛质量与单位覆盖率：

```json
{"path":"b1.net.Vm","value":1.0284201462972262,"unit":"1"}
{"path":"b1.net.Va","value":0.10415017989169018,"unit":"1"}
```

IEEE 300 的 `Vm`/`P`/`Q` 是标幺值、`Va` 是弧度；`PowerPort` 已声明为无量纲
（`unit="1"`），因此 4,604 个值全部带单位、`unitCoverage.complete` 为 `true`，
数值本身不变。字段语义见[结果契约](https://docs.ai4energy.cn/esml/results)。

也可以直接跑脚本：

```bash
sh run_cli.sh "$ESML_HOME"
```

## Python

```bash
pip install git+https://github.com/ai4energy/esml-python
python solve.py "$ESML_HOME"
```

期望输出：

```
unknowns = 4604
engine = 1.9.0  docHash = 6ceecb619c46…  unitCoverage = {'complete': True, 'known': 4604, 'total': 4604}
iterations = 6  residual = 7.123e-13 (tolerance 2.03e-09)
b1.net.Vm = 1.0284201463
b1.net.Va = 0.1041501799
b2.net.Vm = 1.0353403863
b2.net.Va = 0.1353498384
```

`solve()` 是一次性调用：启动一个 `esml` 进程、读 JSON、结束，不保留状态。
需要常驻会话 / 滚动预测 / 快照恢复（DTIL）时，用商业版引擎。

## Julia

```julia
using Pkg
Pkg.add(url = "https://github.com/ai4energy/ESML.jl")
```

```bash
julia solve.jl "$ESML_HOME"
```

## 说明

- `-L library`（或客户端的 `libraries=[...]`）指向随包模型库；节点/支路模型都在里面。
- 结果按模型原值返回；IEEE 300 的 `net.Vm` 是标幺电压幅值、`net.Va` 是弧度
  相角，`unit="1"` 表示无量纲。
- 超限模型会在求解前响亮报错，并给出实际规模、上限和商业授权联系方式；不会静默降阶。
- 本教程只使用引擎核心（`solve`），学术版即可复现。
