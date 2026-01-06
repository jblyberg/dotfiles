-- bootstrap lazy.nvim, LazyVim and your plugins
-- require("config.lsp")
require("config.lazy")

local projectfile = vim.fn.getcwd() .. 'project.godot'
if projectfile then
  vim.fn.serverstart './godothost'
end
