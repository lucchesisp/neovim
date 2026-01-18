local dap = require "dap"
local dapui = require "dapui"

dapui.setup()

-- Configuração de ícones e cores para o DAP
vim.fn.sign_define("DapBreakpoint", {
  text = "●",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "DapBreakpoint",
})

vim.fn.sign_define("DapBreakpointCondition", {
  text = "◆",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "DapBreakpoint",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "○",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "DapBreakpoint",
})

vim.fn.sign_define("DapLogPoint", {
  text = "◉",
  texthl = "DapLogPoint",
  linehl = "",
  numhl = "DapLogPoint",
})

vim.fn.sign_define("DapStopped", {
  text = "→",
  texthl = "DapStopped",
  linehl = "DapStoppedLine",
  numhl = "DapStopped",
})

-- Configuração de cores
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e06c75" })       -- Vermelho
vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })         -- Azul
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })          -- Verde
vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2d4d2d" })      -- Fundo verde escuro

-- Cores para texto virtual (valores das variáveis)
vim.api.nvim_set_hl(0, "NvimDapVirtualText", { fg = "#61afef", italic = true })           -- Azul claro
vim.api.nvim_set_hl(0, "NvimDapVirtualTextChanged", { fg = "#e5c07b", bold = true })      -- Laranja quando muda
vim.api.nvim_set_hl(0, "NvimDapVirtualTextError", { fg = "#e06c75" })                     -- Vermelho para erros
vim.api.nvim_set_hl(0, "NvimDapVirtualTextInfo", { fg = "#56b6c2" })                      -- Ciano para info

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

require("nvim-dap-virtual-text").setup {
  enabled = true,                        -- Habilita o virtual text
  enabled_commands = true,               -- Habilita comandos :DapVirtualTextEnable, etc
  highlight_changed_variables = true,    -- Destaca variáveis que mudaram
  highlight_new_as_changed = true,       -- Mostra variáveis novas como alteradas
  show_stop_reason = true,               -- Mostra o motivo da parada
  commented = false,                     -- Não mostra como comentário
  only_first_definition = true,          -- Mostra apenas na primeira definição
  all_references = false,                -- Não mostra em todas as referências
  clear_on_continue = false,             -- Não limpa ao continuar

  -- Formato do texto virtual
  display_callback = function(variable, buf, stackframe, node, options)
    if options.virt_text_pos == 'inline' then
      return ' = ' .. variable.value
    else
      return variable.name .. ' = ' .. variable.value
    end
  end,

  -- Posição: inline (na mesma linha) ou eol (fim da linha)
  virt_text_pos = vim.fn.has "nvim-0.10" == 1 and "inline" or "eol",

  all_frames = false,                    -- Mostra apenas o frame atual
  virt_lines = false,                    -- Não usa linhas virtuais
  virt_text_win_col = nil,              -- Posição automática
}

-- Python
dap.adapters.python = function(cb)
  cb({
    type = "executable",
    command = vim.fn.exepath "debugpy-adapter" or vim.fn.expand "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python -m debugpy.adapter",
    args = {},
  })
end

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return vim.fn.exepath "python" or "python"
    end,
  },
  {
    type = "python",
    request = "launch",
    name = "Launch with args",
    program = "${file}",
    args = function()
      local args_string = vim.fn.input "Arguments: "
      return vim.split(args_string, " +")
    end,
    pythonPath = function()
      return vim.fn.exepath "python" or "python"
    end,
  },
}

-- Go
dap.adapters.delve = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.exepath "dlv" or vim.fn.expand "~/.local/share/nvim/mason/packages/delve/dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug (package)",
    request = "launch",
    program = "./${relativeFileDirname}",
  },
  {
    type = "delve",
    name = "Debug (file)",
    request = "launch",
    program = "${file}",
    mode = "debug",
  },
  {
    type = "delve",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
  {
    type = "delve",
    name = "Attach process",
    request = "attach",
    processId = require("dap.utils").pick_process,
    mode = "local",
  },
}

-- Java
dap.configurations.java = {
  {
    type = "java",
    request = "launch",
    name = "Debug (Launch) - Current File",
    program = "${file}",
    vmArgs = "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005",
  },
}
