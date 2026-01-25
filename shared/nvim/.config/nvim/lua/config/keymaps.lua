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

vim.keymap.del("n", "<leader>-")
-- vim.keymap.del("n", "<leader>|")

-- vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "Split Window Below" })
-- keymap.set("n", "<leader>-", "<cmd>split<cr><C-w>k", { desc = "Split Below, Stay Here" })
vim.keymap.set("n", "<leader>-", function()
  local cursor_row = vim.fn.winline()  -- Cursor's screen row position
  local cursor_line = vim.fn.line(".") -- Cursor's buffer line number
  local cursor_col = vim.fn.col(".")   -- Cursor's column position

  vim.cmd("split")
  vim.cmd("wincmd k")              -- Move to top window
  vim.cmd("resize " .. cursor_row) -- Resize to cursor position

  -- Restore cursor position in top window
  vim.fn.cursor(cursor_line, cursor_col)

  vim.cmd("wincmd j") -- Move back to bottom window

  -- Restore cursor position in bottom window
  vim.fn.cursor(cursor_line, cursor_col)
end, { desc = "Split at Cursor Position" })

-- keymap.set("n", "<leader>|", "<cmd>vsplit<cr><C-w>h", { desc = "Split Right, Stay Here" })

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
