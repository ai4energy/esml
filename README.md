# ESML — 能源系统建模语言

面向能源系统的声明式建模语言：模型编译为扁平方程系统，经结构分析与指标约简后
求解稳态、做时间积分。本仓是 ESML 引擎的**公开主页**：学术版二进制、快速上手、
授权说明与反馈入口。语言规范在
[`ai4energy/esml-language`](https://github.com/ai4energy/esml-language)。

## 安装

从 [最新发布](https://github.com/ai4energy/esml/releases) 下载学术版：

```bash
tar -xzf esml-academic-*-linux-x86_64.tar.gz
export PATH="$PWD/esml-academic-1.8.0-linux-x86_64:$PATH"
esml --version
```

包内包含引擎、物性后端（`libesml_mmprops_ffi.so`）与标准模型库 `library/`。

## Python 与 Julia

两个客户端均为 **MIT**，通过公开的 `esml.*/v1` JSON 协议调用引擎，不含引擎代码。
公开面是**一次性调用**（每次一个进程，不保留状态）：

```bash
pip install git+https://github.com/ai4energy/esml-python
```

```julia
using Pkg
Pkg.add(url = "https://github.com/ai4energy/ESML.jl")
```

```python
from esml import simulate, solve

print(solve("quickstart/decay.esml", system="S").values)
traj = simulate("quickstart/decay.esml", (0.0, 1.0), 20,
                observe=["m.x"], system="S")
print(traj.series["m.x"][-1])
```

```julia
using ESML

println(solve("quickstart/decay.esml"; system = "S").values)
traj = simulate("quickstart/decay.esml", (0.0, 1.0), 20;
                observe = ["m.x"], system = "S")
println(traj.series["m.x"][end])
```

## 版本

| 版本 | 展平未知量 | 能力 |
| --- | --- | --- |
| **学术版**（公开下载） | ≤ 16,384 | 引擎核心（`solve` / `simulate` / `import` / `check`），学术/教学/个人非商业用途免费 |
| **商业版** | 无限制 | 完整能力，含常驻数字孪生（DTIL）会话；商业用途需授权 |

学术版覆盖课程与中小规模模型（例如 IEEE 14 节点：220 未知量）。超限模型在求解前
**响亮报错**，报实际规模、上限与联系方式，绝不静默降阶。

## 许可

- **Python 客户端** [`esml-python`](https://github.com/ai4energy/esml-python)：MIT。
- **Julia 客户端** [`ESML.jl`](https://github.com/ai4energy/ESML.jl)：MIT。
- **ESML 引擎**（本仓分发的二进制）：**商业软件，不是 MIT**。学术版非商业用途免费；
  商业用途需取得商业许可 —— **mingtao.li@gmail.com**。

完整条款见 [`LICENSE.md`](LICENSE.md)。

## 反馈

我们想知道你在建什么模型、卡在哪一步：

- [提交反馈 issue](https://github.com/ai4energy/esml/issues/new?template=feedback.md)
- [Discussions](https://github.com/ai4energy/esml/discussions) 提问与交流
- 邮件 **mingtao.li@gmail.com**

安装、第一个模型、第一条报错这类「第一英里」问题按 bug 处理。

## 状态

首发目标平台为 Linux x86_64。Windows / macOS 构建与物性内核的 Python / Julia
薄壳在路线图上；MIT 客户端在对应平台的 `esml` 二进制出现后即可使用。
