local banned_messages = {
  "No information available"
}

---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, ...)
  for _, banned in ipairs(banned_messages) do
    if msg == banned then
      return
    end
  end
  require("notify")(msg, ...)
end
