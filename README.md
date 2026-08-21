# FlyClip Extensions (官方扩展库)

[![FlyClip](https://img.shields.io/badge/FlyClip-Windows-blue.svg)](https://github.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Extensions](https://img.shields.io/badge/Extensions-95%2B-brightgreen.svg)]()

专为 **FlyClip (Windows 平台剪贴板/划词辅助神器)** 打造的原生官方扩展库。

### 💡 设计理念：原生 `.flyclipext` 标准 + 极低迁移成本
- **原生标准**：本仓库所有扩展均采用 FlyClip 原生的 **`.flyclipext`**（包目录）与 **`.flyclipextz`**（单文件安装包）格式。
- **一致的心智模型与近乎零的迁移成本**：FlyClip 扩展的语法结构与 PopClip 保持高度一致（声明式 YAML、输入/输出流、动作管道、参数选项）。开发者或用户可以将 macOS PopClip 上的优秀扩展思路、URL 规则、正则匹配无缝复刻为 Windows `.flyclipext` 原生扩展，且语法天然兼容！

---

## 🌟 特性亮点

- **🧩 95+ 款丰富原生扩展**：涵盖翻译查词、搜索引擎、学术论文、AI 智能、文本处理与清洗、开发者全栈工具、云笔记联动、影音与电商。
- **⚙️ 全功能选项支持 (Options)**：
  - **开关 (Toggle / Boolean)**：一键启用或禁用特定功能。
  - **分段/单选组 (Choice / Multiple)**：灵活切换翻译站点、目标语言、搜索分类、正则引擎等。
  - **文本输入 (Text / String)**：自定义分隔符、缩进格式或前缀。
  - **密钥凭据 (Secret / Password)**：安全存储 API Key、Token。
- **⚡ Windows 原生执行**：深度集成 PowerShell 7/5.1、系统默认浏览器及 Windows 键盘热键映射。
- **🔄 双向语法别名支持**：原生优先使用 `FLYCLIP_*` 与 `{flyclip text}`，同时完全兼容 PopClip 的 `POPCLIP_*` 与 `{popclip text}` 语法。
- **🤖 官方 AI 开发 Skill**：内置完整扩展开发 Skill 说明文件（[`SKILL.md`](./SKILL.md)），支持直接导入 Cursor、Claude、ChatGPT、Antigravity、Cline 等 AI 工具，一句话自动生成生产级扩展！

---

## 🤖 让 AI 帮你定制开发扩展 (AI Developer Skill)

本项目提供专为大模型定制的 **FlyClip Extension Developer Skill**（位于 [`SKILL.md`](./SKILL.md) 或 [`skills/flyclip-extension-developer/SKILL.md`](./skills/flyclip-extension-developer/SKILL.md)）。

### 如何使用 AI Skill 开发扩展？

1. **在 AI 助手 (Cursor / Claude / ChatGPT / Antigravity / Windsurf / Cline) 中导入 Skill**：
   * **方式 A（直接引用文件）**：将本项目根目录的 [`SKILL.md`](./SKILL.md) 加入 AI 的上下文规则（Context / System Prompt / Skill）。
   * **方式 B（在线链接引用）**：向 AI 发送 Skill 链接：
     `https://raw.githubusercontent.com/flyclip-app/flyclip-extensions/main/SKILL.md`
2. **给 AI 发送需求 Prompt**：
   * 💬 *"帮我写一个 FlyClip 扩展：选中文本后调用 DeepSeek API 进行文案润色，并在设置里支持配置 API Key。"*
   * 💬 *"帮我写一个 FlyClip 扩展：选中 Commit Hash（如 7 位以上十六进制）时在浏览器打开 GitHub 提交页。"*
   * 💬 *"帮我将这个 Python 文本清洗脚本转换成 FlyClip 的 JavaScript 扩展 Snippet。"*
3. **一秒安装验证**：
   * 复制 AI 生成的 `# flyclip` 开头的 YAML 代码段；
   * 在屏幕上选中该段代码，FlyClip 会自动弹出 **「安装扩展」** 提示气泡，点击即可立即生效！

---

## 📂 扩展目录清单 (95+ 款)

### 1. 翻译与语言 (Translation & Language)

| 扩展名称 | 标识符 | 描述 | 配置选项 / 包含动作 |
| :--- | :--- | :--- | :--- |
| **TradSim** | `com.flyclip.extension.traditional-simplified` | 简繁中文智能互转 | 简体转繁体, 繁体转简体 |
| **GoogleTranslate** | `com.flyclip.extension.google-translate` | Google 翻译 | 翻译站点 (全球/国内/香港/日本/英国), 目标语言 (中文/英文/日文/韩文/法文/德文等) |
| **DeepLTranslate** | `com.flyclip.extension.deepl-translate` | DeepL 高质量翻译 | 目标语言 (中文/英文/日文/德文/法文/西班牙文/俄文/韩文) |
| **BaiduTranslate** | `com.flyclip.extension.baidu-translate` | 百度翻译 | 目标语言 (中文/英语/日语/韩语/法语/德语/西班牙语/俄语) |
| **YoudaoTranslate** | `com.flyclip.extension.youdao-dict` | 有道词典查词 | - |
| **PotTranslate** | `com.flyclip.extension.pot-desktop` | Pot 跨平台划词翻译联动 | 翻译模式, OCR 模式, 朗读模式 |
| **STranslate** | `com.flyclip.extension.stranslate` | STranslate 划词翻译联动 | 文本翻译, OCR 识别 |
| **Wikipedia** | `com.flyclip.extension.wikipedia` | 维基百科搜索 | 语言版本 (中文/英文/日文/德文/法文/西班牙文/俄文) |
| **MDNWebDocs** | `com.flyclip.extension.mdn-web-docs` | MDN Web 开发者文档 | 文档语言 (zh-CN, en-US, ja, fr, es) |
| **UrbanDictionary** | `com.flyclip.extension.urban-dictionary` | Urban 英语俚语词典 | - |

### 2. 搜索、学术与社区 (Search, Academic & Community)

| 扩展名称 | 标识符 | 描述 | 配置选项 / 特性 |
| :--- | :--- | :--- | :--- |
| **GoogleSearch** | `com.flyclip.extension.google-search` | Google 网页搜索 | 搜索域名 (google.com / google.com.hk / google.co.jp 等) |
| **BaiduSearch** | `com.flyclip.extension.baidu-search` | 百度网页搜索 | - |
| **BingSearch** | `com.flyclip.extension.bing-search` | 微软必应搜索 | - |
| **DuckDuckGo** | `com.flyclip.extension.duckduckgo` | DuckDuckGo 隐私搜索 | - |
| **BraveSearch** | `com.flyclip.extension.brave-search` | Brave 独立隐私搜索 | - |
| **KagiSearch** | `com.flyclip.extension.kagi-search` | Kagi 高级无广告搜索 | - |
| **StartPage** | `com.flyclip.extension.startpage-search` | Startpage 匿名隐私搜索 | - |
| **EcosiaSearch** | `com.flyclip.extension.ecosia-search` | Ecosia 植树环保搜索 | - |
| **YandexSearch** | `com.flyclip.extension.yandex-search` | Yandex 搜索 | - |
| **GoogleScholar** | `com.flyclip.extension.google-scholar` | Google 学术论文检索 | - |
| **PubMed** | `com.flyclip.extension.pubmed` | PubMed 生物医药文献 | - |
| **Arxiv** | `com.flyclip.extension.arxiv-search` | arXiv 计算机/AI/数学预印本文献 | - |
| **WolframAlpha** | `com.flyclip.extension.wolfram-alpha` | Wolfram|Alpha 计算知识引擎 | - |
| **Xiaohongshu** | `com.flyclip.extension.xiaohongshu` | 小红书经验与好物搜索 | - |
| **TwitterSearch** | `com.flyclip.extension.twitter-search` | X (Twitter) 动态与话题搜索 | - |
| **RedditSearch** | `com.flyclip.extension.reddit-search` | Reddit 全球社区帖子搜索 | - |
| **HackerNews** | `com.flyclip.extension.hackernews-search` | Hacker News 深度技术热点检索 | - |
| **MediumSearch** | `com.flyclip.extension.medium-search` | Medium 博客与技术专栏搜索 | - |
| **V2EXSearch** | `com.flyclip.extension.v2ex-search` | V2EX 程序员创意社区搜索 | - |
| **ZhihuSearch** | `com.flyclip.extension.zhihu-search` | 知乎社区搜索 | - |
| **BilibiliSearch** | `com.flyclip.extension.bilibili-search` | 哔哩哔哩视频搜索 | - |
| **YouTubeSearch** | `com.flyclip.extension.youtube-search` | YouTube 视频搜索 | - |
| **ChatGPT** | `com.flyclip.extension.chatgpt` | ChatGPT 智能问答 | - |
| **Claude** | `com.flyclip.extension.claude` | Anthropic Claude 对话 | - |
| **DeepSeek** | `com.flyclip.extension.deepseek` | DeepSeek 深度求索 AI | - |

### 3. 文本处理与清洗 (Text Tools & Cleaning)

| 扩展名称 | 标识符 | 描述 | 包含动作 / 选项 |
| :--- | :--- | :--- | :--- |
| **CaseConverter** | `com.flyclip.extension.case-converter` | 大小写与命名风格转换 | 大写, 小写, 词首大写, 驼峰, 下划线, 连字符 |
| **LinkCleaner** | `com.flyclip.extension.link-cleaner` | 链接参数清洗 | 自动剔除 `utm_*`, `spm`, `ref`, `fbclid` 等追踪参数 |
| **OpenURLs** | `com.flyclip.extension.open-urls` | 批量打开链接 | 正则提取文本中全部网址并在默认浏览器批量打开 |
| **CopyURLs** | `com.flyclip.extension.copy-urls` | 提取所有网址 | 提取全部 URL 并整理为换行清单存入剪贴板 |
| **SumNumbers** | `com.flyclip.extension.sum-numbers` | 数字提取与统计 | 自动提取数字并计算总和、均值、项数与极值 |
| **Slugify** | `com.flyclip.extension.slugify` | URL 别名化 (Slug) | 生成符合 URL 标准的短横线 slug 文本 |
| **CommaList** | `com.flyclip.extension.comma-list` | 逗号列表与换行互转 | 逗号转多行, 多行合并为逗号分隔 |
| **ShuffleLines** | `com.flyclip.extension.shuffle-lines` | 随机打乱多行 | Fisher-Yates 洗牌算法随机排列多行文本 |
| **ReverseLines** | `com.flyclip.extension.reverse-lines` | 多行倒序排列 | 文本自底向上颠倒逆序 |
| **PoorText** | `com.flyclip.extension.poor-text` | 纯文本脱色/去样式 | 清除 HTML 标签、富文本样式与多余空白 |
| **Base64** | `com.flyclip.extension.base64` | Base64 编码与解码 | Base64 编码, Base64 解码 | 选项: URL 安全模式 |
| **URLEncode** | `com.flyclip.extension.url-encode` | URL 百分号编码与解码 | URL 编码, URL 解码 |
| **HTMLEncode** | `com.flyclip.extension.html-encode` | HTML 实体转义与反转义 | HTML 转义 (`&lt;`), HTML 反转义 |
| **JSONFormatter** | `com.flyclip.extension.json-formatter` | JSON 格式化与单行压缩 | 格式化 JSON, 压缩 JSON |
| **TextStatistics** | `com.flyclip.extension.text-statistics` | 选中文本字数统计 | 统计字符数、词数、行数、字节大小并在提示条展示 |
| **SortLines** | `com.flyclip.extension.sort-lines` | 多行文本排序与去重 | 升序排序 (A-Z), 降序排序 (Z-A), 唯一去重 (Unique) |
| **JoinLines** | `com.flyclip.extension.join-lines` | 多行合并为单行 | 合并为单行 | 选项: 分隔符自定义 |
| **RemoveSpaces** | `com.flyclip.extension.remove-spaces` | 空格处理 | 压缩连续空格, 消除所有空格 |
| **FullHalfWidth** | `com.flyclip.extension.full-half-width` | 全角半角转换 | 全角转半角, 半角转全角 |
| **Cut** | `com.flyclip.extension.cut` | 剪切选中文本 | 剪切选中文本到系统剪贴板 |
| **TimestampConvert** | `com.flyclip.extension.timestamp-converter` | Unix 时间戳转换 | 10位/13位时间戳转日期, 获取当前时间戳 |
| **ROT13** | `com.flyclip.extension.rot13` | ROT13 密文转换 | 经典字母位移加密/解密 |
| **ShortenLink** | `com.flyclip.extension.shorten-link` | is.gd 短链接生成 | 将长网址缩短为便携短链 |
| **MarkdownTools** | `com.flyclip.extension.markdown-tools` | 常用 Markdown 语法修饰 | 粗体 (`**text**`), 行内代码, 代码块, 引用 |

### 4. 开发者与工程工具 (Developer & Engineering)

| 扩展名称 | 标识符 | 描述 | 包含动作 / 选项 |
| :--- | :--- | :--- | :--- |
| **Calculate** | `com.flyclip.extension.calculate` | 表达式数学计算 | 计算选中数学表达式 (如 `128*1024`, `(50+20)/3`) 并即时显示结果 |
| **RegexTest** | `com.flyclip.extension.regex101` | Regex101 正则测试 | 在 Regex101 打开 | 选项: 正则引擎分支 |
| **RegExr** | `com.flyclip.extension.regexr` | RegExr 正则分析 | 在 RegExr 进行实时测试与可视化解析 |
| **IPLookup** | `com.flyclip.extension.ip-lookup` | IP 地址查询与 WHOIS | 查询 IP 归属地与 ASN 信息 |
| **HashGenerator** | `com.flyclip.extension.hash-generator` | 哈希值计算 | MD5 计算, SHA256 计算 |
| **SearchIcons** | `com.flyclip.extension.iconify-search` | Iconify 矢量图标库搜索 | 搜索超过 200,000 个开源矢量图标 |
| **StackOverflow** | `com.flyclip.extension.stackoverflow` | Stack Overflow 问答搜索 | 检索程序员问答社区 |
| **DevDocs** | `com.flyclip.extension.devdocs` | DevDocs 聚合 API 文档 | 聚合查询各大语言与库文档 |
| **NPM** | `com.flyclip.extension.npm-search` | npm 开源包检索 | 检索 JavaScript / TypeScript npm 包 |
| **PyPI** | `com.flyclip.extension.pypi-search` | PyPI Python 包检索 | 检索 Python 官方包 |
| **CratesIO** | `com.flyclip.extension.crates-io` | Crates.io Rust 包检索 | 检索 Rust 官方 Crates 库 |
| **DockerHub** | `com.flyclip.extension.dockerhub` | Docker Hub 镜像搜索 | 检索官方与社区 Docker 容器镜像 |
| **CanIUse** | `com.flyclip.extension.caniuse` | Can I Use 浏览器兼容性 | 查询 Web API / CSS / HTML 浏览器支持表 |
| **CyberChef** | `com.flyclip.extension.cyberchef` | CyberChef 数据分析工具 | 快速投递到瑞士军刀进行高级编解码 |
| **DOIResolver** | `com.flyclip.extension.doi-resolver` | DOI 文献解析 | 在 doi.org 直达学术出版文献 |

### 5. 云笔记、稍后读、影音与生活 (Notes, Media & Shopping)

| 扩展名称 | 标识符 | 描述 | 配置选项 / 包含动作 |
| :--- | :--- | :--- | :--- |
| **ObsidianCapture** | `com.flyclip.extension.obsidian-capture` | Obsidian 快速笔记捕获 | 通过 `obsidian://` 协议将划词保存到 Vault 笔记库 |
| **NotionWeb** | `com.flyclip.extension.notion-search` | Notion 工作区搜索 | 全文检索 Notion 页面与工作区 |
| **TodoistQuickTask** | `com.flyclip.extension.todoist-task` | Todoist 快速创建待办 | 将选中文本添加为待办任务 |
| **RaindropBookmark** | `com.flyclip.extension.raindrop-bookmark` | Raindrop.io 云书签保存 | 一键收藏链接至 Raindrop.io |
| **PocketSave** | `com.flyclip.extension.pocket-save` | Pocket 稍后读保存 | 一键将文章添加至 Pocket |
| **WaybackMachine** | `com.flyclip.extension.wayback-machine` | 网页时光机历史快照 | 查看历史存档或提交即时快照备份 |
| **ArchiveToday** | `com.flyclip.extension.archive-today` | Archive.today 网页快照 | 永久归档并绕过阅读限制 |
| **ConvertCurrency** | `com.flyclip.extension.convert-currency` | 实时货币汇率换算 | 支持人民币、美元、欧元、日元、英镑、港币 |
| **GoogleMaps** | `com.flyclip.extension.google-maps` | Google 地图搜索 | 检索全球地理位置与路线 |
| **OpenStreetMap** | `com.flyclip.extension.openstreetmap` | OpenStreetMap 开放地图 | 检索开放街道地图 |
| **AmapSearch** | `com.flyclip.extension.amap-search` | 高德地图位置搜索 | 检索国内精准地址与商户 |
| **JD** | `com.flyclip.extension.jd-search` | 京东商品搜索 | - |
| **Taobao** | `com.flyclip.extension.taobao-search` | 淘宝商品搜索 | - |
| **EbaySearch** | `com.flyclip.extension.ebay-search` | eBay 全球商品搜索 | - |
| **Amazon** | `com.flyclip.extension.amazon` | 亚马逊全球商城搜索 | 亚马逊商城站点 (US / 中国 / 日本 / 英国 / 德国) |
| **Douban** | `com.flyclip.extension.douban-search` | 豆瓣搜索 | 搜索分类 (电影 / 图书 / 音乐) |
| **IMDb** | `com.flyclip.extension.imdb` | IMDb 影视演员搜索 | - |
| **Goodreads** | `com.flyclip.extension.goodreads` | Goodreads 图书与书评搜索 | - |
| **RottenTomatoes** | `com.flyclip.extension.rotten-tomatoes` | 烂番茄影视评分搜索 | - |
| **SpotifySearch** | `com.flyclip.extension.spotify-search` | Spotify 音乐与播客搜索 | - |

---

## 🚀 安装与使用方法

### 方式一：一键快速安装 (PowerShell)

在当前仓库根目录下打开 PowerShell，执行：

```powershell
# 1. 安装全部 95+ 个扩展到 FlyClip:
.\scripts\install.ps1

# 2. 或者只安装指定的扩展:
.\scripts\install.ps1 GoogleTranslate, DeepLTranslate, TradSim, LinkCleaner
```

安装脚本会自动将扩展安装至 `%APPDATA%\flyclip\extensions\`。

### 方式二：手动复制安装

1. 打开 FlyClip 设置窗口，切换到 **「扩展」** 分页，点击底部的 **「打开扩展文件夹」**。
2. 将本仓库 `extensions/` 目录下所需的 `.flyclipext` 文件夹复制到该目录中。
3. 也可以将 `dist/` 目录中的 `.flyclipextz` 压缩包直接拖入该目录，FlyClip 启动时会自动解压加载。

---

## 🛠️ 扩展开发指南

每个 FlyClip 扩展均为一个以 `.flyclipext` 结尾的文件夹，其核心配置文件为 `Config.yaml`（或 `Config.json` / `Config.plist`）。

### 最小示例 (URL 搜索)

```yaml
name: 百度搜索
identifier: com.flyclip.extension.baidu-search
description: 使用百度搜索选中的关键词
icon: iconify:simple-icons:baidu
actions:
  - title: 百度
    url: https://www.baidu.com/s?wd=***
    requirements: [text]
```

### 带选项 (Options) 的示例

```yaml
name: Google Translate
identifier: com.flyclip.extension.google-translate
description: Google 翻译选中文本
icon: iconify:simple-icons:googletranslate
options:
  - identifier: site
    label: 翻译站点
    type: multiple
    values:
      - translate.google.com
      - translate.google.cn
    value labels:
      - Global (translate.google.com)
      - China (translate.google.cn)
    default value: translate.google.com

actions:
  - title: Google Translate
    url: https://{flyclip option site}/?sl=auto&tl=zh-CN&text={flyclip text}
    requirements: [text]
```

### 选项类型 (Option Types) 说明

| 选项类型 | YAML 声明 | 示例配置 | 说明 |
| :--- | :--- | :--- | :--- |
| **开关 (Toggle)** | `type: boolean` | `default value: false` | 渲染为开/关 Switch 控件 |
| **多选组 (Choice)** | `type: multiple` | `values: [a, b]`<br>`value labels: [选项A, 选项B]` | 渲染为分段按钮 Chips 控件 |
| **文本输入 (Text)** | `type: string` | `multiline: false` (或 `true`) | 渲染为单行或多行文本输入框 |
| **密钥凭据 (Secret)** | `type: secret` | - | 用于 API Key 等敏感信息输入 |

---

## 📄 开源许可证

本项目基于 [MIT License](LICENSE) 开源。
