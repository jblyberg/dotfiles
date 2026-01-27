-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
require("config.overrides")

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Disable relative line numbers in Insert Mode
autocmd({ "VimEnter", "InsertLeave" }, {
  desc = "set relativenumber",
  group = augroup("set_relativenumber", { clear = true }),
  pattern = "*.*",
  command = "set relativenumber",
})

autocmd({ "InsertEnter" }, {
  desc = "set number",
  group = augroup("set_number", { clear = true }),
  pattern = "*",
  command = "set number norelativenumber",
})

-- Unlink any active luasnip snippets mode when switching back to Normal Mode
-- See: https://github.com/L3MON4D3/LuaSnip/issues/258
autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    if
        ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
        and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})

-- Disable spell checking by default. <leader>+u+s to enable
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.spell = false
  end,
})
