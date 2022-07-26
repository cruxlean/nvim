--
--local dap = require("dap")
-- 设置断点样式
--vim.fn.sign_define("DapBreakpoint", {text = "⊚", texthl = "TodoFgFIX", linehl = "", numhl = ""})
-- 加载调试器配置
--local dap_config = {
--    python = require("dap.python"),
--    cpp = require("dap.cpp"),
--}
-- 设置调试器
--for dap_name, dap_options in pairs(dap_config) do
--    dap.adapters[dap_name] = dap_options.adapters
--    dap.configurations[dap_name] = dap_options.configurations
--end

local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = 'C:\\Users\\darryl\\.vscode\\extensions\\ms-vscode.cpptools-1.10.8-win32-x64\\debugAdapters\\bin\\OpenDebugAD7.exe',
  options = {
    detached = false
  }
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = 'gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
require('dap.ext.vscode').load_launchjs(nil,{cppdbg ={'c','cpp'}})
dap.configurations.c = dap.configurations.cpp