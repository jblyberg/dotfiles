-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap -- for conciseness
local nvim_tmux_nav = require('nvim-tmux-navigation')

-- Remove unwanted keymaps
keymap.del("n", "<leader>K")
keymap.del("n", "<leader>,")
keymap.del("n", "<leader>.")
keymap.del("n", "<leader>`")
keymap.del("n", "<leader>e")
keymap.del("n", "<leader>E")
keymap.del("n", "<leader>L")
keymap.del("n", "<leader>S")
keymap.del("n", "H")
keymap.del("n", "L")
keymap.del("n", "Y")

-- Convenience mappings
keymap.set("n", "<C-S-x>", ":MarkdownToggleCheckbox<CR>")

-- :W quickly saves (and fixes annoying mis-saves)
vim.cmd("command W w")

-- Disable recording macros
keymap.set("n", "q", "<Nop>", { noremap = true })
keymap.set("v", "q", "<Nop>", { noremap = true })

-- Replace all like selection
keymap.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>', { noremap = true })

-- Moving text
keymap.set("n", "<M-Down>", ":m .+1<CR>==", { noremap = true })
keymap.set("n", "<M-Up>", ":m .-2<CR>==", { noremap = true })
keymap.set("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true })
keymap.set("i", "<M-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true })
keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { noremap = true })
keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Copy line
keymap.set("n", "<S-D-Down>", ":co.<CR>==", { noremap = true })
keymap.set("i", "<S-D-Down>", "<Esc>:co.<CR>==gi<Down>", { noremap = true })

-- Tmux integration
keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- Buffers shortcut
keymap.set('n', '<C-b>', ':FzfLua buffers<cr>', { desc = 'List buffers' })

-- Run scripts
keymap.set("n", "<leader>vc", ":!sh scripts/copy-config-to-repo.sh<CR><CR>",
  { noremap = true, desc = "Copy Neovim config to Ansible repo" })

-- Automatically set indent correctly when entering insert mode
keymap.set("n", "i", function()
  local line = vim.fn.getline(".")
  local col = vim.fn.col(".")
  local is_empty = #line == 0
  local is_leading_whitespace = col <= #line:match("^%s*")

  if is_empty then
    return '"_cc'
  elseif is_leading_whitespace then -- Comment this out to disable going to end of line
    return "A"
  else
    return "i"
  end
end, { desc = "Automatically indent to the appropriate position", silent = true, expr = true })
