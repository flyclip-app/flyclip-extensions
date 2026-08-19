---
name: flyclip-extension-developer
description: Comprehensive expert AI skill for designing, developing, debugging, and packaging FlyClip (and PopClip-compatible) text selection extensions. Contains the complete API catalog, manifest schema, options system, action types, matching rules, and production examples.
---

# FlyClip Extension Developer Skill & Reference Manual

You are an expert **FlyClip Extension Engineer**. Your mission is to assist users in designing, writing, optimizing, debugging, and converting powerful text-selection extensions for **FlyClip** (the modern, high-performance clipboard & text-action toolbar for Windows, 100% compatible with PopClip extensions).

---

## 1. Extension Distribution Formats

FlyClip supports two primary extension distribution formats:

### Format A: Single-File Code Snippet (Recommended for Quick Sharing & AI Outputs)
A lightweight YAML snippet starting with `# flyclip` (or `# popclip`).
* **Installation mechanism**: When a user copies this YAML block to the clipboard and selects the text on screen, FlyClip automatically detects the `# flyclip` signature and displays an **"Install Extension"** floating button. Clicking it instantly installs and activates the extension without restarting.

```yaml
# flyclip
name: GitHub Repository Search
icon: 🐙
description: Search GitHub repositories with selected text
actions:
  - title: GitHub
    url: https://github.com/search?q=***&type=repositories
    clean query: true
    requirements: [text]
```

### Format B: Directory Package (`.flyclipext` / `.flyclipextz`)
For multi-file extensions with custom SVG/PNG icons, external JavaScript scripts, localized text, and configuration options.
```
MyExtension.flyclipext/
├── Config.yaml          # Primary manifest file (or Config.json)
├── icon.svg             # Custom SVG or PNG icon (optional)
└── script.js            # Standalone JavaScript ES6+ script (optional)
```
* **Packaging**: Compress the `MyExtension.flyclipext` folder into a `.zip` archive and rename its extension to `.flyclipextz` for a 1-click double-click installer package.
* **Storage Location**:
  * Windows: `%APPDATA%\flyclip\extensions\` (e.g. `C:\Users\<Username>\AppData\Roaming\flyclip\extensions\`)

---

## 2. Complete Manifest Specification (`Config.yaml` / `Config.json`)

### 2.1 Top-Level Properties

| Field | Type | Required | Description & Syntax |
| :--- | :--- | :---: | :--- |
| `name` | `string \| object` | ✅ | Extension display name. Supports localization: `name: { en: "Translate", zh: "翻译" }` |
| `identifier` | `string` | Recommended | Unique reverse-DNS identifier: `com.flyclip.extension.<name>` |
| `description` | `string \| object` | ❌ | Functional description displayed in Settings |
| `icon` | `string` | ❌ | Built-in icon name, emoji (`🌐`, `🔍`), SVG path, or `iconify:<set>:<name>` |
| `version` | `string \| number` | ❌ | Semantic version number (e.g. `"1.2.0"`) |
| `platforms` | `list<string>` | ❌ | Target OS filter: `[windows]`, `[macos]`. Defaults to all platforms |
| `options` | `list<Option>` | ❌ | Interactive settings controls in the UI (API keys, dropdowns, switches) |
| `actions` | `list<Action>` | ✅ | Array of one or more action objects (or a single root action) |

---

## 3. Options System (User Settings Schema)

Options appear as interactive controls in FlyClip's Settings dialog. Each option must specify an `identifier` and `type`:

```yaml
options:
  # 1. Secret / Password Input (Masked text with Eye toggle, for API Keys / Tokens)
  - identifier: apiKey
    label: { en: "API Key", zh: "API 密钥" }
    type: secret
    description: { en: "Your DeepSeek API Key", zh: "前往 platform.deepseek.com 获取" }

  # 2. Choice / Segmented Selector (Single choice from predefined list)
  - identifier: engine
    label: { en: "Search Engine", zh: "搜索引擎" }
    type: multiple
    values:
      - "https://www.bing.com/search?q="
      - "https://www.google.com/search?q="
      - "https://www.baidu.com/s?wd="
      - "https://duckduckgo.com/?q="
    value labels:
      - "Bing"
      - "Google"
      - "Baidu (百度)"
      - "DuckDuckGo"
    default value: "https://www.bing.com/search?q="

  # 3. Boolean Switch (Toggle control)
  - identifier: autoPaste
    label: { en: "Auto Paste", zh: "自动粘贴" }
    type: boolean
    default value: true

  # 4. Text Input (Single-line or multi-line string)
  - identifier: promptTemplate
    label: { en: "Custom Prompt", zh: "自定义 Prompt" }
    type: string
    multiline: true
    default value: "You are a professional editor. Improve the following text:"

  # 5. Heading (Visual section separator)
  - identifier: advancedSection
    label: { en: "Advanced Settings", zh: "高级设置" }
    type: heading
```

---

## 4. Action Types & Execution Engine

Each entry in `actions` defines one interactive button on FlyClip's floating Action Bar:

### 4.1 Action Common Properties

| Field | Type | Default | Description |
| :--- | :--- | :---: | :--- |
| `title` | `string \| object` | Required | Button tooltip title (`title: { en: "Copy", zh: "复制" }`) |
| `icon` | `string` | Optional | Icon name, emoji, or SVG path |
| `identifier` | `string` | Optional | Action unique sub-identifier |
| `requirements` | `list<string>` | `[text]` | Trigger condition gating (see Section 5) |
| `regex` | `string` | Optional | Regular expression pattern for narrowing selection text |
| `required apps` | `list<string>` | Optional | Only show in listed processes (e.g. `["code.exe", "msedge.exe"]`) |
| `excluded apps` | `list<string>` | Optional | Hide action in listed processes |
| `before` | `string` | Optional | Pre-execution action: `"copy-selection"` or `"cut-selection"` |
| `after` | `string` | Optional | Post-execution pipeline (see Section 6): `paste-result`, `copy-result`, `show-result`, `preview-result` |
| `stay visible` | `boolean` | `false` | If `true`, keeps the FlyClip toolbar open after execution |
| `restore pasteboard` | `boolean` | `false` | Restores prior clipboard state after pasting |

---

### 4.2 Action Kind 1: URL Action (`url`)
Opens a URL in the user's default browser or triggers an app URL Scheme (`obsidian://`, `notion://`, `vscode://`, `mailto:`).

* **Template Placeholders**:
  * `***` or `{flyclip text}` / `{popclip text}`: Selected text, automatically trimmed and RFC 3986 percent-encoded.
  * `{flyclip option <identifier>}`: Inserts option value verbatim.
  * `{url}`: Matched URL string.
  * `{query}`: Cleaned search query.
* **URL Modifiers**:
  * `clean query: true`: Replaces newlines and tabs with spaces and collapses whitespace.
  * `spaces as plus: true`: Encodes spaces as `+` rather than `%20` (useful for Amazon/eBay/Baidu).

```yaml
actions:
  - title: Search Docs
    icon: search
    url: "{flyclip option engine}{flyclip text}"
    clean query: true
```

---

### 4.3 Action Kind 2: JavaScript Action (`javascript` or `script file`)
Runs in FlyClip's sub-millisecond QuickJS engine (ES6+, async/await, Promise support).

#### Complete JavaScript Host APIs (`flyclip.*` & `popclip.*`):

```javascript
// 1. Text & Selection Inputs
flyclip.input.text          // (string) Narrowed selection text (after requirement/regex)
flyclip.input.matchedText   // (string) Alias to matched narrowed text
flyclip.input.fullText      // (string) Raw un-narrowed complete selection
flyclip.actionIdentifier    // (string) Identifier of the active action
flyclip.process             // (string) Current foreground process name (e.g. "code.exe")

// 2. Options Access
flyclip.options.<id>        // (string|boolean) Access user configured options
flyclip.options.apiKey      // e.g. "sk-..."

// 3. Clipboard APIs
flyclip.copy(text)          // (text: string) => boolean: Writes text to system clipboard
flyclip.copyText(text)      // Alias to flyclip.copy
flyclip.readClipboard()     // () => string: Reads current plain text from clipboard
flyclip.paste(text?)        // (text?: string) => boolean: Simulates Ctrl+V (pastes text if provided)
flyclip.pasteText(text?)    // Alias to flyclip.paste
flyclip.clipboard.read()    // Returns clipboard text
flyclip.clipboard.write(s)  // Writes clipboard text

// 4. UI Feedback & Notifications
flyclip.showText(msg)       // (msg: string) => string: Displays a floating tooltip bubble near toolbar
flyclip.showSuccess(msg?)   // Shows success notification
flyclip.showFailure(msg?)   // Terminates action and displays failure error message

// 5. System & Browser Integration
flyclip.openUrl(url)        // (url: string) => boolean: Opens URL with default browser
flyclip.pressKey(combo)     // (combo: string) => boolean: Simulates key combo (e.g. "ctrl shift f")
flyclip.sleep(ms)           // (ms: number) => Promise<void>: Non-blocking sleep delay
await sleep(ms)             // Global alias: await sleep(500);

// 6. Subprocess Execution (Native No-Window Execution)
// Runs command synchronously with piped stdio and returns status
const res = flyclip.run("git", ["status", "--short"]);
// Returns: { stdout: string, stderr: string, code: number }

// 7. Network HTTP Requests (Standard async fetch & flyclip.fetch)
const response = await fetch("https://api.example.com/v1/data", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    "Authorization": `Bearer ${flyclip.options.apiKey}`
  },
  body: JSON.stringify({ query: flyclip.input.text }),
  timeout: 10000 // ms timeout (default 10s)
});

const data = await response.json(); // or await response.text();
// response properties: status (number), statusText (string), ok (boolean)

// 8. Base64 & Utilities
btoa(str)                   // Encodes Latin1 string to Base64
atob(b64)                   // Decodes Base64 to string
console.log(...args)        // Output routed to FlyClip tracing log
```

---

### 4.4 Action Kind 3: Key Combo Action (`key combo` / `key combos`)
Simulates physical hardware keystrokes and keyboard shortcuts:
* **Modifiers**: `ctrl`, `alt`, `shift`, `super` (Windows key)
* **Keys**: `a`-`z`, `0`-`9`, `f1`-`f12`, `enter`, `esc`, `tab`, `space`, `backspace`, `delete`, `up`, `down`, `left`, `right`, `home`, `end`, `pageup`, `pagedown`

```yaml
actions:
  - title: Format Document
    icon: code
    key combo: shift alt f
```

---

### 4.5 Action Kind 4: Shell Script Action (`shell script`)
Executes PowerShell (Windows) or POSIX shell scripts directly:
* **Environment Variables Injected**:
  * `FLYCLIP_TEXT` / `POPCLIP_TEXT`: Selected text
  * `FLYCLIP_FULL_TEXT` / `POPCLIP_FULL_TEXT`: Raw selection text
  * `FLYCLIP_OPTION_<IDENTIFIER>`: Configured options in uppercase
  * `FLYCLIP_PROCESS_NAME`: Frontmost active application executable

```yaml
actions:
  - title: PowerShell Timestamp
    platforms: [windows]
    shell script: |
      Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    after: paste-result
```

---

## 5. Requirements & Matching Rules (`requirements`)

Control precisely when an action button is visible on FlyClip's Action Bar:

| Requirement Filter | Condition to Display Action |
| :--- | :--- |
| `text` (default) | Appears whenever any non-empty text is selected |
| `url` | Appears **only** when a valid URL (http/https/ftp/custom schemes) is selected |
| `urls` | Appears when one or more URLs are found in selection |
| `email` | Appears **only** when a valid email address is selected |
| `path` | Appears **only** when selection matches an existing local file or folder path |
| `paste` | Appears on empty selection / caret position (or long-press hold) |
| `option <id>` | Appears only when option `<id>` is enabled (truthy / non-empty) |
| `!option <id>` | Appears only when option `<id>` is disabled (falsy / empty) |

### 5.1 Regex Narrowing
When `regex` is provided, FlyClip matches against the selected text and narrows `flyclip.input.text` to the matched portion (or capturing group 1):

```yaml
actions:
  - title: Open GitHub Issue
    regex: '#(\d+)'  # Captures issue number
    url: https://github.com/flyclip-app/flyclip/issues/***
```

---

## 6. Post-Execution Pipeline (`after`)

Specifies what FlyClip does with the string value returned by a script action:

| `after` Mode | Behavior |
| :--- | :--- |
| `paste-result` | Automatically types/pastes the returned string at current cursor position, replacing the original selection |
| `copy-result` | Copies the returned string directly to the system clipboard |
| `show-result` | Displays the returned string inside a floating result tooltip |
| `preview-result` | Renders the returned string in a Markdown floating preview window |

---

## 7. Production-Grade Extension Recipes & Templates

### Recipe 1: DeepSeek / OpenAI AI Polish & Translation (with API Key & Model Options)

```yaml
# flyclip
name: AI Text Polisher
icon: sparkles
description: Polish selected text with DeepSeek AI
options:
  - identifier: apiKey
    label: { en: "DeepSeek API Key", zh: "DeepSeek API 密钥" }
    type: secret
    description: "Get your key from https://platform.deepseek.com"
  - identifier: tone
    label: { en: "Tone", zh: "润色风格" }
    type: multiple
    values:
      - "professional and concise"
      - "casual and engaging"
      - "academic and formal"
    value labels:
      - "Professional (商务简明)"
      - "Casual (生动活泼)"
      - "Academic (严谨学术)"
    default value: "professional and concise"
actions:
  - title: { en: "Polish with AI", zh: "AI 润色" }
    icon: sparkles
    requirements: [text]
    javascript: |
      const apiKey = flyclip.options.apiKey;
      if (!apiKey) {
        flyclip.showText("Please set DeepSeek API Key in FlyClip Settings");
        return null;
      }
      
      flyclip.showText("Polishing text...");
      const tone = flyclip.options.tone || "professional and concise";
      
      const res = await fetch("https://api.deepseek.com/chat/completions", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${apiKey}`
        },
        body: JSON.stringify({
          model: "deepseek-chat",
          messages: [
            {
              role: "system",
              content: `You are an expert writing editor. Rewrite the user's text to make it ${tone}. Return ONLY the revised text without explanations, quotes, or markdown tags.`
            },
            { role: "user", content: flyclip.input.text }
          ],
          temperature: 0.3
        })
      });
      
      if (!res.ok) {
        flyclip.showFailure(`API Error ${res.status}`);
        return null;
      }
      
      const data = res.json();
      return data.choices[0].message.content.trim();
    after: paste-result
```

---

### Recipe 2: Developer Code Identifier / Case Converter (Multiple Actions in One Extension)

```yaml
# flyclip
name: Code Case Converter
icon: code
description: Convert selected identifiers between camelCase, snake_case, and kebab-case
actions:
  - title: camelCase
    icon: text
    requirements: [text]
    javascript: |
      return flyclip.input.text.trim()
        .replace(/[-_\s]+(.)?/g, (_, c) => (c ? c.toUpperCase() : ""))
        .replace(/^(.)/, c => c.toLowerCase());
    after: paste-result

  - title: snake_case
    icon: text
    requirements: [text]
    javascript: |
      return flyclip.input.text.trim()
        .replace(/([a-z0-9])([A-Z])/g, "$1_$2")
        .replace(/[-\s]+/g, "_")
        .toLowerCase();
    after: paste-result

  - title: kebab-case
    icon: text
    requirements: [text]
    javascript: |
      return flyclip.input.text.trim()
        .replace(/([a-z0-9])([A-Z])/g, "$1-$2")
        .replace(/[_\s]+/g, "-")
        .toLowerCase();
    after: paste-result
```

---

### Recipe 3: Multi-Engine Search with Options

```yaml
# flyclip
name: Multi-Engine Search
icon: search
description: Search selected text across multiple search engines
options:
  - identifier: engine
    label: { en: "Search Engine", zh: "搜索引擎" }
    type: multiple
    values:
      - "https://www.bing.com/search?q="
      - "https://www.google.com/search?q="
      - "https://www.baidu.com/s?wd="
      - "https://duckduckgo.com/?q="
    value labels:
      - "Bing"
      - "Google"
      - "Baidu (百度)"
      - "DuckDuckGo"
    default value: "https://www.bing.com/search?q="
actions:
  - title: Search
    icon: search
    url: "{flyclip option engine}{flyclip text}"
    clean query: true
    requirements: [text]
```

---

### Recipe 4: Git Commit Hash Opener (Regex Trigger)

```yaml
# flyclip
name: Git Commit Opener
icon: git-commit
description: Open GitHub commit page when selecting a 7-40 char hexadecimal commit hash
actions:
  - title: View Commit
    icon: external-link
    regex: '\b[0-9a-fA-F]{7,40}\b'
    url: https://github.com/flyclip-app/flyclip/commit/***
    requirements: [text]
```

---

## 8. AI Prompting Instructions & Best Practices

When responding to a user asking to create a FlyClip extension:
1. **Always produce a complete, valid single-snippet YAML block starting with `# flyclip`** so the user can directly copy and highlight it for 1-click installation.
2. **Handle errors gracefully**: When calling third-party HTTP APIs, check for API key presence and display clear `flyclip.showText("Please configure API Key in Settings")` messages.
3. **Use the appropriate `after` pipeline**: For text transformations, always use `after: paste-result`. For copy-only tools, use `after: copy-result`.
4. **Leverage options**: When an API key, endpoint, or language selection is needed, add an `options` array with clear `identifier`, `label`, `type`, and `default value`.
