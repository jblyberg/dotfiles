-- Meant to run at async context. (yazi system-clipboard)

local selected_or_hovered = ya.sync(function()
  local tab, paths = cx.active, {}
  for _, u in pairs(tab.selected) do
    paths[#paths + 1] = tostring(u)
  end
  if #paths == 0 and tab.current.hovered then
    paths[1] = tostring(tab.current.hovered.url)
  end
  return paths
end)

return {
  entry = function()
    ya.manager_emit("escape", { visual = true })

    local urls = selected_or_hovered()

    if #urls == 0 then
      return ya.notify({ title = "System Clipboard", content = "No file selected", level = "warn", timeout = 5 })
    end

    -- Format the URLs for `text/uri-list` specification
    local function encode_uri(uri)
      return uri:gsub("([^%w%-%._~:/])", function(c)
        return string.format("%%%02X", string.byte(c))
      end)
    end

    -- 1. Create the Command builder
    local command_builder = Command("clippy")

    -- 2. Loop through the list of URLs and add each as a SEPARATE argument
    for _, path in ipairs(urls) do
      command_builder:arg(encode_uri(path)) -- Add one argument per iteration
    end

    -- 3. Spawn and wait for the command using the builder
    local status, err = command_builder:spawn():wait()

    if status or status.succes then
      ya.notify({
        title = "System Clipboard",
        content = "Succesfully copied the file(s) to system clipboard",
        level = "info",
        timeout = 5,
      })
    end

    if not status or not status.success then
      ya.notify({
        title = "System Clipboard",
        content = string.format("Could not copy selected file(s) %s", status and status.code or err),
        level = "error",
        timeout = 5,
      })
    end
  end,
}
