-- paste.yazi
-- A Yazi plugin to paste files from macOS clipboard

local function entry(self, args)
  local cwd = tostring(ya.target_family() == "windows" and os.getenv("CD") or os.getenv("PWD"))

  -- Try to get current working directory from yazi
  if self and self.cwd then
    cwd = tostring(self.cwd)
  end

  -- First try to get file URLs from Finder clipboard
  local output = Command("osascript")
      :args({
        "-e",
        'set theList to {}\nrepeat with i in (get the clipboard as «class furl»)\nset end of theList to POSIX path of i\nend repeat\nset AppleScript\'s text item delimiters to linefeed\ntheList as text'
      })
      :stdout(Command.PIPED)
      :stderr(Command.PIPED)
      :output()

  local clipboard = ""

  if output and output.status.success and output.stdout ~= "" then
    clipboard = output.stdout
  else
    -- Fallback to pbpaste for plain text file paths
    output = Command("clippy")
        :arg(Command.PIPED)
        :output()

    if output and output.status.success then
      clipboard = output.stdout
    end
  end

  if not clipboard or clipboard == "" then
    ya.notify({
      title = "Paste",
      content = "Clipboard is empty",
      timeout = 3,
      level = "warn",
    })
    return
  end

  -- Parse file paths
  local files = {}
  for line in clipboard:gmatch("[^\r\n]+") do
    local path = line:gsub("^%s+", ""):gsub("%s+$", "")

    -- URL decode
    path = path:gsub("%%(%x%x)", function(hex)
      return string.char(tonumber(hex, 16))
    end)

    -- Remove file:// prefix
    path = path:gsub("^file://", "")

    -- Check if it looks like a valid file path
    if path ~= "" and (path:sub(1, 1) == "/" or path:sub(1, 1) == "~") then
      -- Expand ~ to home directory
      if path:sub(1, 1) == "~" then
        local home = os.getenv("HOME")
        path = home .. path:sub(2)
      end
      table.insert(files, path)
    end
  end

  if #files == 0 then
    -- Debug: show what was in clipboard
    ya.notify({
      title = "Paste",
      content = "No valid file paths found. Clipboard contains: " .. clipboard:sub(1, 100),
      timeout = 5,
      level = "warn",
    })
    return
  end

  -- Copy files to current directory
  local success_count = 0
  local fail_count = 0

  for _, src in ipairs(files) do
    local filename = src:match("([^/]+)$")
    local dest = cwd .. "/" .. filename

    -- Check if source exists first
    local check = Command("test")
        :args({ "-e", src })
        :status()

    if check and check.success then
      -- Copy file or directory
      local result = Command("cp")
          :args({ "-R", src, dest })
          :status()

      if result and result.success then
        success_count = success_count + 1
      else
        fail_count = fail_count + 1
      end
    else
      fail_count = fail_count + 1
    end
  end

  -- Show notification
  if success_count > 0 then
    ya.notify({
      title = "Paste",
      content = string.format("Pasted %d file%s", success_count, success_count > 1 and "s" or ""),
      timeout = 3,
      level = "info",
    })
  end

  if fail_count > 0 then
    ya.notify({
      title = "Paste",
      content = string.format("Failed to paste %d file%s", fail_count, fail_count > 1 and "s" or ""),
      timeout = 3,
      level = "error",
    })
  end
end

return { entry = entry }
