-----

# AstroNvim Configuration

A curated AstroNvim configuration optimized for a full-stack workflow, with a focus on **Laravel**, **React**, **Flutter**, and **Go**.

---

--

## 🛠️ Setup & Prerequisites

This configuration assumes the following tools are installed on the system and available in your `PATH`.

### Core Tools

- **Neovim:** `0.10.0+`
- **Languages:** Node.js, PHP, Go, Dart
- **Databases:** MariaDB, PostgreSQL
- **DevOps:** Docker & Docker Compose

### Required Mason Packages

To get full LSP, linting, and formatting support, install the following packages using the `:Mason` command:

| Language / Tool   | Packages                                                                    |
| ----------------- | --------------------------------------------------------------------------- |
| **JavaScript/TS** | `typescript-language-server`, `eslint-lsp`, `prettier`, `prettierd`         |
| **Go**            | `gopls`, `gofumpt`, `gomodifytags`, `impl`, `goimports-reviser`             |
| **PHP (Laravel)** | `intelephense`, `php-cs-fixer`, `phpstan`                                   |
| **Docker**        | `docker-compose-language-service`, `dockerfile-language-server`, `hadolint` |
| **Other**         | `tailwindcss-language-server`, `sqlls`, `sqlfmt`                            |

### Initial Language Setup

After running `:MasonInstall ...`, you must also install the correct Tree-sitter parsers:

```vim
:TSInstall javascript typescript php go dart dockerfile
```

---

## ⌨️ Essential Key Mappings

The leader key is **`<Space>`**. All keybindings below are from Normal Mode.

### Basic Vim Motions

| Key                   | Action                                   |
| --------------------- | ---------------------------------------- |
| `h` / `j` / `k` / `l` | Move Left / Down / Up / Right            |
| `w` / `b`             | Jump forward / backward by word          |
| `0` / `$`             | Jump to start / end of line              |
| `gg` / `G`            | Jump to start / end of file              |
| `Ctrl+d` / `Ctrl+u`   | Scroll down / up by half page            |
| `i` / `a`             | Enter Insert mode before / after cursor  |
| `v` / `V` / `Ctrl+v`  | Visual / Visual Line / Visual Block mode |
| `d` / `y` / `c`       | Delete / Yank (Copy) / Change            |
| `dd` / `yy` / `cc`    | Delete / Yank / Change entire line       |
| `p` / `P`             | Paste after / before cursor              |
| `u` / `Ctrl+r`        | Undo / Redo                              |

### File & Project Management

| Keybind                        | Action (Fuzzy Finder)                   |
| ------------------------------ | --------------------------------------- |
| `<Space>ff`                    | Find files                              |
| `<Space>fw`                    | Live grep (search text in files)        |
| `<Space>fo`                    | Find recent files (oldfiles)            |
| `<Space>fb`                    | Find open buffers                       |
| `<Space>fk`                    | Find keymaps                            |
| **In Picker:**                 |                                         |
| `Ctrl+x` / `Ctrl+v` / `Ctrl+t` | Open in Horizontal / Vertical / New Tab |
|                                |                                         |
| **Keybind**                    | **Action (File Explorer)**              |
| `<Space>e`                     | Toggle Neo-tree file explorer           |
| `a` / `d` / `r`                | In Neo-tree: Add / Delete / Rename file |
| `H`                            | In Neo-tree: Toggle hidden files        |
| `q`                            | In Neo-tree: Close                      |

### LSP & Code Navigation

| Keybind     | Action                                                    |
| ----------- | --------------------------------------------------------- |
| `gd`        | Go to definition                                          |
| `gr`        | Show references                                           |
| `gi`        | Go to implementation                                      |
| `K`         | Show hover documentation (shows function signature, etc.) |
| `]d` / `[d` | Go to next / previous diagnostic (error, warning)         |
| `<Space>la` | **Code actions** (auto-import, fix, refactor)             |
| `<Space>lf` | Format document                                           |
| `<Space>lr` | Rename symbol (variable, function, class)                 |
| `<Space>ls` | Search document symbols                                   |
| `<Space>lS` | Search workspace symbols                                  |

### Code Editing

| Keybind     | Action                                                     |
| ----------- | ---------------------------------------------------------- |
| `gcc`       | Toggle line comment                                        |
| `gbc`       | Toggle block comment                                       |
| `<Space>la` | Open code actions menu (e.g., "Extract Widget" in Flutter) |

### Window, Buffer & Tab Management

| Keybind          | Action                                      |
| ---------------- | ------------------------------------------- |
| `<Space>-`       | Split window horizontally                   |
| `<Space>\|`      | Split window vertically                     |
| `<Ctrl-h/j/k/l>` | Navigate to window Left / Down / Up / Right |
| `:q`             | Close current window                        |
| `<Space>c`       | Close current buffer (file)                 |
| `]b` / `[b`      | Go to next / previous buffer                |
| `<Space>tn`      | Create new tab                              |
| `]t` / `[t`      | Go to next / previous tab                   |

### Git Integration (Gitsigns & Lazygit)

| Keybind                   | Action                                 |
| ------------------------- | -------------------------------------- |
| `<Space>gj` / `<Space>gk` | Go to next / previous hunk (change)    |
| `<Space>gs` / `<Space>gr` | Stage / Reset hunk                     |
| `<Space>gp`               | Preview hunk                           |
| `<Space>gS`               | Stage entire buffer                    |
| `<Space>gb`               | Blame line (shows who last changed it) |
| `<Space>gg`               | Open **Lazygit** (full terminal UI)    |

### Terminal

| Keybind      | Action                                 |
| ------------ | -------------------------------------- |
| `<Space>tt`  | Toggle floating terminal               |
| `<Space>th`  | Toggle horizontal terminal             |
| `<Space>tv`  | Toggle vertical terminal               |
| `<Esc><Esc>` | (In Terminal mode) Exit to Normal mode |

---

## 🚀 Language & Docker Workflows

Common commands and workflows for this stack.

### JavaScript / React

- **Auto-import:** Place cursor on an unimported component, press `<Space>la`, and select "Add import".
- **Format:** Runs automatically on save via **Prettier**.
- **Linting:** View errors with `[d` and `]d`. Fix all with `<Space>la` -\> "ESLint: Fix all auto-fixable problems".
- **Run Dev Server:** Open a terminal with `<Space>tt` and run `npm run dev`.

### PHP / Laravel

- **Code Navigation:** Use `gd` on a Model or Facade to jump to its definition.
- **Artisan:** Open a terminal (`<Space>tt`) and run commands:
  - `docker-compose exec app php artisan migrate`
  - `docker-compose exec app php artisan make:controller MyController`

### Go

- **Import Management:** Imports are automatically formatted, added, and removed on save via **gofumpt** and **goimports-reviser**.
- **Run/Test:** Open a terminal (`<Space>tt`) and run:
  - `go run main.go`
  - `go test ./...`

### Flutter / Dart

- **Refactor:** Place cursor on a Widget, press `<Space>la` and select "Extract Widget" or "Wrap with...".
- **Run App:** Open a terminal (`<Space>tt`) and run `flutter run`.
- **Format:** Run `dart format .` in the terminal or use `<Space>lf` on the current file.

### Docker

- **LSP:** Get auto-completion and syntax highlighting in `docker-compose.yml` and `Dockerfile`.
- **Linting:** **Hadolint** provides best-practice warnings in your `Dockerfile`.
- **Common Commands:** Open a terminal (`<Space>tt`) to manage services:
  - `docker-compose up -d --build`
  - `docker-compose logs -f app`
  - `docker-compose down`
