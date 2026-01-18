# Development Environment Setup

This guide provides step-by-step installation instructions for TMUX, Neovim, and NvChad on macOS and Windows, along with essential commands for backend/infrastructure development.

## Prerequisites

- **macOS**: Xcode Command Line Tools
  ```bash
  xcode-select --install
  ```
- **Windows**: Windows Terminal (recommended)

---

## 🚀 Installation

### macOS

#### Homebrew Installation
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### TMUX
```bash
brew install tmux
```

#### Neovim
```bash
brew install neovim
```

#### NvChad
```bash
git clone https://github.com/lucchesisp/neovim ~/.config/nvim --depth 1 && nvim
```
After opening Neovim, type `:MasonInstallAll` and press Enter to install LSPs, formatters, and linters.

---

### Windows (WSL2 - Recommended)

#### Install WSL2
1. Open PowerShell as Administrator
2. Run:
```powershell
wsl --install
```
3. Restart your computer and complete the Ubuntu setup

#### Install Homebrew on WSL
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### TMUX
```bash
brew install tmux
```

#### Neovim
```bash
brew install neovim
```

#### NvChad
```bash
git clone https://github.com/lucchesisp/neovim ~/.config/nvim --depth 1 && nvim
```
After opening Neovim, type `:MasonInstallAll` and press Enter.

---

### Windows (Native)

#### Using Chocolatey
1. Open PowerShell as Administrator
2. Install Chocolatey:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

#### TMUX (via wsltty or MobaXterm)
Windows doesn't have native tmux. Options:
- **MobaXterm**: https://mobaxterm.mobatek.net/
- **wsltty**: `choco install wsltty`

#### Neovim
```powershell
choco install neovim
```

#### NvChad
```powershell
git clone https://github.com/lucchesisp/neovim $env:LOCALAPPDATA\nvim --depth 1 && nvim
```
After opening Neovim, type `:MasonInstallAll` and press Enter.

---

## ⚡ TMUX Commands

### Sessions

| Action | Command |
|--------|---------|
| Create new session | `tmux new -s session_name` |
| List sessions | `tmux ls` |
| Attach to session | `tmux attach -t session_name` |
| Leave session (detach) | `Ctrl+b d` |
| Kill session | `tmux kill-session -t session_name` |
| Kill all sessions | `tmux kill-server` |
| Rename session | `Ctrl+b $` |

### Windows

| Action | Command |
|--------|---------|
| Create new window | `Ctrl+b c` |
| List windows | `Ctrl+b w` |
| Rename window | `Ctrl+b ,` |
| Delete window | `Ctrl+b &` |
| Next window | `Ctrl+b n` |
| Previous window | `Ctrl+b p` |
| Go to window number | `Ctrl+b [0-9]` |

### Panes

| Action | Command |
|--------|---------|
| Create vertical pane | `Ctrl+b %` |
| Create horizontal pane | `Ctrl+b "` |
| Navigate between panes | `Ctrl+b` + Arrow keys |
| Delete pane | `Ctrl+b x` |
| Resize pane (step by step) | `Ctrl+b` + `Ctrl` + Arrow keys |
| Toggle pane zoom | `Ctrl+b z` |
| Swap panes | `Ctrl+b {` or `Ctrl+b }` |
| Split pane into new window | `Ctrl+b !` |

### Useful Commands

| Action | Command |
|--------|---------|
| Reload config | `tmux source-file ~/.tmux.conf` |
| Scroll in pane | `Ctrl+b [` then use arrow keys, press `q` to exit |
| Copy mode | `Ctrl+b [` |
| Paste copied text | `Ctrl+b ]` |
| Show keybindings | `Ctrl+b ?` |
| Search in copy mode | `Ctrl+b [` then `/` |
| Synchronize panes | `Ctrl+b :set synchronize-panes` |

---

## ⌨️ NvChad / Neovim Commands

### macOS Keyboard Notes

- **Function keys (F1-F12)**: On Mac keyboards without a numeric keypad, press `fn` + F key
- **Control (Ctrl)**: Works normally in Terminal.app
- **Option (⌥)**: Functions as Alt key (`<M-...>` in Neovim)
- **Command (⌘)**: Not used in Neovim by default (use Ctrl instead)

**Keymapping adjustments for macOS:**
- `<F5>` = `fn` + `F5` (or just F5 on full keyboards)
- `<F10>` = `fn` + `F10` (or just F10 on full keyboards)
- `<F11>` = `fn` + `F11` (or just F11 on full keyboards)
- `<F12>` = `fn` + `F12` (or just F12 on full keyboards)
- `<C-p>` = `Ctrl` + `p`
- `<leader>` = `Space` (default in NvChad)

### File Explorer (NvimTree)

| Action | Command / Keybinding |
|--------|---------------------|
| Toggle file explorer | `<leader>e` or `:NvimTreeToggle` |
| Focus file explorer | `<leader>o` |
| Find file | `<C-p>` or `:Telescope find_files` |
| Live grep (search text) | `<leader>fw` or `:Telescope live_grep` |
| Search in current file | `:Telescope current_buffer_fuzzy_find` |
| Create new file | `a` (in NvimTree) |
| Create new folder | `A` (in NvimTree) |
| Delete file/folder | `d` (in NvimTree) |
| Rename file/folder | `r` (in NvimTree) |
| Move/cut file/folder | `x` (in NvimTree) |
| Paste file/folder | `p` (in NvimTree) |

### Buffer Management

| Action | Command / Keybinding |
|--------|---------------------|
| New buffer | `:e filename` or `:new` |
| Close buffer | `<leader>x` or `:bd` |
| Next buffer | `]b` or `:bnext` |
| Previous buffer | `[b` or `:bprev` |
| Go to buffer number | `:b [1-9]` |
| List buffers | `:ls` or `:buffers` |
| Save buffer | `:w` or `<leader>w` |
| Save and quit | `:wq` |
| Save all buffers | `:wa` |
| Close all buffers | `:qa` |

### Window Management

| Action | Command / Keybinding |
|--------|---------------------|
| Split horizontal | `<leader>sv` or `:split` |
| Split vertical | `<leader>sh` or `:vsplit` |
| Close window | `<leader>c` or `:close` |
| Move to next window | `<C-w> l` |
| Move to previous window | `<C-w> h` |
| Move to top window | `<C-w> k` |
| Move to bottom window | `<C-w> j` |
| Make window wider | `<C-w> >` |
| Make window narrower | `<C-w> <` |
| Make window taller | `<C-w> +` |
| Make window shorter | `<C-w> -` |
| Equalize window sizes | `<C-w> =` |
| Maximize window | `<C-w> _` or `<C-w> |` |

### Tab Management

| Action | Command / Keybinding |
|--------|---------------------|
| New tab | `:tabnew` or `:tabe filename` |
| Next tab | `gt` or `:tabnext` |
| Previous tab | `gT` or `:tabprev` |
| Go to tab number | `:tabn [1-9]` |
| Close tab | `:tabclose` |

### LSP (Language Server Protocol) Commands

| Action | Command / Keybinding |
|--------|---------------------|
| Code actions (quick fix) | `<leader>ca` or `:lua vim.lsp.buf.code_action()` |
| Go to definition | `gd` |
| Go to type definition | `:Telescope lsp_type_definitions` |
| Go to references | `gr` or `:Telescope lsp_references` |
| Go to implementation | `gI` or `:Telescope lsp_implementations` |
| Hover documentation | `K` |
| Signature help | `<leader>sh` |
| Rename symbol | `<leader>rn` or `:lua vim.lsp.buf.rename()` |
| Format buffer | `<leader>fm` |
| List diagnostics | `<leader>ds` or `:Telescope diagnostics` |
| Next diagnostic | `]d` |
| Previous diagnostic | `[d` |
| Show line diagnostics | `gl` |

### Import Management (Go/Python/TS/Java)

| Action | Command / Keybinding |
|--------|---------------------|
| Organize imports (Go) | `<leader>oi` |
| Remove unused imports (Go) | `<leader>ri` |
| Add missing import (all) | Type symbol and use code action `<leader>ca` |

**Go Import Features:**
- **Auto-add imports**: When you type a symbol from another package, gopls automatically suggests adding the import
- **Auto-remove imports**: On save/format, unused imports are automatically removed
- **Organize imports**: Groups and sorts imports according to Go conventions
- **Format on save**: Go files are automatically formatted with `gofumpt` (improved gofmt)

### Search and Navigation

| Action | Command / Keybinding |
|--------|---------------------|
| Fuzzy find files | `<C-p>` |
| Search in files (grep) | `<leader>fw` |
| Search files by content | `<leader>fg` |
| Search command palette | `<leader>:` or `:Telescope command_palette` |
| Search keymaps | `<leader>fk` |
| Search buffers | `<leader>fb` |
| Search help tags | `<leader>fh` |
| Search git files | `<leader>gc` |
| Search git commits | `<leader>gs` |
| Search git status | `<leader>gt` |
| Old files (recent) | `<leader>fo` |

### Search and Replace (Current File)

| Action | Command |
|--------|---------|
| Search for word under cursor | `*` (forward) / `#` (backward) |
| Search for pattern | `/pattern` then `Enter` |
| Find next occurrence | `n` |
| Find previous occurrence | `N` |
| Replace next occurrence | `:s/old/new` |
| Replace all in current line | `:s/old/new/g` |
| Replace all in file (with confirmation) | `:%s/old/new/gc` |
| Replace all in file (no confirmation) | `:%s/old/new/g` |
| Replace in selected lines | `:'<,'>s/old/new/g` (visual mode) |
| Replace in multiple lines range | `:10,50s/old/new/g` |
| Replace with case insensitivity | `:%s/old/new/gi` |
| Replace whole words only | `:%s/\<old\>/new/g` |
| Search and replace with regex | `:%s/\v(old_pattern)/new/g` |
| Substitute from cursor to end | `:.,$s/old/new/g` |

### Search and Replace (Multiple Files)

| Action | Command |
|--------|---------|
| Search in all files | `:vimgrep /pattern/ **/*` |
| Search in file type | `:vimgrep /pattern/ **/*.py` |
| Open quickfix list | `:copen` |
| Next in quickfix | `:cn` |
| Previous in quickfix | `:cp` |
| Replace in all open buffers | `:bufdo %s/old/new/ge` |
| Replace in all files in directory | `:argdo %s/old/new/ge | update` |

### Text Object Manipulation

| Action | Command |
|--------|---------|
| Change word inside quotes | `ci"` or `ci'` |
| Change word inside parentheses | `ci(` or `ci)` |
| Change word inside brackets | `ci[` or `ci]` |
| Change word inside braces | `ci{` or `ci}` |
| Change word inside tag | `cit` |
| Delete word inside quotes | `di"` or `di'` |
| Delete word inside parentheses | `di(` or `di)` |
| Delete word inside brackets | `di[` or `di]` |
| Delete word inside braces | `di{` or `di}` |
| Yank word inside quotes | `yi"` or `yi'` |
| Select word inside quotes | `vi"` or `vi'` |
| Select entire function | `vaf` or `dif` |
| Select inside function | `vif` |
| Change entire sentence | `cis` |
| Change entire paragraph | `cip` |

### Macros (Record and Replay)

| Action | Command |
|--------|---------|
| Start recording to register `a` | `qa` |
| Stop recording | `q` |
| Play macro from register `a` | `@a` |
| Play macro 10 times | `10@a` |
| Repeat last macro | `@@` |
| Edit macro in register `a` | `:put @a` then edit, then `0"ay$` |
| Append to macro | `qA` |
| Run macro on visual selection | `:normal @a` |
| Run macro on each line | `:%norm @a` |

### Registers (Clipboard History)

| Action | Command |
|--------|---------|
| Paste from register `a` | `"ap` |
| Yank to register `a` | `"ay` |
| Delete to register `a` | `"add` |
| Yank to system clipboard | `"+y` |
| Paste from system clipboard | `"+p` |
| Show all registers | `:reg` |
| Paste from register 0 (last yank) | `"0p` |
| Paste from register 1 (last delete) | `"1p` |
| Paste from register 2 (second last delete) | `"2p` |
| Paste from register . (last inserted) | `".p` |
| Paste from register % (current file) | `"%p` |

### Code Folding

| Action | Command |
|--------|---------|
| Toggle fold | `za` |
| Open fold | `zo` |
| Close fold | `zc` |
| Open all folds | `zR` |
| Close all folds | `zM` |
| Fold more | `zm` |
| Fold less | `zr` |
| Delete all folds | `zE` |
| Fold based on indent | `:set foldmethod=indent` |
| Fold based on syntax | `:set foldmethod=syntax` |
| Fold based on marker | `:set foldmethod=marker` |

### Quick Navigation

| Action | Command |
|--------|---------|
| Jump to definition | `gd` |
| Jump to type definition | `gD` |
| Go to previous location | `<C-o>` |
| Go to next location | `<C-i>` |
| Go to last edited position | `''` or `` ` `` |
| Go to last edit position in file | `:e #` |
| Jump to matching pair | `%` |
| Jump to start of block | `[{` |
| Jump to end of block | `]}` |
| Jump to start of function | `[[` |
| Jump to end of function | `]]` |
| Go to next method (in languages) | `]m` |
| Go to previous method (in languages) | `[m` |

### Multiple Cursors / Visual Operations

| Action | Command |
|--------|---------|
| Visual select line | `V` |
| Visual select character | `v` |
| Visual select block | `Ctrl+v` |
| Add cursor to next matching word | `<leader>mn` (if nvim-multi-cursor) |
| Select all occurrences | `:g/pattern/norm! viw` |
| Increment numbers | `Ctrl+a` |
| Decrement numbers | `Ctrl+x` |
| Visual block append | `Ctrl+v` then select, then `I` then type, then `Esc` |
| Visual block replace | `Ctrl+v` then select, then `r` then character |
| Duplicate line up | `:t .` or `:t -1` |
| Duplicate line down | `:t .` or `:t +1` |
| Move line down | `:m +1` or `ddp` |
| Move line up | `:m -2` or `ddkP` |

### Advanced Text Manipulation

| Action | Command |
|--------|---------|
| Join lines | `J` |
| Join multiple lines | `5J` |
| Join lines without spaces | `gJ` |
| Split line at cursor | `r` + `Enter` |
| Insert character in all lines (block) | `Ctrl+v` select, `I` type, `Esc` |
| Append character in all lines (block) | `Ctrl+v` select, `A` type, `Esc` |
| Replace character in all lines (block) | `Ctrl+v` select, `r` character |
| Change case to uppercase | `gU` + motion |
| Change case to lowercase | `gu` + motion |
| Toggle case | `~` |
| Rot13 encoding | `g?` |
| Reverse line order | `:g/^/m0` |
| Sort lines visually | `:sort` |
| Sort lines in reverse | `:sort!` |
| Remove duplicate lines | `:sort u` |

### Quick Fixes and Refactoring

| Action | Command |
|--------|---------|
| Quick fix list | `:copen` |
| Next quick fix | `:cnext` |
| Previous quick fix | `:cprev` |
| Auto import missing symbol | `<leader>ca` (code action) |
| Organize imports | `<leader>oi` (if configured) |
| Remove unused imports | `<leader>ri` (if configured) |
| Extract to variable | `<leader>ev` (if configured) |
| Extract to function | `<leader>ef` (if configured) |
| Inline variable | `<leader>iv` (if configured) |
| Rename file and update imports | `<leader>rf` (if configured) |

### Terminal

| Action | Command / Keybinding |
|--------|---------------------|
| Open terminal | `<C-/>` or `:terminal` |
| Toggle terminal | `<leader>pt` (lazygit) or `<leader>tt` |
| Close terminal | `exit` or `Ctrl+d` |
| Navigate to terminal | `<C-w>` then direction |

### Git Integration

| Action | Command / Keybinding |
|--------|---------------------|
| Open lazygit | `<leader>gg` or `<leader>pt` |
| Git diff | `:Telescope git_diffs` |
| Git branches | `:Telescope git_branches` |
| Git status | `:Gitsigns diffthis` |
| Stage hunk | `:Gitsigns stage_hunk` |
| Unstage hunk | `:Gitsigns undo_stage_hunk` |
| Reset buffer | `:Gitsigns reset_buffer` |

### Useful Commands for Backend/Infrastructure Development

| Action | Command |
|--------|---------|
| Run file | `:lua run_file()` (if configured) |
| Test file | `:lua require('neotest').run.run()` |
| Test nearest | `:lua require('neotest').run.run({strategy = 'nearest'})` |
| Test file with debug | `:lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})` |
| Toggle breakpoint | `<leader>b` |
| Continue debugging | `fn` + `F5` |
| Step over | `fn` + `F10` |
| Step into | `fn` + `F11` |
| Step out | `fn` + `F12` |
| Show dapui | `<leader>du` |
| Toggle dapui | `<leader>de` |
| Evaluate expression | `<leader>de` |
| Comment line | `gcc` |
| Comment block | `gc` (visual mode) |
| Toggle comment | `gb` |
| Surround with quotes | `cs"'` |
| Delete surrounding | `ds"` |
| Change surrounding | `cs"'` |
| Format document | `<leader>fm` |
| Organize imports | `:lua require('nvim-treesitter.incremental_selection').init_selection()` |

### Docker/DevOps Useful Commands

| Action | Command |
|--------|---------|
| Search Dockerfile | `:Telescope find_files search=Dockerfile` |
| Search docker-compose files | `:Telescope find_files search=docker-compose` |
| Search Terraform files | `:Telescope find_files search=*.tf` |
| Search Kubernetes manifests | `:Telescope live_grep search=k8s` |

### Configuration

| Action | Command |
|--------|---------|
| Open NvChad config | `:NvChad` or `:e ~/.config/nvim/` |
| Open NvChad cheatsheet | `<leader>ch` |
| Mason (LSP manager) | `:Mason` |
| Lazy (plugin manager) | `:Lazy` |
| Update plugins | `:Lazy sync` |
| Clean plugins | `:Lazy clean` |
| Check plugins | `:Lazy check` |
| Profile startup | `:Lazy profile` |
| Health check | `:checkhealth` |

### Navigation

| Action | Command |
|--------|---------|
| Go to line | `:line_number` |
| Go to first line | `gg` |
| Go to last line | `G` |
| Go to start of line | `0` |
| Go to end of line | `$` |
| Go to word | `w` (forward) / `b` (backward) |
| Go to matching brace | `%` |
| Jump to mark | `` `'` `` |
| Set mark | `m` + letter |
| Delete to end of line | `D` |
| Delete to start of line | `d0` |
| Delete word | `dw` |
| Delete line | `dd` |
| Yank (copy) line | `yy` |
| Paste | `p` (after) / `P` (before) |
| Undo | `u` |
| Redo | `Ctrl+r` |
| Repeat last command | `.` |

### Jump List and Marks

| Action | Command |
|--------|---------|
| Jump to previous position in jump list | `<C-o>` |
| Jump to next position in jump list | `<C-i>` |
| Show jump list | `:jumps` |
| Set local mark `a` | `ma` |
| Set global mark `A` | `mA` |
| Jump to local mark `a` | `` `a `` |
| Jump to global mark `A` | `` `A `` |
| Show all marks | `:marks` |
| Delete mark `a` | `:delmarks a` |
| Delete all marks | `:delmarks!` |

### File Operations

| Action | Command |
|--------|---------|
| Save file | `:w` |
| Save as | `:w filename` |
| Quit | `:q` |
| Quit without saving | `:q!` |
| Save and quit | `:wq` |
| Save all and quit | `:wqa` |
| Read file into buffer | `:r filename` |
| Insert file content at cursor | `:r !cat filename` |
| Edit file in new buffer | `:e filename` |
| Reload file from disk | `:e!` |
| Show file info | `:f` or `Ctrl+g` |
| Change file type | `:set filetype=python` |

### Session and View Management

| Action | Command |
|--------|---------|
| Save session | `:mksession session.vim` |
| Load session | `:source session.vim` |
| Save view (position, folds) | `:mkview` |
| Load view | `:loadview` |
| Create layout snapshot | `:mks!` |
| Split and edit file | `:split filename` |
| Vsplit and edit file | `:vsplit filename` |
| Go to previous tab | `:tabp` |
| Go to next tab | `:tabn` |

### Diff and Comparison

| Action | Command |
|--------|---------|
| Diff two files | `:diffsplit filename` |
| Diff vertical | `:vert diffsplit filename` |
| Next diff change | `]c` |
| Previous diff change | `[c` |
| Put changes from other diff window | `dp` |
| Get changes from other diff window | `do` |
| Update diff | `:diffupdate` |
| Turn off diff mode | `:diffoff` |

### Search in Project

| Action | Command |
|--------|---------|
| Search word in all files | `:grep -r "word" .` |
| Search with ripgrep | `:Rg "pattern"` |
| Search with Telescope live grep | `<leader>fw` |
| Search in git files only | `:Grep "pattern"` |
| Search and replace in files | `:args **/*.py | argdo %s/old/new/ge | update` |
| Search only in comments | `:g/\/\/ normal command` |
| Search only in strings | `:g/" normal command` |

### Quick Actions

| Action | Command |
|--------|---------|
| Indent line | `>>` |
| Unindent line | `<<` |
| Indent selection | `>` |
| Unindent selection | `<` |
| Auto indent entire file | `gg=G` |
| Remove trailing whitespace | `:%s/\s\+$//e` |
| Remove blank lines | `:g/^$/d` |
| Compress blank lines | `:g/^\n\{2,}/./d` |
| Add line numbers | `:g/^/s/^/\=line('.').' '` |
| Remove line numbers | `:s/^\d\+\s\+//` |
| Center line | `:ce` |
| Left align line | `:le` |
| Right align line | `:ri` |

### Spell Check

| Action | Command |
|--------|---------|
| Enable spell check | `:set spell` |
| Disable spell check | `:set nospell` |
| Set language to English | `:set spelllang=en` |
| Set language to Portuguese | `:set spelllang=pt` |
| Next spelling error | `]s` |
| Previous spelling error | `[s` |
| Add word to dictionary | `zg` |
| Remove word from dictionary | `zw` |
| Suggest corrections | `z=` |
| Undo spelling change | `zu` |

### Autocomplete and Snippets

| Action | Command |
|--------|---------|
| Trigger autocomplete | `Ctrl+x Ctrl+o` |
| Complete file path | `Ctrl+x Ctrl+f` |
| Complete line | `Ctrl+x Ctrl+l` |
| Complete word from buffer | `Ctrl+n` / `Ctrl+p` |
| Complete word from dictionary | `Ctrl+x Ctrl+k` |
| Complete with tags | `Ctrl+x Ctrl+]` |
| Complete with omni | `Ctrl+x Ctrl+o` |
| Expand snippet | `Tab` (with luasnip) |
| Jump to next snippet placeholder | `Ctrl+j` |
| Jump to previous snippet placeholder | `Ctrl+k` |

### File Encoding and Format

| Action | Command |
|--------|---------|
| Show file encoding | `:set fileencoding?` |
| Show file format | `:set fileformat?` |
| Convert to UTF-8 | `:set fileencoding=utf-8` |
| Convert to Unix line endings | `:set fileformat=unix` |
| Convert to Windows line endings | `:set fileformat=dos` |
| Convert to Mac line endings | `:set fileformat=mac` |
| Reload with specific encoding | `:e ++enc=latin1` |
| Write with specific encoding | `:w ++enc=utf-8` |

---

## 🎯 LSP Configuration

Language Servers configured:
- Go: gopls
- Java: jdtls
- Python: pyright
- JavaScript/TypeScript: ts_ls
- ESLint: eslint
- HTML: html
- CSS: cssls

### Installation

Use Mason to install LSP servers:
```bash
:Mason
```

Install: gopls, jdtls, pyright, typescript-language-server, eslint-lsp, html-lsp, css-lsp

---

## 🎯 Debug (DAP) Configuration

Debug adapters configured for:
- Go: delve (dlv)
- Java: jdtls (built-in)
- Python: debugpy

### Required Plugins

- nvim-dap - Debug Adapter Protocol client
- nvim-dap-ui - UI for debugger
- nvim-dap-virtual-text - Virtual text for variable values

### Installation

Use Mason to install debug adapters:
```bash
:Mason
```

Install: delve, debugpy

### Keymaps (macOS)

#### Debug Controls
- `fn` + `F5` - Start/Continue debugging (or just F5 on full keyboards)
- `fn` + `F10` - Step over (or just F10 on full keyboards)
- `fn` + `F11` - Step into (or just F11 on full keyboards)
- `fn` + `F12` - Step out (or just F12 on full keyboards)

#### Breakpoints
- `<leader>b` - Toggle breakpoint
- `<leader>B` - Set conditional breakpoint
- `<leader>lp` - Set log point

#### UI & Interaction
- `<leader>du` - Toggle debug UI
- `<leader>dr` - Open REPL
- `<leader>dl` - Run last debug session
- `<leader>de` - Evaluate expression (visual selection or input)

### nvim-dap-virtual-text Configuration

This plugin displays variable values directly in your code during debugging sessions using virtual text.

#### Configuration Options

| Option | Value | Description |
|--------|--------|-------------|
| `enabled` | `true` | Enable the plugin |
| `enabled_commands` | `true` | Create commands: DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle |
| `highlight_changed_variables` | `true` | **Highlight changed variable values** with NvimDapVirtualTextChanged (yellow/warn color) |
| `highlight_new_as_changed` | `false` | Highlight new variables the same way as changed variables |
| `show_stop_reason` | `true` | Show stop reason when stopped for exceptions |
| `commented` | `false` | Prefix virtual text with comment string |
| `only_first_definition` | `true` | Only show virtual text at first definition (if there are multiple) |
| `all_references` | `false` | Show virtual text on all references of variable (not only definitions) |
| `clear_on_continue` | `false` | Clear virtual text on "continue" (might cause flickering) |
| `virt_text_pos` | `'inline'` (Neovim 0.10+) or `'eol'` | Position of virtual text in line or at end of line |
| `all_frames` | `true` | Show virtual text for all stack frames, not only current |
| `virt_text_win_col` | `80` | Position virtual text at fixed window column (80) for alignment |

#### Highlight Groups

- `NvimDapVirtualText` - Variable values (linked to Comment, green/gray)
- `NvimDapVirtualTextChanged` - Changed variable values (linked to DiagnosticVirtualTextWarn, yellow)
- `NvimDapVirtualTextError` - Exception messages (linked to DiagnosticVirtualTextError, red)

#### How It Works

**Example of debugging a Go function:**

```go
func main() {
    x := 10    // x = 10
    x = x + 5   // x = 15 [yellow] ← value changed!
    y := 20    // y = 20
    fmt.Println(x + y)
}
```

- **Initial value**: `x = 10` appears in gray/green
- **After change**: `x = 15` appears in **yellow** to highlight the change
- **New variable**: `y = 20` appears in gray/green (not highlighted)

#### Benefits

- **Visual debugging**: See variable values directly in code without switching windows
- **Change detection**: Changed values are highlighted in yellow for quick identification
- **Multi-frame support**: See variables from all stack frames (not just current)
- **Aligned display**: Values appear at column 80 for consistent layout
- **Inline mode**: In Neovim 0.10+, values appear inline for better readability

#### Commands (if enabled_commands is true)

| Command | Action |
|---------|--------|
| `:DapVirtualTextEnable` | Enable virtual text display |
| `:DapVirtualTextDisable` | Disable virtual text display |
| `:DapVirtualTextToggle` | Toggle virtual text display |
| `:DapVirtualTextForceRefresh` | Force refresh virtual text |

### How to Debug

#### Python
1. Open Python file
2. Press `fn` + `F5` to start debugging
3. Use breakpoints to step through code

#### Go
1. Open Go file
2. Press `fn` + `F5` to start debugging
3. Select "Debug" or "Debug test" configuration

#### Java
1. Open Java file in a project with build system (Maven/Gradle)
2. Press `fn` + `F5` to start debugging
3. jdtls will automatically configure the debugger

### Note on Debug Adapters

Each language requires its own debug adapter:
- Go uses delve
- Java uses jdtls (built-in)
- Python uses debugpy

There is no universal debugger - each adapter communicates with specific runtime and toolchain of its language.

---

## 🎯 Recommended LSPs for Backend/Infrastructure

Install these LSPs via Mason (`:Mason`):

### Backend Languages
- **Go**: `gopls`
- **Python**: `pyright` or `jedi-language-server`
- **TypeScript/JavaScript**: `typescript-language-server` / `eslint-lsp`
- **Java**: `jdtls`
- **C#**: `omnisharp`
- **Rust**: `rust-analyzer`
- **PHP**: `intelephense`

### Infrastructure/DevOps
- **Terraform**: `terraform-ls`
- **Docker**: `dockerfile-language-server` / `docker-compose-language-service`
- **YAML**: `yaml-language-server`
- **Helm**: `helm-ls`
- **Kubernetes**: `kube-lsp`

### Utilities
- **Formatters**: `prettier`, `black`, `gofmt`, `stylua`
- **Linters**: `eslint`, `flake8`, `shellcheck`, `hadolint`
- **DAP (Debugging)**: `debugpy`, `delve` (Go), `node-debug2`

---

## 💡 Tips

1. **Leader Key**: Default is `Space` in NvChad
2. **Custom Keybindings**: Check `~/.config/nvim/lua/mappings.lua`
3. **Custom Config**: Add custom settings in `~/.config/nvim/lua/custom/`
4. **Reload Config**: Run `:source %` in init.lua or restart nvim
5. **Session Management**: Consider installing `persistence.nvim` for session saving
6. **Project Switching**: Use `<leader>fp` (find projects) if configured

---

## 🚀 Productivity Workflows

### Fast Refactoring Workflow
```vim
" 1. Use gd to jump to definition
" 2. Use gr to see references
" 3. Use <leader>rn to rename symbol
" 4. Use <leader>ca for code actions (quick fixes)
```

### Bulk Replace Workflow
```vim
" Replace variable across entire project
1. :cd /project/root
2. :args **/*.py
3. :argdo %s/oldVariable/newVariable/ge | update
```

### Multi-file Search Workflow
```vim
" 1. Use <leader>fw to search across all files (Telescope live grep)
" 2. Press Ctrl+o to open in split, Ctrl+v for vsplit
" 3. Use :copen to see all matches in quickfix
```

### Macro Automation Workflow
```vim
" 1. qa (start recording to register a)
" 2. Perform your edits
" 3. q (stop recording)
" 4. Visual select lines to apply macro
" 5. :norm @a (apply to selection)
```

### Quick Navigation Workflow
```vim
" Use marks for fast jumping:
1. ma (mark position as a)
2. Work elsewhere
3. `a (jump back to mark a instantly)
```

### Code Review Workflow
```vim
" 1. :Gitsigns diffthis (show git diff)
" 2. ]c / [c (navigate through changes)
" 3. :Telescope git_status (see all changed files)
" 4. <leader>gg (open lazygit for commits)
```

### Debugging Workflow (macOS)
```vim
" 1. <leader>b (toggle breakpoint)
" 2. fn+F5 (start debugging)
" 3. fn+F10 (step over) / fn+F11 (step into)
" 4. <leader>de (evaluate expression)
" 5. <leader>du (show dap UI)
```

### File Organization Workflow
```vim
" 1. :e . (open file explorer)
" 2. Use Telescope Ctrl+p for fuzzy finding
" 3. :bd to close buffers you don't need
" 4. :wa to save all buffers before commits
```

---

## 📚 Resources

- [TMUX Documentation](https://github.com/tmux/tmux/wiki)
- [Neovim Documentation](https://neovim.io/doc/)
- [NvChad Repository](https://github.com/NvChad/NvChad)
- [Telescope Documentation](https://github.com/nvim-telescope/telescope.nvim)
- [LSP Configuration](https://github.com/neovim/nvim-lspconfig)

---

# Shakespeare

"To be, or not to be, that is the question: Whether 'tis nobler in the mind to suffer The slings and arrows of outrageous fortune."
