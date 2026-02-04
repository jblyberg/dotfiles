-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap -- for conciseness
local nvim_tmux_nav = require('nvim-tmux-navigation')
local SplitWindowAtCursor = require('functions.SplitWindowAtCursor')
local FixIndentPosition = require('functions.FixIndentPosition')

-- Remove unwanted keymaps
keymap.del("n", "<leader>,")
keymap.del("n", "<leader>-")
keymap.del("n", "<leader>.")
keymap.del("n", "<leader>E")
keymap.del("n", "<leader>K")
keymap.del("n", "<leader>L")
keymap.del("n", "<leader>S")
keymap.del("n", "<leader>`")
keymap.del("n", "<leader>e")
keymap.del("n", "H")
keymap.del("n", "L")
keymap.del("n", "Y")

-- Window split at cursor
keymap.set("n", "<leader>-", SplitWindowAtCursor, { desc = "Split at Cursor Position" })

-- Convenience mappings
keymap.set("n", "<C-S-x>", ":MarkdownToggleCheckbox<CR>")

-- :Q and :W quickly quits or saves (and fixes annoying mis-quits/saves)
vim.cmd("command Q q")
vim.cmd("command W w")

-- Disable recording macros
keymap.set("n", "q", "<Nop>", { noremap = true })
keymap.set("v", "q", "<Nop>", { noremap = true })

-- Replace all like selection
keymap.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>', { noremap = true })

-- Moving text
-- keymap.set("n", "<M-Down>", ":m .+1<CR>==", { noremap = true })
-- keymap.set("n", "<M-Up>", ":m .-2<CR>==", { noremap = true })
-- keymap.set("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true })
-- keymap.set("i", "<M-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true })
-- keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { noremap = true })
-- keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { noremap = true })

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
keymap.set("n", "i", FixIndentPosition,
  { desc = "Automatically indent to the appropriate position", silent = true, expr = true })
