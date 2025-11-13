# AstroNvim Configuration

A curated AstroNvim configuration optimized for full-stack development with **Laravel**, **React**, **Flutter**, and **Go**.

> **Primary Modifier:** The `Space` key serves as the main modifier and is referenced as `<Space>` throughout this guide.

---

## 🛠️ Setup & Prerequisites

### Core Tools

Ensure the following tools are installed and accessible in your system `PATH`:

| Category     | Tools                           |
| :----------- | :------------------------------ |
| **Editor**   | Neovim 0.10.0+                  |
| **Runtime**  | Node.js, PHP, Go, Dart          |
| **Database** | MariaDB, PostgreSQL             |
| **DevOps**   | Docker, Docker Compose, Lazygit |

### Mason Packages

Install these packages using the `:Mason` command for full LSP, linting, and formatting support:

| Language/Tool     | Required Packages                                               |
| :---------------- | :-------------------------------------------------------------- |
| **JavaScript/TS** | `typescript-language-server`, `eslint_d`, `prettier`            |
| **Go**            | `gopls`, `gofumpt`, `goimports`, `delve`                        |
| **PHP (Laravel)** | `intelephense`, `phpstan`                                       |
| **Docker**        | `docker-compose-language-service`, `dockerfile-language-server` |
| **Other**         | `tailwindcss-language-server`, `lua-language-server`, `stylua`  |

### Tree-sitter Parsers

After installing Mason packages, install the required Tree-sitter parsers:

```vim
:TSInstall lua vim dart go php blade javascript typescript tsx jsx css html sql dockerfile yaml json markdown bash
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

### Fuzzy Finder (Telescope)

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

### Terminal Management

| Keybinding     | Action                                           |
| :------------- | :----------------------------------------------- |
| `<Space>tt`    | Toggle terminal (persistent)                     |
| `Ctrl+x`       | Hide terminal (from terminal mode)               |
| `Ctrl+h/j/k/l` | Navigate to window from terminal (terminal mode) |

### Tab Management

| Keybinding  | Action                    |
| :---------- | :------------------------ |
| `<Space>tn` | Create new tab            |
| `]t` / `[t` | Go to next / previous tab |

---

## 🌳 Git Integration (Lazygit)

| Keybinding  | Action                          |
| :---------- | :------------------------------ |
| `<Space>Gg` | Open Lazygit (full terminal UI) |
| `<Space>Gs` | Stage current file              |
| `<Space>Gc` | Commit (prompts for message)    |
| `<Space>Gp` | Push to remote                  |
| `<Space>Gl` | Show git log (last 20 commits)  |
| `<Space>Gd` | Show git diff                   |

### Inside Lazygit

| Keybinding | Action             |
| :--------- | :----------------- |
| `1`        | Status panel       |
| `2`        | Files panel        |
| `3`        | Branches panel     |
| `4`        | Commits panel      |
| `5`        | Stash panel        |
| `Space`    | Stage/unstage file |
| `c`        | Commit             |
| `P`        | Push               |
| `p`        | Pull               |
| `q`        | Quit Lazygit       |
| `?`        | Show help          |

---

## 🚀 Language-Specific Workflows

### Flutter / Dart

| Keybinding  | Action                               |
| :---------- | :----------------------------------- |
| `<Space>xr` | Run Flutter app (hot reload enabled) |
| `<Space>xw` | Run Flutter web (Chrome)             |
| `<Space>xe` | Launch Android emulator (Pixel 6)    |
| `<Space>xq` | Quit Flutter app                     |

**Hot Reload Workflow:**

1. Run app: `<Space>xr`
2. Edit code in Neovim
3. Press `r` in terminal for hot reload
4. Press `Ctrl+x` to hide terminal
5. Press `<Space>tt` to show terminal again

### JavaScript / React

| Task               | Action                                                 |
| :----------------- | :----------------------------------------------------- |
| Auto-import        | Place cursor on component → `<Space>la` → "Add import" |
| Fix linting errors | `<Space>la` → "ESLint: Fix all auto-fixable problems"  |
| Format code        | `<Space>lf` (auto-formats with Prettier)               |
| Run dev server     | `<Space>tt` → `npm run dev`                            |

### PHP / Laravel

| Task          | Action                                              |
| :------------ | :-------------------------------------------------- |
| Run Artisan   | `<Space>tt` → `php artisan migrate`                 |
| Navigate code | Use `gd` on Models or Facades to jump to definition |
| Format code   | Automatic on save (PSR-12 standard)                 |

### Go

| Task            | Action                                       |
| :-------------- | :------------------------------------------- |
| Format & Import | Automatic on save (`gofumpt` + `goimports`)  |
| Run             | `<Space>tt` → `go run main.go`               |
| Test            | `<Space>tt` → `go test ./...`                |
| Debug           | Use `<Space>d` for DAP debugger (with Delve) |

---

## 🐳 Docker Management

| Keybinding  | Action                     |
| :---------- | :------------------------- |
| `<Space>Du` | Docker compose up          |
| `<Space>Dd` | Docker compose down        |
| `<Space>Dl` | Docker compose logs (tail) |
| `<Space>Ds` | Docker compose status      |

**Note:** Must be in project directory with `docker-compose.yml` file.

---

## 📚 Additional Resources

- **AstroNvim Documentation:** [https://docs.astronvim.com](https://docs.astronvim.com)
- **Neovim Documentation:** `:help` or [https://neovim.io/doc](https://neovim.io/doc)
- **Mason Package Manager:** `:Mason` or `:help mason`
- **Lazygit:** [https://github.com/jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)

---

## 🔧 Quick Reference Card

### Most Used Commands

| Category     | Keybind     | Action           |
| ------------ | ----------- | ---------------- |
| **Files**    | `<Space>ff` | Find file        |
| **Code**     | `gd`        | Go to definition |
| **LSP**      | `<Space>la` | Code actions     |
| **Format**   | `<Space>lf` | Format code      |
| **Terminal** | `<Space>tt` | Toggle terminal  |
| **Git**      | `<Space>Gg` | Open Lazygit     |
| **Flutter**  | `<Space>xr` | Run Flutter      |
| **Docker**   | `<Space>Du` | Docker up        |

---

## 💡 Pro Tips

- **Format on save** is enabled for all languages
- **Go imports** auto-organize on save
- **Terminal persists** - use `Ctrl+x` to hide, not `:q`
- **Lazygit** opens in new tab for better workflow
- **Capital letters** (`G`, `D`, `X`) avoid keybind conflicts
