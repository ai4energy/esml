# 20 分钟演讲：ESML × MMPROPS

## 文件

- `ESML-MMPROPS-20min.pptx` —— 15 页（14 页正文 + 1 页备份），带演讲备注。
- `script.md` —— 逐页讲稿、时间点、预设问答。
- `preview/` —— 每页 PNG 预览 + `contact-sheet.png`（4×4 联系表）。
- `build_deck.py` —— 生成脚本（python-pptx + Pillow 预览）。
- `qr-*.png` —— 下载与反馈二维码。

## 结构（为什么这样排）

1. **问题**（2 页）：先让听众认领痛点，再给两个引擎。
2. **ESML**（3 页）：编译链 → 模型长什么样 → 为什么不是脚本。
3. **实测**（2 页）：IEEE 300 数字 + Python/Julia 客户端。
4. **MMPROPS**（2 页）：五个子命令 + 实测值/失败语义。
5. **工程可信度**（2 页）：测试/闸门 + XSD。
6. **分发**（3 页）：许可边界 → 谁适合 → 行动。
7. **备份**（1 页）：命令清单，Q&A 用。

## 设计

- 16:9；深绿标题页 + 白底内容页；薄荷色卡片；深色代码块。
- 中文 Noto Sans CJK；代码 DejaVu Sans Mono。
- 每页一个观点；数字都能在教程/发布包里复跑。
- 主动说边界（学术版上限、无 DTIL、Linux），不回避。

## 重新生成

```bash
# 依赖：python-pptx、Pillow、qrcode；系统里有 Noto Sans CJK 与 DejaVu Sans Mono
python3 build_deck.py
```

生成后会覆盖 `ESML-MMPROPS-20min.pptx` 和 `preview/`。

## 使用建议

- 20 分钟正文按 `script.md` 的时间点走；超时就砍 S5 或 S10 的细节，不要砍实测与边界。
- 现场演示只留 S6 一条命令；其余用截图/代码块，避免环境问题。
- 结尾让听众扫一个码即可；三个码不要都讲。
