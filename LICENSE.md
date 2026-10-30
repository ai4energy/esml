# License / 许可

## 1. ESML 引擎（二进制）⇒ **商业软件**

Copyright (c) 2026 Mingtao Li (云崖箫客) @ Ai4Energy. All rights reserved.

本仓分发的 ESML 引擎（`esml` 二进制及其派生产物，含随附的物性后端与模型库）
是**商业软件，不适用 MIT 许可**。授权范围：

- **学术版（公开下载）：** 学术、教学、个人非商业用途免费，但展平未知量数
  不得超过 **16,384**。不得再分发，不得修改后再分发，不得用于商业产品或
  商业服务。
- **商业版：** 无规模限制，须另行取得商业许可。商业用途包括但不限于商业
  产品、对外交付、SaaS 托管、嵌入硬件/软件产品、以服务形式提供本引擎能力。
- 商业许可咨询：`mingtao.li@gmail.com`（Ai4Energy）。
- 未取得相应许可的使用，不在授权范围内。

## 2. 客户端绑定 ⇒ MIT

- [`ai4energy/esml-python`](https://github.com/ai4energy/esml-python)：MIT。
- [`ai4energy/ESML.jl`](https://github.com/ai4energy/ESML.jl)：MIT。

它们不含引擎代码，只通过公开的 `esml.session/v1` JSON 协议与引擎通信。

## 3. 第三方依赖

随附的第三方组件遵循其原始许可；本文件仅约束本项目自身的代码与二进制。
