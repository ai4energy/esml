# 把 ESML 的 XSD 挂到公网：XML 模型终于可以一条命令校验

声明式建模语言如果没有公开的 schema，XML 模型就只能靠“跑一遍引擎看看对
不对”。我们把 ESML 的 canonical XSD 发布到了站内，任何 XML 工具都能直接校验。

## 地址

- 说明页：https://docs.ai4energy.cn/schema/
- 轻量入口：https://docs.ai4energy.cn/schema/esml-v1.xsd
- 内容校验（推荐）：https://docs.ai4energy.cn/schema/esml-canonical-basic.xsd

`canonical-basic` 通过相对路径 include 公共类型与计算子集，校验时把这三个
文件放在同一目录即可。

## 校验示例

```bash
mkdir -p schema && cd schema
curl -O https://docs.ai4energy.cn/schema/esml-canonical-common.xsd
curl -O https://docs.ai4energy.cn/schema/esml-canonical-compute.xsd
curl -O https://docs.ai4energy.cn/schema/esml-canonical-basic.xsd
xmllint --noout --schema esml-canonical-basic.xsd ../model.esml
```

Python + lxml：

```python
import urllib.request
from pathlib import Path
from lxml import etree

base = "https://docs.ai4energy.cn/schema/"
for name in (
    "esml-canonical-common.xsd",
    "esml-canonical-compute.xsd",
    "esml-canonical-basic.xsd",
):
    Path(name).write_bytes(urllib.request.urlopen(base + name).read())

schema = etree.XMLSchema(etree.parse("esml-canonical-basic.xsd"))
doc = etree.parse("model.esml")
print(schema.validate(doc))
for error in schema.error_log:
    print(error)
```

实测：IEEE 300 用例 `case300.comp.esml` 对 `esml-v1.xsd` 与
`esml-canonical-basic.xsd` 均通过（0 error）。

## 为什么这件事重要

- **工具链**：编辑器、CI、模型仓库都能在入库前做结构校验，不必启动求解器。
- **可移植**：schema 不依赖任何语言实现；命名空间固定为
  `https://www.ai4energy.cn/esml/v1`。
- **可讨论**：规范正文、conformance 语料与变更记录都在公开仓
  https://github.com/ai4energy/esml-language。

XSD 随语言规范以 **MIT** 发布；引擎二进制与运行时是商业软件（学术/教学/
个人非商业免费，商业用途需授权）。

## 反馈

- 规范仓：https://github.com/ai4energy/esml-language
- 反馈：https://github.com/ai4energy/esml/issues/new?template=feedback.md
- 邮件：mingtao.li@gmail.com
