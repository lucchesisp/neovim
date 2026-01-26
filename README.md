# NvChad Development Environment

A professional Neovim configuration built on top of NvChad, optimized for backend/infrastructure development with full support for debugging (DAP), Language Server Protocol (LSP), and modern development workflows.

This configuration transforms Neovim into a powerful IDE-like environment while maintaining the speed and efficiency of a terminal-based editor. It includes pre-configured support for Go, Python, TypeScript/JavaScript, Java, and more.

---

## Table of Contents

- [Key Concepts](#key-concepts)
- [Quick Start](#quick-start)
- [Understanding KeyMaps](#understanding-keymaps)
- [Debugging with DAP](#debugging-with-dap)
- [Essential KeyMaps](#essential-keymaps)
- [TMUX Integration](#tmux-integration)
- [Installed LSPs and Debug Adapters](#installed-lsps-and-debug-adapters)
- [Additional Resources](#additional-resources)

---

## Key Concepts

Before diving into the installation and usage, it's important to understand the core technologies and concepts that make this development environment work.

### What is Neovim?

**Neovim** is a modernized fork of the classic Vim text editor. It's a highly extensible, terminal-based text editor that emphasizes efficiency and keyboard-driven workflows. Unlike traditional IDEs, Neovim is:

- **Fast and lightweight**: Runs in the terminal with minimal resource usage
- **Modal editing**: Uses different modes (Normal, Insert, Visual) for different tasks
- **Highly customizable**: Can be extended with plugins written in Lua
- **Cross-platform**: Works on macOS, Linux, and Windows (WSL2)

### What is NvChad?

**NvChad** is a Neovim configuration framework that provides:

- Pre-configured, beautiful UI out of the box
- Plugin management system (lazy.nvim)
- Sensible defaults for modern development
- Easy customization without starting from scratch
- Built-in theme support and statusline

Think of NvChad as a "starter pack" that gives you 80% of an IDE's features with 20% of the effort.

### What is LSP (Language Server Protocol)?

**LSP** is a protocol that enables your editor to communicate with language-specific servers that provide:

- **Code completion**: Intelligent autocomplete suggestions
- **Go to definition**: Jump to where functions/variables are defined
- **Find references**: See where code is used throughout your project
- **Error detection**: Real-time syntax and semantic error highlighting
- **Refactoring**: Rename symbols, organize imports, and more

Each programming language has its own LSP server (e.g., `gopls` for Go, `pyright` for Python).

### What is DAP (Debug Adapter Protocol)?

**DAP** is a standardized protocol that allows your editor to communicate with debuggers. This configuration includes full DAP support, which means you can:

- Set breakpoints by clicking on line numbers
- Step through code line by line
- Inspect variable values in real-time
- Evaluate expressions during debugging
- View call stacks and navigate frames

DAP brings professional IDE debugging capabilities directly into Neovim. Instead of using separate debugging tools or relying on `print` statements, you get a fully integrated debugging experience similar to Visual Studio Code, IntelliJ, or PyCharm.

#### How DAP Works in This Configuration

1. **Visual Feedback**:
   - Breakpoints appear as red dots (`●`) in the gutter
   - The current debug line is highlighted with a green arrow (`→`) and background
   - Variable values appear inline in blue as you step through code
   - Changed variables are highlighted in orange/bold

2. **Debug Adapters**:
   - **Go**: Uses Delve (`dlv`)
   - **Python**: Uses debugpy
   - **Java**: Uses JDTLS built-in debugger

3. **Keybinding System**:
   - Traditional F-key shortcuts (F5, F9, F10, F11, F12) for familiarity with other IDEs
   - Semantic `<leader>d` prefix mappings for more control (e.g., `<leader>dc` for continue, `<leader>db` for breakpoint)

### Why TMUX is Recommended

**TMUX** (Terminal Multiplexer) is a terminal session manager that enhances your workflow by:

#### Key Benefits for Development

1. **Session Persistence**:
   - Your work environment survives terminal disconnections
   - Close your terminal, come back later, and everything is exactly as you left it
   - Perfect for SSH connections to remote servers

2. **Multiple Panes and Windows**:
   - Run Neovim in one pane, tests in another, logs in a third
   - Organize different projects in separate windows
   - No need to switch between multiple terminal applications

3. **Workflow Efficiency**:
   - Keep your editor, application, and tests visible simultaneously
   - Quick navigation between development contexts
   - Copy/paste between panes seamlessly

#### Example Workflow

```bash
# Create a new project session
tmux new -s myproject

# Split horizontally: Neovim on top, terminal on bottom
Ctrl+b "

# In top pane: open Neovim
nvim

# In bottom pane: run your application or tests
go run main.go
```

**Note**: While TMUX is highly recommended, this Neovim configuration works perfectly fine without it.

---

## Quick Start

### Prerequisites

- **Operating System**: macOS, Linux, or Windows with WSL2
- **Terminal**: Any modern terminal emulator (iTerm2, Alacritty, Windows Terminal, etc.)
- **Git**: For cloning the repository

### Installation - macOS

```bash
# 1. Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install Neovim and TMUX
brew install neovim tmux

# 3. Backup your existing Neovim configuration (if any)
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# 4. Clone this configuration
git clone https://github.com/lucchesisp/neovim ~/.config/nvim --depth 1

# 5. Start Neovim
nvim
```

On first launch, NvChad will automatically install all plugins. Wait for the installation to complete.

### Installation - Linux

```bash
# 1. Install Neovim (Ubuntu/Debian)
sudo apt update
sudo apt install neovim tmux

# Or on Fedora
sudo dnf install neovim tmux

# 2. Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# 3. Clone this configuration
git clone https://github.com/lucchesisp/neovim ~/.config/nvim --depth 1

# 4. Start Neovim
nvim
```

### Installation - Windows (WSL2)

```powershell
# 1. Install WSL2 (PowerShell as Administrator)
wsl --install

# 2. Restart your computer

# 3. Open WSL and follow the Linux installation steps above
```

### Post-Installation Setup

After Neovim opens, install LSP servers and debug adapters:

```vim
:MasonInstallAll
```

This command will automatically install:
- Language servers (gopls, pyright, ts_ls, etc.)
- Debug adapters (delve, debugpy)
- Formatters (prettier, black, gofmt)

**Tip**: Press `:Mason` anytime to open the Mason UI and manage your tools.

---

## Understanding KeyMaps

One of Neovim's greatest strengths is its customizable keybinding system. This configuration uses a centralized keymap management approach that makes it easy to understand and modify shortcuts.

### The KeyMaps Files

This configuration uses two main files for keybindings:

1. **`lua/mappings.lua`**: Core mappings including DAP, LSP, and essential shortcuts
2. **`lua/keymaps.lua`**: Additional custom mappings

### How KeyMaps Work

In Neovim, keybindings are defined using `vim.keymap.set()`. Here's the anatomy of a keymap:

```lua
vim.keymap.set(mode, key, action, options)
```

- **mode**: Which mode the key works in (`n` = normal, `i` = insert, `v` = visual)
- **key**: The key combination to press
- **action**: What happens when you press it (can be a command or function)
- **options**: Optional settings like description, silent mode, etc.

### Example from `lua/keymaps.lua`

```lua
-- ========== CUSTOM KEYMAPS ==========

-- Markdown render toggle
vim.keymap.set("n", "<leader>m", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle Markdown render" })
```

**Breaking it down**:
- `"n"`: Works in Normal mode
- `"<leader>m"`: Press Space (leader key) + m
- `"<cmd>RenderMarkdown toggle<CR>"`: Executes the RenderMarkdown toggle command
- `{ desc = "Toggle Markdown render" }`: Description shown in which-key menu

### Special Keys Reference

| Key Symbol | Meaning |
|------------|---------|
| `<leader>` | Space key (default in NvChad) |
| `<CR>` | Enter/Return |
| `<C-x>` | Ctrl + x |
| `<M-x>` or `<A-x>` | Alt + x (Option on Mac) |
| `<S-x>` | Shift + x |
| `<F5>` | Function key F5 |

### Example from `lua/mappings.lua`

Here's a snippet showing DAP (debugger) keymaps:

```lua
local map = vim.keymap.set
local dap = require "dap"
local dapui = require "dapui"

-- Simple command mode access
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Quick escape from insert mode
map("i", "jk", "<ESC>")

-- Debug with F-keys (IDE-style)
map("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
map("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
map("n", "<F10>", dap.step_over, { desc = "Debug: Step Over (Next)" })
map("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
map("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })

-- Semantic debug mappings with <leader>d prefix
map("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
map("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })

-- LSP code actions
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
map("n", "gq", vim.lsp.buf.code_action, { desc = "LSP: Quick Fix" })
```

### Discovering KeyMaps

You don't need to memorize all shortcuts! Press `<leader>` (Space) and wait a moment - a **which-key** menu will appear showing all available mappings.

Or use:
- `<leader>ch` - NvChad cheatsheet
- `<leader>wK` - Full which-key menu

### Customizing KeyMaps

To add your own shortcuts, edit `lua/keymaps.lua`:

```lua
-- Example: Quick save with Ctrl+s
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Example: Custom terminal command
vim.keymap.set("n", "<leader>gt", "<cmd>!go test ./...<CR>", { desc = "Run Go tests" })
```

---

## Debugging with DAP

The Debug Adapter Protocol (DAP) support in this configuration provides professional-grade debugging capabilities directly in your editor.

### What You Can Do

- Set breakpoints with a single keypress
- Step through code execution line by line
- Inspect variable values in real-time
- Evaluate expressions on the fly
- Navigate call stacks
- Set conditional breakpoints and log points

### Visual Indicators

When debugging, you'll see:

| Symbol | Meaning |
|--------|---------|
| `●` (red) | Standard breakpoint |
| `◆` (red) | Conditional breakpoint |
| `◉` (blue) | Log point (logs without stopping) |
| `→` (green) | Current execution line |
| Green background | Current line highlight |
| Blue inline text | Variable values |
| Orange inline text | Variables that changed |

### DAP KeyMaps

This configuration provides two keymap styles for debugging:

#### F-Key Shortcuts (Traditional IDE Style)

| Key | Action | Description |
|-----|--------|-------------|
| `F5` | Continue/Start | Start debugging or continue execution |
| `F9` | Toggle Breakpoint | Add/remove breakpoint on current line |
| `F10` | Step Over | Execute current line, don't enter functions |
| `F11` | Step Into | Enter into function calls |
| `F12` | Step Out | Exit current function |

**Note**: On macOS laptops without dedicated F-keys, you may need to press `fn + F5`, etc., or configure your keyboard to use F-keys directly.

#### Leader + d Shortcuts (Semantic Style)

All debug commands are organized under the `<leader>d` prefix (Space + d):

##### Execution Control

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>dc` | Continue | Continue program execution |
| `<leader>dn` | Next | Step over (next line) |
| `<leader>di` | Into | Step into function |
| `<leader>do` | Out | Step out of function |
| `<leader>dt` | Terminate | Stop debugging session |
| `<leader>dp` | Pause | Pause execution |
| `<leader>dR` | Restart | Restart debug session |

##### Breakpoints

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>db` | Toggle | Add/remove breakpoint |
| `<leader>dB` | Conditional | Set breakpoint with condition |
| `<leader>dL` | Log Point | Set log point (logs without stopping) |
| `<leader>dC` | Clear All | Remove all breakpoints |

##### UI and Information

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>du` | Toggle UI | Show/hide debug UI panels |
| `<leader>de` | Evaluate | Evaluate expression under cursor |
| `<leader>dh` | Hover | Show variable value (hover) |
| `<leader>dr` | REPL | Open debug console |
| `<leader>dl` | Run Last | Repeat last debug session |

##### Stack Navigation

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>dj` | Down Frame | Move down in call stack |
| `<leader>dk` | Up Frame | Move up in call stack |

### Debugging Workflow Example

Here's a typical debugging session:

```bash
# 1. Open your code file
nvim main.go

# 2. Set a breakpoint on line 10
# Move cursor to line 10, press F9 or <leader>db

# 3. Start debugging
# Press F5 or <leader>dc

# 4. When execution stops at breakpoint:
# - Press F10 to step over
# - Press F11 to step into a function
# - Press <leader>de to evaluate a variable
# - Press <leader>dh to see variable value

# 5. Continue or terminate
# - Press F5 to continue
# - Press <leader>dt to stop debugging
```

### Virtual Text (Inline Variable Values)

This configuration includes **nvim-dap-virtual-text**, which displays variable values directly in your code as you debug:

```go
func calculate(x int) int {
    y := x * 2        // y = 20 (appears in blue)
    y = y + 10        // y = 30 (appears in orange - changed!)
    return y          // return 30
}
```

**Commands**:
- `:DapVirtualTextEnable` - Enable inline values
- `:DapVirtualTextDisable` - Disable inline values
- `:DapVirtualTextToggle` - Toggle on/off

### Language-Specific Debug Configurations

#### Go (Delve)

```lua
-- Automatically configured for:
- Debug current file
- Debug package
- Debug tests
- Attach to running process
```

#### Python (debugpy)

```lua
-- Automatically configured for:
- Launch current file
- Launch with command-line arguments
```

#### Java (JDTLS)

```lua
-- Automatically configured for:
- Debug current file with JDWP
```

### Troubleshooting Debug Issues

If debugging doesn't work:

1. **Check debug adapter installation**:
   ```vim
   :Mason
   ```
   Ensure `delve`, `debugpy`, etc., are installed

2. **Verify DAP configuration**:
   ```vim
   :lua print(vim.inspect(require('dap').configurations))
   ```

3. **Check for errors**:
   ```vim
   :messages
   ```

---

## Essential KeyMaps

Here's a curated list of the most important shortcuts you'll use daily.

### Navigation & Search (Most Used)

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl+p` | Find File | Fuzzy search for files in project |
| `<leader>fw` | Find Word | Live grep (search text in all files) |
| `gd` | Go to Definition | Jump to where symbol is defined |
| `gr` | Go to References | Show all usages of symbol |
| `Ctrl+o` | Jump Back | Return to previous location |
| `Ctrl+i` | Jump Forward | Go to next location |
| `*` | Search Forward | Search word under cursor (forward) |
| `#` | Search Backward | Search word under cursor (backward) |

### Editing & Refactoring

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>rn` | Rename | Rename variable/function across project |
| `<leader>fm` | Format | Format current file |
| `K` | Hover Docs | Show documentation for symbol |
| `gcc` | Comment Line | Toggle comment on current line |
| `gc` | Comment Block | Comment selected block (visual mode) |
| `<leader>ca` | Code Action | Open LSP code actions menu |
| `gq` or `<leader>.` | Quick Fix | Apply first LSP suggestion |

### LSP Features

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>ca` | Code Action | Show all available code actions |
| `<leader>cf` | Fast Fix | Apply first suggestion automatically |
| `<leader>ci` | Inlay Hints | Toggle inline type hints |
| `<leader>lo` | Organize Imports | Sort and remove unused imports |
| `<leader>lu` | Remove Unused | Remove unused imports only |

**Example**: When you see a purple tooltip suggesting "for loop can be modernized", press `gq` to apply it instantly!

### File Management

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>e` or `Ctrl+n` | File Tree | Open/close file explorer |
| `:w` or `Ctrl+s` | Save | Save current file |
| `:wq` | Save & Quit | Save and close file |
| `:q!` | Quit | Close without saving |

**In File Explorer (NvimTree)**:
| Key | Action |
|-----|--------|
| `a` | New file |
| `A` | New folder |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |

### Buffers & Windows

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Tab` | Next Buffer | Switch to next buffer |
| `Shift+Tab` | Previous Buffer | Switch to previous buffer |
| `<leader>x` | Close Buffer | Close current buffer |
| `<leader>sv` | Split Horizontal | Split window horizontally |
| `<leader>sh` | Split Vertical | Split window vertically |
| `Ctrl+h/j/k/l` | Navigate | Move between windows |

### Git Integration

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>gt` | Git Status | View git status (Telescope) |
| `<leader>cm` | Commits | View commit history |
| `<leader>gg` | Lazygit | Open lazygit TUI |

### Terminal

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Alt+i` | Float Terminal | Toggle floating terminal |
| `Alt+h` | Horizontal Terminal | Open horizontal terminal |
| `Alt+v` | Vertical Terminal | Open vertical terminal |

### Quick Commands

| Shortcut | Action | Description |
|----------|--------|-------------|
| `;` | Command Mode | Enter command mode (same as `:`) |
| `jk` | Escape | Exit insert mode (alternative to ESC) |
| `<leader>m` | Markdown Toggle | Render/unrender markdown preview |

### Discovering More Shortcuts

- Press `<leader>` (Space) and wait → which-key popup appears
- Press `<leader>ch` → Open NvChad cheatsheet
- Press `<leader>wK` → Open full which-key menu

---

## TMUX Integration

While not required, TMUX significantly enhances your development workflow with this configuration.

### Why Use TMUX with Neovim?

#### 1. Persistent Sessions
Your development environment survives terminal closures, SSH disconnections, and system sleeps.

```bash
# Start a session
tmux new -s project

# Detach (keeps running in background)
Ctrl+b d

# Later, reattach
tmux attach -t project
```

#### 2. Multiple Panes
Run Neovim, tests, and logs simultaneously without switching windows.

```bash
# Recommended layout
┌─────────────────────────────┐
│                             │
│      Neovim Editor          │
│                             │
├─────────────┬───────────────┤
│  Terminal   │  App Running  │
│  (tests)    │  (logs)       │
└─────────────┴───────────────┘
```

#### 3. Project Organization
Keep different projects in separate sessions.

```bash
tmux new -s frontend    # Web app development
tmux new -s backend     # API development
tmux new -s infra       # Infrastructure work
```

### Essential TMUX Commands

#### Session Management

| Action | Command |
|--------|---------|
| New session | `tmux new -s name` |
| List sessions | `tmux ls` |
| Attach session | `tmux attach -t name` |
| Detach | `Ctrl+b d` |
| Kill session | `tmux kill-session -t name` |

#### Window Management

| Action | Command |
|--------|---------|
| New window | `Ctrl+b c` |
| Next window | `Ctrl+b n` |
| Previous window | `Ctrl+b p` |
| List windows | `Ctrl+b w` |
| Rename window | `Ctrl+b ,` |

#### Pane Management

| Action | Command |
|--------|---------|
| Split horizontal | `Ctrl+b %` |
| Split vertical | `Ctrl+b "` |
| Navigate panes | `Ctrl+b` + arrow keys |
| Close pane | `Ctrl+b x` |
| Toggle zoom | `Ctrl+b z` |
| Resize pane | `Ctrl+b` + hold arrow keys |

### Recommended Workflow

```bash
# 1. Create a project session
tmux new -s myapp

# 2. Open Neovim in first pane
nvim

# 3. Split horizontally (Ctrl+b ")
# Bottom pane: run your application
go run main.go

# 4. Split bottom pane vertically (Ctrl+b %)
# Right bottom pane: run tests
go test -v ./...

# Now you have:
# - Editor on top (full width)
# - App running bottom-left
# - Tests bottom-right
```

### TMUX Configuration Tips

Create `~/.tmux.conf` for better defaults:

```bash
# Enable mouse support
set -g mouse on

# Start windows at 1 instead of 0
set -g base-index 1

# Easier prefix (optional: change Ctrl+b to Ctrl+a)
# set-option -g prefix C-a

# Better split commands
bind | split-window -h
bind - split-window -v
```

---

## Installed LSPs and Debug Adapters

This configuration comes pre-configured for multiple languages. Use `:Mason` to manage installations.

### Language Servers (LSP)

| Language | Server | Features |
|----------|--------|----------|
| Go | `gopls` | Completion, diagnostics, formatting, imports |
| Python | `pyright` | Type checking, completion, refactoring |
| TypeScript/JavaScript | `ts_ls`, `eslint` | Full TS/JS support, linting |
| Java | `jdtls` | Enterprise Java development |
| HTML/CSS | `html`, `cssls` | Web development support |
| Lua | `lua_ls` | Neovim config editing |

### Debug Adapters (DAP)

| Language | Adapter | Installation |
|----------|---------|--------------|
| Go | `delve` | `:Mason` → delve |
| Python | `debugpy` | `:Mason` → debugpy |
| Java | `jdtls` | Built-in with jdtls |

### Formatters

| Language | Formatter | Installation |
|----------|-----------|--------------|
| Go | `gofmt`, `goimports` | Built-in with Go |
| Python | `black` | `:Mason` → black |
| TypeScript/JavaScript | `prettier` | `:Mason` → prettier |
| Lua | `stylua` | `:Mason` → stylua |

### Installing Additional Tools

```vim
# Open Mason
:Mason

# Navigate with j/k, press 'i' to install, 'X' to uninstall
# Search with '/'
```

### Auto-Install on File Open

When you open a file of a supported language, NvChad will prompt you to install the LSP server if it's not already installed.

---

## Additional Resources

### Configuration Files Structure

```
~/.config/nvim/
├── lua/
│   ├── configs/
│   │   ├── lspconfig.lua      # LSP server configurations
│   │   ├── dap.lua             # Debug adapter configurations
│   │   └── conform.lua         # Formatter configurations
│   ├── plugins/
│   │   ├── init.lua            # Plugin declarations
│   │   └── markdown.lua        # Markdown plugin config
│   ├── mappings.lua            # Core keymaps (DAP, LSP)
│   ├── keymaps.lua             # Custom keymaps
│   ├── options.lua             # Vim options
│   └── chadrc.lua              # NvChad configuration
├── init.lua                    # Entry point
└── README.md                   # This file
```

### Learning Resources

#### Neovim Basics
- [Neovim Documentation](https://neovim.io/doc/)
- [Vim Tutor](https://github.com/vim/vim/blob/master/runtime/tutor/tutor) - Run `:Tutor` in Neovim
- [Vim Adventures](https://vim-adventures.com/) - Learn Vim through a game

#### NvChad Specific
- [NvChad Documentation](https://nvchad.com/)
- [NvChad GitHub](https://github.com/NvChad/NvChad)

#### Plugins Used
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configurations
- [Mason](https://github.com/williamboman/mason.nvim) - LSP/DAP installer

#### TMUX
- [TMUX GitHub](https://github.com/tmux/tmux/wiki)
- [TMUX Cheatsheet](https://tmuxcheatsheet.com/)

### Getting Help

- Press `<leader>ch` in Neovim for the NvChad cheatsheet
- Press `K` over any function/variable for documentation
- Run `:checkhealth` to diagnose issues
- Run `:Mason` to check tool installations
- Run `:Lazy` to manage plugins

### Useful Commands

| Command | Description |
|---------|-------------|
| `:checkhealth` | Diagnose Neovim setup issues |
| `:Mason` | Open LSP/DAP installer |
| `:Lazy` | Open plugin manager |
| `:Lazy sync` | Update all plugins |
| `:NvChadUpdate` | Update NvChad base |
| `:messages` | View message history |
| `:Telescope keymaps` | Search all keybindings |

---

## macOS Specific Notes

- **F-Keys**: On MacBooks, press `fn + F5` for F-keys, or configure keyboard to use F-keys directly in System Preferences
- **Leader Key**: Space (NvChad default)
- **Option Key**: Works as `Alt` (`<M-...>` in Neovim)
- **Control Key**: Works normally as `Ctrl`

---

## Contributing

This configuration is maintained for personal use but contributions and suggestions are welcome!

Repository: [github.com/lucchesisp/neovim](https://github.com/lucchesisp/neovim)

---

## License

This configuration is based on [NvChad](https://github.com/NvChad/NvChad) and follows its license. Custom configurations are provided as-is for educational and development purposes.

---

**Happy Coding!** 🚀

If you're new to Neovim, don't feel overwhelmed. Start with basic navigation (`hjkl`), file opening (`Ctrl+p`), and saving (`:w`). The muscle memory will develop naturally over time, and you'll soon wonder how you ever lived without modal editing.
