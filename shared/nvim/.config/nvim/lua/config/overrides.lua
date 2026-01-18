local original_notify = vim.notify

local banned_patterns = {
  "No information available",
  -- "^LSP%[.*%]", -- Filter LSP messages
}

vim.notify = function(msg, ...)
  for _, pattern in ipairs(banned_patterns) do
    if string.find(msg, pattern) then
      return
    end
  end
  original_notify(msg, ...)
end
