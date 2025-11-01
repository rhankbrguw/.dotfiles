# AstroNvim Configuration

A curated AstroNvim configuration optimized for full-stack development with **Laravel**, **React**, **Flutter**, and **Go**.

> **Primary Modifier:** The `Space` key serves as the main modifier and is referenced as `<Space>` throughout this guide.

---

## 🛠️ Setup & Prerequisites

### Core Tools

Ensure the following tools are installed and accessible in your system `PATH`:

| Category     | Tools                  |
| :----------- | :--------------------- |
| **Editor**   | Neovim 0.10.0+         |
| **Runtime**  | Node.js, PHP, Go, Dart |
| **Database** | MariaDB, PostgreSQL    |
| **DevOps**   | Docker, Docker Compose |

### Mason Packages

Install these packages using the `:Mason` command for full LSP, linting, and formatting support:

| Language/Tool     | Required Packages                                                           |
| :---------------- | :-------------------------------------------------------------------------- |
| **JavaScript/TS** | `typescript-language-server`, `eslint-lsp`, `prettier`, `prettierd`         |
| **Go**            | `gopls`, `gofumpt`, `gomodifytags`, `impl`, `goimports-reviser`             |
| **PHP (Laravel)** | `intelephense`, `php-cs-fixer`, `phpstan`                                   |
| **Docker**        | `docker-compose-language-service`, `dockerfile-language-server`, `hadolint` |
| **Other**         | `tailwindcss-language-server`, `sqlls`, `sqlfmt`                            |

### Tree-sitter Parsers

After installing Mason packages, install the required Tree-sitter parsers:

```vim
:TSInstall javascript typescript php go dart dockerfile
```

---

## 🧭 Basic Navigation & Editing

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

## 📁 File & Project Management

### Fuzzy Finder

| Keybinding                     | Action                                  |
| :----------------------------- | :-------------------------------------- |
| `<Space>ff`                    | Find files                              |
| `<Space>fw`                    | Live grep (search text in files)        |
| `<Space>fo`                    | Find recent files (oldfiles)            |
| `<Space>fb`                    | Find open buffers                       |
| `<Space>fk`                    | Find keymaps                            |
| `Ctrl+x` / `Ctrl+v` / `Ctrl+t` | Open in Horizontal / Vertical / New Tab |

### File Explorer (Neo-tree)

| Keybinding | Action              |
| :--------- | :------------------ |
| `<Space>e` | Toggle Neo-tree     |
| `a`        | Add file/folder     |
| `d`        | Delete file/folder  |
| `r`        | Rename file/folder  |
| `H`        | Toggle hidden files |
| `q`        | Close Neo-tree      |

---

## 💻 LSP & Code Navigation

| Keybinding  | Action                                            |
| :---------- | :------------------------------------------------ |
| `gd`        | Go to definition                                  |
| `gr`        | Show references                                   |
| `gi`        | Go to implementation                              |
| `K`         | Show hover documentation                          |
| `]d` / `[d` | Go to next / previous diagnostic (error, warning) |
| `<Space>la` | Code actions (auto-import, fix, refactor)         |
| `<Space>lf` | Format document                                   |
| `<Space>lr` | Rename symbol (variable, function, class)         |

---

## 🪟 Window, Buffer & Terminal Management

### Window & Buffer Navigation

| Keybinding     | Action                                      |
| :------------- | :------------------------------------------ |
| `<Space>-`     | Split window horizontally                   |
| `<Space>\|`    | Split window vertically                     |
| `Ctrl+h/j/k/l` | Navigate to window Left / Down / Up / Right |
| `<Space>c`     | Close current buffer                        |
| `]b` / `[b`    | Go to next / previous buffer                |

### Tab & Terminal

| Keybinding  | Action                            |
| :---------- | :-------------------------------- |
| `<Space>tn` | Create new tab                    |
| `]t` / `[t` | Go to next / previous tab         |
| `<Space>tt` | Toggle floating terminal          |
| `<Space>th` | Toggle horizontal terminal        |
| `Esc` `Esc` | Exit Terminal mode to Normal mode |

---

## 🌳 Git Integration

| Keybinding                | Action                               |
| :------------------------ | :----------------------------------- |
| `<Space>gg`               | Open Lazygit (full terminal UI)      |
| `<Space>gj` / `<Space>gk` | Go to next / previous hunk (change)  |
| `<Space>gs` / `<Space>gr` | Stage / Reset hunk                   |
| `<Space>gp`               | Preview hunk                         |
| `<Space>gS`               | Stage entire buffer                  |
| `<Space>gb`               | Blame line (show last change author) |

---

## 🚀 Language-Specific Workflows

### JavaScript / React

| Task               | Action                                                 |
| :----------------- | :----------------------------------------------------- |
| Auto-import        | Place cursor on component → `<Space>la` → "Add import" |
| Fix linting errors | `<Space>la` → "ESLint: Fix all auto-fixable problems"  |
| Run dev server     | `<Space>tt` → `npm run dev`                            |

### PHP / Laravel

| Task          | Action                                                      |
| :------------ | :---------------------------------------------------------- |
| Run Artisan   | `<Space>tt` → `docker-compose exec app php artisan migrate` |
| Navigate code | Use `gd` on Models or Facades to jump to definition         |

### Go

| Task            | Action                                              |
| :-------------- | :-------------------------------------------------- |
| Format & Import | Automatic on save (`gofumpt` / `goimports-reviser`) |
| Run/Test        | `<Space>tt` → `go run main.go` or `go test ./...`   |

### Flutter / Dart

| Task            | Action                                                       |
| :-------------- | :----------------------------------------------------------- |
| Refactor widget | Cursor on Widget → `<Space>la` → "Extract Widget"            |
| Run app         | `<Space>tt` → `flutter run`                                  |
| Format code     | `<Space>lf` (current file) or `dart format .` (project-wide) |

### Docker

| Task            | Action                                              |
| :-------------- | :-------------------------------------------------- |
| Manage services | `<Space>tt` → `docker-compose up -d`                |
| View logs       | `<Space>tt` → `docker-compose logs -f app`          |
| Linting         | Hadolint provides automatic warnings in Dockerfiles |

---

## 📚 Additional Resources

- **AstroNvim Documentation:** [https://docs.astronvim.com](https://docs.astronvim.com)
- **Neovim Documentation:** `:help` or [https://neovim.io/doc](https://neovim.io/doc)
- **Mason Package Manager:** `:Mason` or `:help mason`

---
