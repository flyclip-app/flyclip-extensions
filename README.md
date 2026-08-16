# FlyClip Extensions (官方扩展库)

[![FlyClip](https://img.shields.io/badge/FlyClip-Windows-blue.svg)](https://github.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Extensions](https://img.shields.io/badge/Extensions-40%2B-brightgreen.svg)]()

专为 **FlyClip (Windows 平台剪贴板/划词辅助神器)** 打造的官方开源扩展库。全面兼容 PopClip 格式规范，深度适配 Windows 平台生态。

---

## 🌟 特性亮点

- **🧩 40+ 常用扩展**：涵盖翻译查词、搜索引擎、AI 对话、文本处理、开发调试与电商媒体。
- **⚙️ 全功能选项支持 (Options)**：
  - **开关 (Toggle / Boolean)**：一键启用或禁用特定功能。
  - **分段/单选组 (Choice / Multiple)**：灵活切换翻译站点、目标语言、搜索分类、正则引擎等。
  - **文本输入 (Text / String)**：自定义分隔符、缩进格式或前缀。
  - **密钥凭据 (Secret / Password)**：安全存储 API Key、Token。
- **⚡ Windows 原生执行**：内置对 PowerShell 7/5.1 脚本、系统默认浏览器、Windows 键盘热键映射的原生支持。
- **📦 零依赖双向格式**：同时支持 `.flyclipext` / `.popclipext` 源码目录与 `.flyclipextz` 打包归档。

---

## 📂 扩展目录清单

### 1. 翻译与词典 (Translation & Dictionary)

| 扩展名称 | 标识符 | 描述 | 配置选项 (Options) |
| :--- | :--- | :--- | :--- |
| **GoogleTranslate** | `com.flyclip.extension.google-translate` | Google 翻译 | 翻译站点 (全球/国内/香港/日本/英国), 目标语言 (中文/英文/日文/韩文/法文/德文等) |
| **DeepLTranslate** | `com.flyclip.extension.deepl-translate` | DeepL 高质量翻译 | 目标语言 (中文/英文/日文/德文/法文/西班牙文/俄文/韩文) |
| **BaiduTranslate** | `com.flyclip.extension.baidu-translate` | 百度翻译 | 目标语言 (中文/英语/日语/韩语/法语/德语/西班牙语/俄语) |
| **YoudaoTranslate** | `com.flyclip.extension.youdao-dict` | 有道词典查词 | - |
| **Wikipedia** | `com.flyclip.extension.wikipedia` | 维基百科搜索 | 语言版本 (中文/英文/日文/德文/法文/西班牙文/俄文) |
| **MDNWebDocs** | `com.flyclip.extension.mdn-web-docs` | MDN Web 开发者文档 | 文档语言 (zh-CN, en-US, ja, fr, es) |
| **UrbanDictionary** | `com.flyclip.extension.urban-dictionary` | Urban 英语俚语词典 | - |

### 2. 搜索与 AI 智能 (Search & AI)

| 扩展名称 | 标识符 | 描述 | 配置选项 (Options) |
| :--- | :--- | :--- | :--- |
| **GoogleSearch** | `com.flyclip.extension.google-search` | Google 网页搜索 | 搜索域名 (google.com / google.com.hk / google.co.jp / google.co.uk) |
| **BaiduSearch** | `com.flyclip.extension.baidu-search` | 百度网页搜索 | - |
| **BingSearch** | `com.flyclip.extension.bing-search` | 微软必应搜索 | - |
| **DuckDuckGo** | `com.flyclip.extension.duckduckgo` | DuckDuckGo 隐私搜索 | - |
| **GitHubSearch** | `com.flyclip.extension.github-search` | GitHub 搜索 | 搜索类型 (代码仓库/代码/Issues/提交/开发者) |
| **ChatGPT** | `com.flyclip.extension.chatgpt` | ChatGPT 智能问答 | - |
| **Claude** | `com.flyclip.extension.claude` | Anthropic Claude 对话 | - |
| **DeepSeek** | `com.flyclip.extension.deepseek` | DeepSeek 深度求索 AI | - |
| **ZhihuSearch** | `com.flyclip.extension.zhihu-search` | 知乎社区搜索 | - |
| **BilibiliSearch** | `com.flyclip.extension.bilibili-search` | 哔哩哔哩视频搜索 | - |
| **YouTubeSearch** | `com.flyclip.extension.youtube-search` | YouTube 视频搜索 | - |

### 3. 文本处理与转换 (Text Tools & PowerShell)

| 扩展名称 | 标识符 | 描述 | 包含动作 / 选项 |
| :--- | :--- | :--- | :--- |
| **CaseConverter** | `com.flyclip.extension.case-converter` | 大小写与命名风格转换 | 大写 (UPPER), 小写 (lower), 词首大写 (Title), 驼峰 (camelCase), 下划线 (snake_case), 连字符 (kebab-case) |
| **Base64** | `com.flyclip.extension.base64` | Base64 编码与解码 | Base64 编码, Base64 解码 \| 选项: URL 安全模式 (使用 `-` 与 `_`) |
| **URLEncode** | `com.flyclip.extension.url-encode` | URL 百分号编码与解码 | URL 编码, URL 解码 |
| **HTMLEncode** | `com.flyclip.extension.html-encode` | HTML 实体转义与反转义 | HTML 转义 (`&lt;`), HTML 反转义 |
| **JSONFormatter** | `com.flyclip.extension.json-formatter` | JSON 格式化与单行压缩 | 格式化 JSON, 压缩 JSON |
| **TextStatistics** | `com.flyclip.extension.text-statistics` | 选中文本字数统计 | 统计字符数、词数、行数、字节大小并在提示条展示 |
| **SortLines** | `com.flyclip.extension.sort-lines` | 多行文本排序与去重 | 升序排序 (A-Z), 降序排序 (Z-A), 唯一去重 (Unique) \| 选项: 区分大小写 |
| **JoinLines** | `com.flyclip.extension.join-lines` | 多行合并为单行 | 合并为单行 \| 选项: 分隔符 (逗号空格 / 纯逗号 / 空格 / 分号) |
| **RemoveSpaces** | `com.flyclip.extension.remove-spaces` | 空格处理 | 压缩连续空格, 消除所有空格 |
| **FullHalfWidth** | `com.flyclip.extension.full-half-width` | 全角半角转换 | 全角转半角 (Full to Half), 半角转全角 (Half to Full) |
| **TimestampConvert** | `com.flyclip.extension.timestamp-converter` | Unix 时间戳转换 | 10位/13位时间戳转日期, 获取当前时间戳 |
| **MarkdownTools** | `com.flyclip.extension.markdown-tools` | 常用 Markdown 语法修饰 | 粗体 (`**text**`), 行内代码 (`` `code` ``), 代码块 (```` ```code``` ````), 引用 (`> quote`) |

### 4. 开发者工具 (Developer Tools)

| 扩展名称 | 标识符 | 描述 | 包含动作 / 选项 |
| :--- | :--- | :--- | :--- |
| **Calculate** | `com.flyclip.extension.calculate` | 表达式数学计算 | 计算选中数学表达式 (如 `128*1024`, `(50+20)/3`) 并即时显示结果 |
| **RegexTest** | `com.flyclip.extension.regex101` | Regex101 正则测试 | 在 Regex101 打开 \| 选项: 正则引擎分支 (PCRE2, JS, Python, Go, Rust) |
| **IPLookup** | `com.flyclip.extension.ip-lookup` | IP 地址查询与 WHOIS | 查询 IP 归属地与 ASN 信息 \| 选项: 查询平台 (IPInfo / IP138 / BGP.HE) |
| **HashGenerator** | `com.flyclip.extension.hash-generator` | 哈希值计算 | MD5 计算, SHA256 计算 \| 选项: 输出大写十六进制 |
| **SearchIcons** | `com.flyclip.extension.iconify-search` | Iconify 矢量图标库搜索 | 搜索超过 200,000 个开源矢量图标 |

### 5. 电商与媒体 (E-Commerce & Media)

| 扩展名称 | 标识符 | 描述 | 配置选项 (Options) |
| :--- | :--- | :--- | :--- |
| **JD** | `com.flyclip.extension.jd-search` | 京东商品搜索 | - |
| **Taobao** | `com.flyclip.extension.taobao-search` | 淘宝商品搜索 | - |
| **Douban** | `com.flyclip.extension.douban-search` | 豆瓣搜索 | 搜索分类 (电影 / 图书 / 音乐) |
| **IMDb** | `com.flyclip.extension.imdb` | IMDb 影视演员搜索 | - |
| **Amazon** | `com.flyclip.extension.amazon` | 亚马逊全球商城搜索 | 亚马逊商城站点 (US / 中国 / 日本 / 英国 / 德国) |

---

## 🚀 安装与使用方法

### 方式一：一键快速安装 (PowerShell)

在当前仓库根目录下打开 PowerShell，执行：

```powershell
# 1. 安装全部 40+ 个扩展到 FlyClip:
.\scripts\install.ps1

# 2. 或者只安装指定的扩展:
.\scripts\install.ps1 GoogleTranslate, DeepLTranslate, CaseConverter
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

### 脚本动作 (PowerShell / Shell Script)

```yaml
name: 大写转换
identifier: com.flyclip.extension.uppercase
actions:
  - title: 转换为大写
    shell script: Write-Host -NoNewline $env:FLYCLIP_TEXT.ToUpper()
    requirements: [text]
    after: paste-result
```

- **注入的环境变量**：
  - `$env:FLYCLIP_TEXT` / `$env:POPCLIP_TEXT`：用户选中的文本。
  - `$env:FLYCLIP_OPTION_<IDENTIFIER>`：用户在设置中配置的选项值。
- **后续步骤 (After Steps)**：
  - `paste-result`：用脚本输出直接替换/粘贴选中文本。
  - `show-result`：在划词栏或浮动气泡中展示输出。
  - `copy-result`：将输出复制到剪贴板。

---

## 🔧 仓库开发脚本

- **验证扩展合法性**：
  ```powershell
  .\scripts\validate.ps1
  ```
- **一键打包所有扩展为 `.flyclipextz`**：
  ```powershell
  .\scripts\pack.ps1
  ```

---

## 📄 开源许可证

本项目采用 [MIT 许可证](LICENSE)。
