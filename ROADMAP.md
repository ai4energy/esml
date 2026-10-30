# Roadmap

原则：**反馈驱动，能力慢慢长**。按真实需求的频次排序，不按“功能清单”堆。
投票/补充需求请到 [Discussions](https://github.com/ai4energy/esml/discussions)
或 [反馈页](https://www.ai4energy.cn/feedback/)。

## 已交付

- ESML 学术版（Linux x86_64，≤16,384 未知量，覆盖 IEEE 300）
- 商业版（无规模限制 + DTIL 常驻会话）
- MIT Python / Julia 一次性客户端
- IEEE 300 十分钟教程、FAQ、排错、烟测
- canonical XSD 与 XML 校验（`https://docs.ai4energy.cn/schema/`）

## 下一步候选（按需求投票）

1. **Windows / macOS 二进制** —— 采用面最大的缺口。
2. **更多导入格式** —— 按用户提供的真实语料决定优先级；语义无法证明的继续响亮拒收。
3. **更大规模与性能** —— 商业版方向：稀疏/并行/增量求解。
4. **DTIL 估计器与闭环** —— 商业版：测量 → 状态估计 → 预测/控制。
5. **教程与示例** —— 课程、电力、过程/热力三类场景，按反馈补。

## 不在公开范围

- worker / MCP / EMS 平台组件；
- 引擎源码；
- 学术版未包含的能力（DTIL、无规模限制）。

## 怎么影响这个列表

- 在 Discussions 里说明你的模型/规模/卡点；
- 开 issue 附最小复现；
- 邮件 mingtao.li@gmail.com（商业场景请说明部署方式）。
