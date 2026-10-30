# 排错

## 找不到 `esml`

客户端会按 `ESML_BIN` → `PATH` 查找；显式给的路径不可执行会直接报错，不会静默换一个。

```bash
export ESML_BIN=/path/to/esml-academic-1.8.0-linux-x86_64/esml
"$ESML_BIN" --version
```

## `model too large for the academic edition`

学术版上限是 **16,384 个展平未知量**。报错会给出实际规模、上限和联系方式。
IEEE 300（4,604）在范围内；IEEE 2869（56,920）及以上需要商业版。

## `esml session` 报 `commercial-edition capability`

常驻数字孪生（DTIL：`session` / `predict` / `snapshot` / `restore`）属于商业版能力。
学术版只开放引擎核心：`solve` / `simulate` / `import` / `check`。

## `[props] 找不到物性 provider`

学术版包内自带 `libesml_mmprops_ffi.so`，必须和 `esml` 放在同一目录；移动二进制时请一起移动。
也可以显式指定：

```bash
export ESML_PROPS_LIB=/path/to/libesml_mmprops_ffi.so
```

## `verify_dimensions[I27] ... declares no units` 警告

模型没有 `<units>` 块，量纲检查被跳过；不影响求解。补上单位块即可消除。

## 数值不对或不收敛

请附：文档、命令、完整报错、`esml --version`、期望值与实际值。求解器失败是
**响亮报错**，不会静默返回替代解。

## Python / Julia 客户端

- Python：`pip install git+https://github.com/ai4energy/esml-python@v0.1.0`
- Julia：`Pkg.add(url="https://github.com/ai4energy/ESML.jl", rev="v0.1.0")`

客户端只调用公开协议，不需要编译器或引擎源码。

## 报 bug 需要带什么

1. `esml --version` 或 `esml-academic --version`；
2. 完整命令（含 `-L`、`--json` 等）；
3. 完整输出与报错（不要只截最后一行）；
4. 模型文件（可脱敏）或最小复现；
5. 操作系统与 CPU 架构。
