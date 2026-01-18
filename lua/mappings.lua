require "nvchad.mappings"

local map = vim.keymap.set
local dap = require "dap"
local dapui = require "dapui"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Debug keymaps
map("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
map("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
map("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
map("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
map("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
map("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Debug: Set Conditional Breakpoint" })
map("n", "<leader>lp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Debug: Set Log Point" })
map("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
map("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })
map("n", "<leader>du", require("dapui").toggle, { desc = "Debug: Toggle UI" })
map("n", "<leader>de", dapui.eval, { desc = "Debug: Evaluate Expression" })

-- Import management
map("n", "<leader>oi", function()
  vim.lsp.buf.code_action {
    context = { only = { "source.organizeImports" } },
    apply = true,
  }
end, { desc = "LSP: Organize Imports" })

map("n", "<leader>ri", function()
  vim.lsp.buf.code_action {
    context = { only = { "source.removeUnusedImports" } },
    apply = true,
  }
end, { desc = "LSP: Remove Unused Imports" })
