# 第一波投放（2026-10-30）

目标不是“发出去”，是**换回真实反馈**：5 个跑通的外部用户、10 条具体反馈、
1 个课程/团队试点。所有文案中文，避免第三方商业公司名，不暴露实现语言。

## 素材

| 文件 | 用途 |
| --- | --- |
| `posts/ieee300.md` | IEEE 300 潮流教程（主推） |
| `posts/mmprops-water-vle.md` | 水蒸汽 + 二元相包络教程 |
| `posts/xsd.md` | XSD / XML 校验（标准与开发者向） |
| `posts/short-blurbs.md` | 知乎/公众号/LinkedIn/群聊/邮件短版 |
| `feedback/survey.md` | 反馈问卷与访谈邀请 |
| `talk/` | 20 分钟演讲 PPT、逐页讲稿、预览与二维码 |

## 渠道与节奏

| 时间 | 渠道 | 发什么 |
| --- | --- | --- |
| Day 0 | 站内 `/feedback/`、GitHub Discussions、置顶 issue | 反馈入口 |
| Day 1 | 知乎、微信公众号 | IEEE 300 长文 |
| Day 1 | Julia Discourse、Python 科学计算社区 | IEEE 300 + MMPROPS 教程（短版） |
| Day 2 | 过程/热力/能源微信群、邮件 | MMPROPS 长文/短版 |
| Day 2 | 5 位课程老师/团队负责人 | 邮件模板（短版第 5 条） |
| Day 3–7 | 全渠道 | 24h 内首响；把高频问题补进 FAQ/TROUBLESHOOTING |

## 度量

- GitHub release 下载量（`gh api repos/.../releases` 的 `download_count`）
- PyPI 下载（上架后）、star/fork、issue/Discussion 数
- 反馈问卷份数、愿意访谈人数、首次跑通用时
- 7 日留存：同一用户是否第二次提问/使用

目标：**5 个跑通 / 10 条反馈 / 1 个试点**；不追曝光数字。

## 红线

- 不写“替代某商业软件”，不出现第三方公司名。
- 不承诺学术版没有的能力（DTIL、无规模限制、Windows/macOS）。
- 所有数字必须能复跑；引用教程里的实测值。
- 反馈 24h 首响；“第一英里”问题按 bug 处理。
