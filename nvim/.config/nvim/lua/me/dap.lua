local dap = require("dap")
local js_based_languages = { "typescript", "javascript", "typescriptreact" }

vim.keymap.set('n', '<F5>', dap.continue )
vim.keymap.set('n', '<F10>', dap.step_over )
vim.keymap.set('n', '<F11>', dap.step_into )
vim.keymap.set('n', '<F12>', dap.step_out )
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint )
vim.keymap.set('n', '<Leader>B', dap.set_breakpoint )

require("dap-vscode-js").setup({
  --[[ node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node" ]]
  --[[ debugger_path = "~/.local/share/nvim/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation. ]]
  -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome with \"localhost\"",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    }
  }
end



