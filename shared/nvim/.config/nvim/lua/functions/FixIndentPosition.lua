return function()
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
end
