# 采用度量

基线：**2026-10-30**

| 指标 | ESML | MMPROPS |
| --- | ---: | ---: |
| Release 下载（主包） | 4 | 1 |
| Star | 0 | 0 |
| Fork | 0 | 0 |
| Issue（全部） | 0 | 0 |
| Discussion | 1 | 1 |
| 外部跑通用户 | 0 | 0 |
| 反馈条数 | 0 | 0 |

目标（第一波，2 周）：**5 个跑通 / 10 条反馈 / 1 个课程或团队试点**。
不追曝光数字。

## 复跑命令

```bash
# 下载量
gh api repos/ai4energy/esml/releases \
  --jq '.[] | .tag_name as $t | .assets[] | "\($t) \(.name) \(.download_count)"'
gh api repos/ai4energy/mmprops/releases \
  --jq '.[] | .tag_name as $t | .assets[] | "\($t) \(.name) \(.download_count)"'

# star / fork
gh repo view ai4energy/esml --json stargazerCount,forkCount
gh repo view ai4energy/mmprops --json stargazerCount,forkCount

# issue / discussion
gh api 'repos/ai4energy/esml/issues?state=all' --jq 'length'
gh api graphql -f query='query { repository(owner:"ai4energy", name:"esml") {
  discussions(first:50) { totalCount } } }'
```

每周一记录一次；发布渠道后把链接补进 `status.md`。
