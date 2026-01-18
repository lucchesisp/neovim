local dap = require "dap"
local dapui = require "dapui"

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup {
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
}

-- Python
dap.adapters.python = function(cb)
  cb({
    type = "executable",
    command = vim.fn.exepath "debugpy-adapter",
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
    command = "dlv",
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
