-----

# AstroNvim Configuration

A curated AstroNvim configuration optimized for a full-stack workflow, with a focus on **Laravel**, **React**, **Flutter**, and **Go**.

**Main Modifier:** The `Space` key is the primary modifier, referred to as `<Space>` in this guide.

---

--

### 🛠️ Setup & Prerequisites

This configuration assumes the following tools are installed on the system and available in your `PATH`.

**Core Tools:**

- **Neovim:** `0.10.0+`
- **Languages:** Node.js, PHP, Go, Dart
- **Databases:** MariaDB, PostgreSQL
- **DevOps:** Docker & Docker Compose

**Required Mason Packages:**
To get full LSP, linting, and formatting support, install the following packages using the `:Mason` command:

| Language / Tool   | Packages                                                                    |
| :---------------- | :-------------------------------------------------------------------------- |
| **JavaScript/TS** | `typescript-language-server`, `eslint-lsp`, `prettier`, `prettierd`         |
| **Go**            | `gopls`, `gofumpt`, `gomodifytags`, `impl`, `goimports-reviser`             |
| **PHP (Laravel)** | `intelephense`, `php-cs-fixer`, `phpstan`                                   |
| **Docker**        | `docker-compose-language-service`, `dockerfile-language-server`, `hadolint` |
| **Other**         | `tailwindcss-language-server`, `sqlls`, `sqlfmt`                            |

**Initial Language Setup:**
After running `:MasonInstall ...`, you must also install the correct Tree-sitter parsers:

```vim
:TSInstall javascript typescript php go dart dockerfile
```

---

### 🧭 Basic Navigation & Editing

| Keybinding            | Action                                   |
| :-------------------- | :--------------------------------------- |
| `h` / `j` / `k` / `l` | Move Left / Down / Up / Right            |
| `w` / `b`             | Jump forward / backward by word          |
| `gg` / `G`            | Jump to start / end of file              |
| `i` / `a`             | Enter Insert mode before / after cursor  |
| `v` / `V` / `Ctrl+v`  | Visual / Visual Line / Visual Block mode |
| `d` / `y` / `c`       | Delete / Yank (Copy) / Change            |
| `dd` / `yy` / `cc`    | Delete / Yank / Change entire line       |
| `u` / `Ctrl+r`        | Undo / Redo                              |
| `gcc`                 | Toggle line comment                      |
| `gbc`                 | Toggle block comment                     |

---

### 📁 File & Project Management

| Keybinding                     | Action (Fuzzy Finder)                               |
| :----------------------------- | :-------------------------------------------------- |
| `<Space>ff`                    | Find files                                          |
| `<Space>fw`                    | Live grep (search text in files)                    |
| `<Space>fo`                    | Find recent files (oldfiles)                        |
| `<Space>fb`                    | Find open buffers                                   |
| `<Space>fk`                    | Find keymaps                                        |
| `Ctrl+x` / `Ctrl+v` / `Ctrl+t` | (In Picker) Open in Horizontal / Vertical / New Tab |
|                                |                                                     |
| **Keybinding**                 | **Action (File Explorer)**                          |
| `<Space>e`                     | Toggle Neo-tree file explorer                       |
| `a` / `d` / `r`                | (In Neo-tree) Add / Delete / Rename file            |
| `H`                            | (In Neo-tree) Toggle hidden files                   |
| `q`                            | (In Neo-tree) Close                                 |

---

### 💻 LSP & Code Navigation

| Keybinding  | Action                                            |
| :---------- | :------------------------------------------------ |
| `gd`        | Go to definition                                  |
| `gr`        | Show references                                   |
| `gi`        | Go to implementation                              |
| `K`         | Show hover documentation                          |
| `]d` / `[d` | Go to next / previous diagnostic (error, warning) |
| `<Space>la` | **Code actions** (auto-import, fix, refactor)     |
| `<Space>lf` | Format document                                   |
| `<Space>lr` | Rename symbol (variable, function, class)         |

---

### 🪟 Window, Buffer & Terminal

| Keybinding       | Action                                      |
| :--------------- | :------------------------------------------ |
| `<Space>-`       | Split window horizontally                   |
| `<Space>\|`      | Split window vertically                     |
| `<Ctrl-h/j/k/l>` | Navigate to window Left / Down / Up / Right |
| `<Space>c`       | Close current buffer (file)                 |
| `]b` / `[b`      | Go to next / previous buffer                |
| `<Space>tn`      | Create new tab                              |
| `]t` / `[t`      | Go to next / previous tab                   |
| `<Space>tt`      | Toggle floating terminal                    |
| `<Space>th`      | Toggle horizontal terminal                  |
| `<Esc><Esc>`     | (In Terminal mode) Exit to Normal mode      |

---

### 🌳 Git Integration

| Keybinding                | Action                                 |
| :------------------------ | :------------------------------------- |
| `<Space>gg`               | Open **Lazygit** (full terminal UI)    |
| `<Space>gj` / `<Space>gk` | Go to next / previous hunk (change)    |
| `<Space>gs` / `<Space>gr` | Stage / Reset hunk                     |
| `<Space>gp`               | Preview hunk                           |
| `<Space>gS`               | Stage entire buffer                    |
| `<Space>gb`               | Blame line (shows who last changed it) |

---

### 🚀 Language & Docker Workflows

| Language               | Common Workflow       | Commands & Keybinds                                           |
| :--------------------- | :-------------------- | :------------------------------------------------------------ |
| **JavaScript / React** | Auto-import component | Cursor on component -\> `<Space>la` -\> "Add import"          |
|                        | Fix linting errors    | `<Space>la` -\> "ESLint: Fix all auto-fixable problems"       |
|                        | Run dev server        | `<Space>tt` -\> `npm run dev`                                 |
| **PHP / Laravel**      | Run Artisan commands  | `<Space>tt` -\> `docker-compose exec app php artisan migrate` |
|                        | Navigate code         | Use `gd` on Models or Facades to jump to definition           |
| **Go**                 | Format & Import       | Runs automatically on save (`gofumpt` / `goimports-reviser`)  |
|                        | Run or test           | `<Space>tt` -\> `go run main.go` or `go test ./...`           |
| **Flutter / Dart**     | Refactor widget       | Cursor on Widget -\> `<Space>la` -\> "Extract Widget"         |
|                        | Run app               | `<Space>tt` -\> `flutter run`                                 |
|                        | Format code           | `<Space>lf` (current file) or `dart format .` (project)       |
| **Docker**             | Manage services       | `<Space>tt` -\> `docker-compose up -d`                        |
|                        | View logs             | `<Space>tt` -\> `docker-compose logs -f app`                  |
|                        | Linting               | **Hadolint** provides warnings in `Dockerfile` automatically  |
