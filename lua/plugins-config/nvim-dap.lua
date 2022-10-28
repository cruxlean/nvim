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
dap.adapters.lldb = {
  name = 'lldb',
  type = 'executable',
  command = "/usr/bin/lldb-vscode"
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  }
require('dap.ext.vscode').load_launchjs(nil,{cppdbg ={'c','cpp'}})
dap.configurations.c = dap.configurations.cpp
