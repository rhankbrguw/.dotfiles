# 🚀 AstroNvim Complete Guide

> **Comprehensive guide for AstroNvim workflow - optimized for Laravel, React, Flutter, Go development**

---

## 📋 Table of Contents

1. [System Setup](#system-setup)
2. [Basic Navigation](#basic-navigation)
3. [File Management](#file-management)
4. [LSP Features](#lsp-features)
5. [Code Editing](#code-editing)
6. [Git Integration](#git-integration)
7. [Terminal Usage](#terminal-usage)
8. [Buffer & Window Management](#buffer--window-management)
9. [Mason Package Manager](#mason-package-manager)
10. [Language-Specific Tips](#language-specific-tips)
11. [Docker Workflow](#docker-workflow)
12. [Troubleshooting](#troubleshooting)
13. [Useful Commands](#useful-commands)

---

## 🛠️ System Setup

### Installed Tools

**Programming Languages:**

- Node.js v22.20.0
- PHP 8.4.13
- Go 1.24.9
- Dart 3.4.3
- Python 3.13.9

**Databases:**

- MariaDB 10.11.11
- PostgreSQL 16.9

**DevOps:**

- Docker 28.5.1
- Docker Compose
- Composer 2.8.12

### Mason Packages (18 Installed)

**JavaScript/TypeScript:**

- typescript-language-server
- eslint-lsp
- prettier
- prettierd

**Go:**

- gopls
- gofumpt
- gomodifytags
- impl
- goimports-reviser

**PHP (Laravel):**

- intelephense
- php-cs-fixer
- phpstan

**Docker:**

- docker-compose-language-service
- dockerfile-language-server
- hadolint

**Others:**

- tailwindcss-language-server
- sqlls
- sqlfmt

### Dart/Flutter Setup

Dart LSP configured manually at: `~/.config/nvim/lua/plugins/dart.lua`

```lua
return {
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        dartls = {
          cmd = { "dart", "language-server", "--protocol=lsp" },
          filetypes = { "dart" },
          init_options = {
            closingLabels = true,
            flutterOutline = true,
            onlyAnalyzeProjectsWithOpenFiles = true,
            outline = true,
            suggestFromUnimportedLibraries = true,
          },
          settings = {
            dart = {
              completeFunctionCalls = true,
              showTodos = true,
            },
          },
        },
      },
    },
  },
}
```

---

## 🧭 Basic Navigation

### Opening Neovim

```bash
# Open current directory
nvim .

# Open specific file
nvim filename.js

# Open specific directory
nvim ~/projects/my-app
```

### Movement Keys

| Key         | Action                |
| ----------- | --------------------- |
| `h`         | Move left             |
| `j`         | Move down             |
| `k`         | Move up               |
| `l`         | Move right            |
| `w`         | Jump to next word     |
| `b`         | Jump to previous word |
| `0`         | Start of line         |
| `$`         | End of line           |
| `gg`        | Go to first line      |
| `G`         | Go to last line       |
| `{number}G` | Go to line number     |
| `Ctrl+d`    | Scroll down half page |
| `Ctrl+u`    | Scroll up half page   |
| `Ctrl+f`    | Scroll down full page |
| `Ctrl+b`    | Scroll up full page   |

### Modes

| Mode         | Key      | Description                 |
| ------------ | -------- | --------------------------- |
| Normal       | `Esc`    | Default mode for navigation |
| Insert       | `i`      | Insert before cursor        |
| Insert       | `I`      | Insert at start of line     |
| Insert       | `a`      | Insert after cursor         |
| Insert       | `A`      | Insert at end of line       |
| Insert       | `o`      | New line below              |
| Insert       | `O`      | New line above              |
| Visual       | `v`      | Visual select               |
| Visual Line  | `V`      | Select full lines           |
| Visual Block | `Ctrl+v` | Block selection             |
| Command      | `:`      | Execute commands            |

---

## 📁 File Management

### File Explorer (Neo-tree)

| Keybind        | Action                     |
| -------------- | -------------------------- |
| `<Space>e`     | Toggle file explorer       |
| `j/k`          | Move up/down               |
| `h`            | Collapse folder            |
| `l` or `Enter` | Expand folder / Open file  |
| `a`            | Add file/folder            |
| `d`            | Delete file/folder         |
| `r`            | Rename file/folder         |
| `c`            | Copy file/folder           |
| `x`            | Cut file/folder            |
| `p`            | Paste                      |
| `y`            | Copy filename to clipboard |
| `Y`            | Copy relative path         |
| `gy`           | Copy absolute path         |
| `R`            | Refresh tree               |
| `H`            | Toggle hidden files        |
| `q`            | Close Neo-tree             |

### Fuzzy Finder (Snacks Picker)

| Keybind     | Action                      |
| ----------- | --------------------------- |
| `<Space>ff` | Find files                  |
| `<Space>fw` | Live grep (search in files) |
| `<Space>fo` | Find old files (recents)    |
| `<Space>fb` | Find buffers                |
| `<Space>fh` | Find help tags              |
| `<Space>fc` | Find word under cursor      |
| `<Space>fk` | Find keymaps                |
| `<Space>fm` | Find man pages              |
| `<Space>fn` | Find notifications          |

**In Picker:**

- `Ctrl+j/k` - Navigate results
- `Enter` - Open file
- `Ctrl+x` - Open in horizontal split
- `Ctrl+v` - Open in vertical split
- `Ctrl+t` - Open in new tab
- `Esc` - Close picker

---

## 🔧 LSP Features

### Code Completion (Blink.cmp)

| Key          | Action                                |
| ------------ | ------------------------------------- |
| Auto-trigger | Completion menu appears automatically |
| `Tab`        | Next suggestion                       |
| `Shift+Tab`  | Previous suggestion                   |
| `Enter`      | Accept suggestion                     |
| `Ctrl+Space` | Trigger completion manually           |
| `Ctrl+e`     | Close completion menu                 |

### Code Navigation

| Keybind  | Action                   |
| -------- | ------------------------ |
| `gd`     | Go to definition         |
| `gD`     | Go to declaration        |
| `gi`     | Go to implementation     |
| `gr`     | Show references          |
| `gy`     | Go to type definition    |
| `K`      | Show hover documentation |
| `Ctrl+o` | Jump back                |
| `Ctrl+i` | Jump forward             |

### LSP Actions

| Keybind     | Action                                    |
| ----------- | ----------------------------------------- |
| `<Space>la` | Code actions (auto-import, fix, refactor) |
| `<Space>lf` | Format document                           |
| `<Space>lr` | Rename symbol                             |
| `<Space>ls` | Document symbols                          |
| `<Space>lS` | Workspace symbols                         |
| `<Space>lh` | Signature help                            |
| `<Space>ld` | Show line diagnostics                     |
| `<Space>lD` | Show hover diagnostics                    |
| `<Space>li` | LSP info                                  |
| `]d`        | Next diagnostic                           |
| `[d`        | Previous diagnostic                       |
| `]e`        | Next error                                |
| `[e`        | Previous error                            |

### Quick Search

| Key    | Action                            |
| ------ | --------------------------------- |
| `/`    | Search forward                    |
| `?`    | Search backward                   |
| `n`    | Next match                        |
| `N`    | Previous match                    |
| `*`    | Search word under cursor forward  |
| `#`    | Search word under cursor backward |
| `:noh` | Clear search highlight            |

---

## ✏️ Code Editing

### Basic Editing

| Key      | Action                            |
| -------- | --------------------------------- |
| `x`      | Delete character                  |
| `dd`     | Delete line                       |
| `D`      | Delete from cursor to end of line |
| `yy`     | Copy (yank) line                  |
| `Y`      | Copy from cursor to end of line   |
| `p`      | Paste after cursor                |
| `P`      | Paste before cursor               |
| `u`      | Undo                              |
| `Ctrl+r` | Redo                              |
| `.`      | Repeat last command               |

### Advanced Editing

| Key    | Action                    |
| ------ | ------------------------- |
| `ciw`  | Change inner word         |
| `ci"`  | Change inside quotes      |
| `ci(`  | Change inside parentheses |
| `ci{`  | Change inside braces      |
| `dit`  | Delete inside HTML tag    |
| `dap`  | Delete around paragraph   |
| `viw`  | Select inner word         |
| `vip`  | Select inner paragraph    |
| `>>`   | Indent line               |
| `<<`   | Unindent line             |
| `==`   | Auto-indent line          |
| `gg=G` | Auto-indent entire file   |

### Multi-Cursor Editing

| Keybind    | Action                       |
| ---------- | ---------------------------- |
| `<Space>m` | Toggle multi-cursor mode     |
| `Ctrl+n`   | Add cursor to next match     |
| `Ctrl+p`   | Add cursor to previous match |
| `Ctrl+x`   | Skip current and get next    |

### Comment Toggle

| Keybind       | Action                   |
| ------------- | ------------------------ |
| `gcc`         | Toggle line comment      |
| `gbc`         | Toggle block comment     |
| Visual + `gc` | Toggle comment selection |

---

## 🌳 Git Integration

### Git Signs

| Keybind     | Action             |
| ----------- | ------------------ |
| `<Space>gj` | Next hunk          |
| `<Space>gk` | Previous hunk      |
| `<Space>gp` | Preview hunk       |
| `<Space>gr` | Reset hunk         |
| `<Space>gs` | Stage hunk         |
| `<Space>gu` | Undo stage hunk    |
| `<Space>gS` | Stage buffer       |
| `<Space>gR` | Reset buffer       |
| `<Space>gb` | Blame line         |
| `<Space>gB` | Blame full file    |
| `<Space>gd` | Diff this          |
| `<Space>gD` | Diff against index |

### Lazygit Integration

| Keybind     | Action                  |
| ----------- | ----------------------- |
| `<Space>gg` | Open Lazygit            |
| `<Space>tl` | Toggle Lazygit terminal |

**Lazygit Commands (inside Lazygit):**

- `a` - Stage all
- `c` - Commit
- `P` - Push
- `p` - Pull
- `<Space>` - Stage/unstage file
- `d` - Discard changes
- `Enter` - View details
- `q` - Quit

---

## 💻 Terminal Usage

### Terminal Keybinds

| Keybind      | Action                             |
| ------------ | ---------------------------------- |
| `<Space>tt`  | Toggle floating terminal           |
| `<Space>th`  | Toggle horizontal terminal         |
| `<Space>tv`  | Toggle vertical terminal           |
| `<Space>tf`  | TermSelect (choose terminal)       |
| `<Ctrl-\>`   | Toggle terminal (in terminal mode) |
| `<Esc><Esc>` | Exit terminal mode                 |

### Terminal Workflow

**Open terminal:**

```vim
:terminal
" or
<Space>tt
```

**Switch to normal mode in terminal:**

- Press `<Ctrl-\><Ctrl-n>` or `<Esc><Esc>`

**Navigate out of terminal:**

- `<Ctrl-h/j/k/l>` - Move to other windows

### Common Terminal Commands

```bash
# Laravel Artisan
docker-compose exec app php artisan migrate
docker-compose exec app php artisan make:controller ProductController

# NPM
docker-compose exec app npm install
docker-compose exec app npm run dev

# Composer
docker-compose exec app composer install
docker-compose exec app composer require package/name

# Docker
docker-compose ps
docker-compose logs -f app
docker-compose restart app
```

---

## 🪟 Buffer & Window Management

### Buffer Management

| Keybind     | Action                  |
| ----------- | ----------------------- |
| `<Space>c`  | Close current buffer    |
| `<Space>C`  | Force close buffer      |
| `]b`        | Next buffer             |
| `[b`        | Previous buffer         |
| `<Space>b`  | Buffer picker           |
| `<Space>bb` | Move to previous buffer |
| `<Space>bd` | Delete buffer           |
| `<Space>bD` | Force delete buffer     |

### Window Splits

| Keybind     | Action                  |
| ----------- | ----------------------- |
| `<Space>\|` | Vertical split          |
| `<Space>-`  | Horizontal split        |
| `<Ctrl-h>`  | Move to left window     |
| `<Ctrl-j>`  | Move to down window     |
| `<Ctrl-k>`  | Move to up window       |
| `<Ctrl-l>`  | Move to right window    |
| `<Ctrl-w>=` | Equal window sizes      |
| `<Ctrl-w>o` | Close all other windows |
| `:q`        | Close current window    |

### Tabs

| Keybind     | Action       |
| ----------- | ------------ |
| `<Space>tn` | New tab      |
| `<Space>tc` | Close tab    |
| `]t`        | Next tab     |
| `[t`        | Previous tab |

---

## 📦 Mason Package Manager

### Mason Commands

```vim
:Mason              " Open Mason UI
:MasonInstall {pkg} " Install package
:MasonUninstall {pkg} " Uninstall package
:MasonUpdate        " Update all packages
:MasonLog           " View Mason logs
```

### Mason UI Navigation

| Key       | Action              |
| --------- | ------------------- |
| `i`       | Install package     |
| `u`       | Update package      |
| `U`       | Update all packages |
| `X`       | Uninstall package   |
| `<Enter>` | View package info   |
| `/`       | Search              |
| `g?`      | Help                |
| `q`       | Close Mason         |

### Installed Packages

**To check LSP status:**

```vim
:LspInfo
```

**To check Treesitter parsers:**

```vim
:TSInstallInfo
```

---

## 🎯 Language-Specific Tips

### JavaScript/TypeScript (React, Next.js)

**Auto-import:**

1. Type component name
2. Cursor on unimported component
3. Press `<Space>la` → Select "Add import"

**Format on save:** Already configured with prettier

**ESLint fixes:**

```vim
<Space>la
" Select ESLint: Fix all auto-fixable problems
```

**Common workflows:**

```bash
# Start dev server in terminal
npm run dev

# Type checking
npm run type-check
```

### PHP (Laravel)

**Generate boilerplate:**

```bash
# In terminal (:terminal)
docker-compose exec app php artisan make:model Product -mcr
```

**Intelephense features:**

- Jump to Model definition: `gd`
- Auto-complete relationships
- PHPDoc support

**Format Laravel blade:**
Install: `:MasonInstall blade-formatter`

### Go

**Auto-format on save:** Already configured with gofumpt

**Import management:** Auto-sorts and removes unused imports

**Useful commands:**

```bash
# Test
go test ./...

# Build
go build

# Run
go run main.go
```

**Go-specific keybinds:**

- `<Space>la` → "Organize imports"
- `gd` → Jump to definition (works cross-package)

### Dart/Flutter

**Run Flutter app:**

```bash
flutter run
# or hot-reload enabled
flutter run -d linux
```

**Widget refactoring:**

1. Cursor on widget
2. `<Space>la` → "Extract Widget"

**Dart format:**

```bash
dart format .
```

### Docker

**Dockerfile/docker-compose.yml LSP features:**

- Syntax highlighting
- Auto-completion for services
- Hadolint linting for Dockerfile

---

## 🐳 Docker Workflow

### Project Structure Check

```vim
" Open docker-compose.yml
:e docker-compose.yml

" Search for ports
/ports
" Press 'n' for next match
```

### Common Docker Commands in Terminal

```bash
# Start containers
docker-compose up -d

# View logs
docker-compose logs -f app

# Execute commands in container
docker-compose exec app bash
docker-compose exec app php artisan migrate

# Restart service
docker-compose restart app

# Stop all
docker-compose down

# Rebuild
docker-compose up -d --build

# Check container status
docker-compose ps
```

### Edit Multiple Files

**Split view for Docker files:**

```vim
" Open docker-compose.yml
:e docker-compose.yml

" Vertical split with Dockerfile
:vsplit Dockerfile

" Navigate between splits
<Ctrl-h> " Left window
<Ctrl-l> " Right window
```

---

## 🐛 Troubleshooting

### LSP Not Working

```vim
" Check LSP status
:LspInfo

" Restart LSP
:LspRestart

" Check logs
:LspLog
```

### Mason Package Issues

```vim
" View Mason logs
:MasonLog

" Reinstall package
:Mason
" Navigate to package, press 'X' then 'i'
```

### Treesitter Issues

```vim
" Update all parsers
:TSUpdate

" Install specific parser
:TSInstall javascript typescript php go dart

" Check installed parsers
:TSInstallInfo
```

### Performance Issues

```vim
" Disable LSP for large files
:LspStop

" Clear cache
:lua vim.cmd('checkhealth')
```

### Plugin Issues

```vim
" Update all plugins
:Lazy sync

" Clean unused plugins
:Lazy clean

" View plugin logs
:Lazy log
```

---

## 🛠️ Useful Commands

### General Commands

| Command            | Description                  |
| ------------------ | ---------------------------- |
| `:w`               | Save file                    |
| `:wq` or `:x`      | Save and quit                |
| `:q`               | Quit                         |
| `:q!`              | Force quit (discard changes) |
| `:wa`              | Save all buffers             |
| `:qa`              | Quit all                     |
| `:e filename`      | Edit file                    |
| `:saveas filename` | Save as new file             |
| `:!command`        | Execute shell command        |

### AstroNvim Specific

| Command                       | Description                 |
| ----------------------------- | --------------------------- |
| `:AstroUpdate` or `<Space>pa` | Update AstroNvim + packages |
| `:AstroReload`                | Reload AstroNvim config     |
| `:AstroChangelog`             | View changelog              |
| `:Lazy`                       | Manage plugins              |
| `:Mason`                      | Manage LSP/formatters       |
| `:checkhealth`                | Check Neovim health         |

### File Operations

| Command                | Description                  |
| ---------------------- | ---------------------------- |
| `:w !sudo tee %`       | Save file as sudo            |
| `:source %`            | Reload current file          |
| `:edit!`               | Reload file from disk        |
| `:set fileformat=unix` | Convert to Unix line endings |

---

## ⌨️ Custom Keybinds (Quick Reference)

### Leader Key: `<Space>`

**File Operations:**

- `<Space>e` - File explorer
- `<Space>ff` - Find files
- `<Space>fw` - Find word
- `<Space>c` - Close buffer

**LSP:**

- `<Space>la` - Code actions
- `<Space>lf` - Format
- `<Space>lr` - Rename
- `gd` - Go to definition

**Git:**

- `<Space>gg` - Lazygit
- `<Space>gs` - Stage hunk
- `<Space>gp` - Preview hunk

**Terminal:**

- `<Space>tt` - Toggle terminal
- `<Space>th` - Horizontal terminal
- `<Space>tv` - Vertical terminal

**Window:**

- `<Space>|` - Vertical split
- `<Space>-` - Horizontal split
- `<Ctrl-h/j/k/l>` - Navigate windows

---

## 🚀 Quick Start Workflow

### Opening a Project

```bash
# Navigate to project
cd ~/projects/my-app

# Open in Neovim
nvim .

# Wait for LSP to load (check status bar)
```

### Editing Files

1. **Find file:** `<Space>ff`, type filename, `Enter`
2. **Edit:** Press `i` to enter insert mode
3. **Auto-complete:** Type and use `Tab` to navigate suggestions
4. **Save:** `Esc` then `:w`
5. **Format:** `<Space>lf`

### Running Project

1. **Open terminal:** `<Space>tt`
2. **Run commands:**
   ```bash
   npm run dev
   # or
   docker-compose up -d
   ```
3. **Back to editor:** `<Esc><Esc>` then `<Ctrl-k>`

### Git Workflow

1. **Make changes** in files
2. **Open Lazygit:** `<Space>gg`
3. **Stage:** `<Space>` on files
4. **Commit:** `c`, write message, save (`:wq`)
5. **Push:** `P`

---

## 📚 Additional Resources

- **AstroNvim Docs:** https://docs.astronvim.com
- **Neovim Docs:** https://neovim.io/doc
- **Vim Cheat Sheet:** https://vim.rtorr.com
- **Lazy.nvim:** https://github.com/folke/lazy.nvim
- **Mason:** https://github.com/williamboman/mason.nvim

---

## 💡 Pro Tips

1. **Practice basic navigation** first (hjkl, w, b, 0, $)
2. **Learn one feature at a time** - don't overwhelm yourself
3. **Use `:Telescope keymaps`** to explore available keybinds
4. **Check `:help {keyword}`** for detailed help
5. **Customize configs** in `~/.config/nvim/lua/plugins/`
6. **Stay in Normal mode** - minimize time in Insert mode
7. **Use text objects** - `ciw`, `ci"`, `dap` are powerful
8. **Master buffer management** - keep workspace clean
9. **Use marks** - `ma` to set, `'a` to jump
10. **Learn regex search** - `:%s/old/new/g` for find-replace

---

## 🎓 Learning Path

### Week 1: Basics

- Movement (hjkl, w, b, gg, G)
- Modes (Normal, Insert, Visual)
- Basic editing (x, dd, yy, p, u)
- File explorer (`<Space>e`)

### Week 2: Intermediate

- LSP features (gd, gr, K, `<Space>la`)
- Fuzzy finder (`<Space>ff`, `<Space>fw`)
- Git integration (`<Space>gg`)
- Terminal usage (`<Space>tt`)

### Week 3: Advanced

- Text objects (ciw, ci", dap)
- Macros (q{register}, @{register})
- Advanced navigation (marks, jumps)
- Custom keybinds

### Week 4: Mastery

- Workflow optimization
- Plugin customization
- Language-specific features
- Advanced LSP usage

---
