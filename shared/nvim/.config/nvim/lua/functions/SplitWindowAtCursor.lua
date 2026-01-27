return function()
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
end
