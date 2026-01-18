require "nvchad.mappings"

local map = vim.keymap.set
local dap = require "dap"
local dapui = require "dapui"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Debug keymaps
-- Padrão com teclas F (comum em debuggers)
map("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
map("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
map("n", "<F10>", dap.step_over, { desc = "Debug: Step Over (Next)" })
map("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
map("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })

-- Atalhos semânticos com <leader>d (debug)
-- Controle de execução
map("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
map("n", "<leader>dn", dap.step_over, { desc = "Debug: Next (Step Over)" })
map("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
map("n", "<leader>do", dap.step_out, { desc = "Debug: Step Out" })
map("n", "<leader>dt", dap.terminate, { desc = "Debug: Terminate" })
map("n", "<leader>dp", dap.pause, { desc = "Debug: Pause" })
map("n", "<leader>dR", dap.restart, { desc = "Debug: Restart" })

-- Breakpoints
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
map("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Debug: Conditional Breakpoint" })
map("n", "<leader>dL", function()
  dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Debug: Log Point" })
map("n", "<leader>dC", dap.clear_breakpoints, { desc = "Debug: Clear All Breakpoints" })

-- UI e informações
map("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
map("n", "<leader>de", dapui.eval, { desc = "Debug: Evaluate Expression" })
map("n", "<leader>dh", require("dap.ui.widgets").hover, { desc = "Debug: Hover Variables" })
map("n", "<leader>dr", dap.repl.toggle, { desc = "Debug: Toggle REPL" })
map("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })

-- Frames (navegação na pilha de chamadas)
map("n", "<leader>dj", dap.down, { desc = "Debug: Down Stack Frame" })
map("n", "<leader>dk", dap.up, { desc = "Debug: Up Stack Frame" })

-- LSP Code Actions
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
map("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action (Visual)" })
map("n", "<leader>cf", function()
  vim.lsp.buf.code_action {
    apply = true,
  }
end, { desc = "LSP: Apply Code Action (Fast)" })

-- Atalhos rápidos para aplicar sugestão
map("n", "<leader>.", vim.lsp.buf.code_action, { desc = "LSP: Quick Fix" })
map("n", "gq", vim.lsp.buf.code_action, { desc = "LSP: Quick Fix" })

-- Toggle inlay hints (dicas inline)
map("n", "<leader>ci", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "LSP: Toggle Inlay Hints" })

-- Import management
map("n", "<leader>lo", function()
  vim.lsp.buf.code_action {
    context = { only = { "source.organizeImports" } },
    apply = true,
  }
end, { desc = "LSP: Organize Imports" })

map("n", "<leader>lu", function()
  vim.lsp.buf.code_action {
    context = { only = { "source.removeUnusedImports" } },
    apply = true,
  }
end, { desc = "LSP: Unused Imports (Remove)" })
