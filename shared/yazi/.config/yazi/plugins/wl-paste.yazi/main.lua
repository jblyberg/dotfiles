-- ~/.config/yazi/plugins/my-wl-paste.yazi/main.lua

return {
  entry = function(_, job)
    ya.manager_emit("escape", { visual = true })

    local files_to_paste = {}

    -- Function to decode URI-encoded paths (basic implementation)
    local function decode_uri(uri)
      return uri:gsub("%%(%x%x)", function(h)
        return string.char(tonumber(h, 16))
      end)
    end

    local function get_clipboard_files(mime_type)
      local paste_command = Command("wl-paste"):arg("--type"):arg(mime_type)
      local output, err = paste_command:spawn():wait_with_output()

      if err then
        ya.warn("Error with wl-paste type " .. mime_type .. ": " .. tostring(err))
        return nil
      end

      if not output or output.stdout == "" then
        return nil
      end

      local urls = {}
      -- x-special/gnome-copied-files format starts with 'copy' or 'cut' on the first line
      -- text/uri-list just has URIs
      for line in output.stdout:gmatch("([^\r\n]+)") do
        -- Ignore the action line if present
        if line ~= "copy" and line ~= "cut" then
          local path = line:gsub("^file://", "")
          path = decode_uri(path)
          table.insert(urls, path)
        end
      end
      return urls
    end

    -- Try common MIME types in order of preference
    files_to_paste = get_clipboard_files("x-special/gnome-copied-files") -- GTK/GNOME specific
    if not files_to_paste or #files_to_paste == 0 then
      files_to_paste = get_clipboard_files("text/uri-list")            -- Standard URI list
    end
    -- You can add "application/x-kde4-urilist" here if you use KDE

    if not files_to_paste or #files_to_paste == 0 then
      return ya.notify({
        title = "System Clipboard (Paste)",
        content =
        "Clipboard is empty or does not contain a recognized file format (tried text/uri-list, x-special/gnome-copied-files)",
        level = "warn",
        timeout = 5,
      })
    end

    -- Call Yazi's internal paste function
    ya.manager.paste(files_to_paste)

    ya.notify({
      title = "System Clipboard (Paste)",
      content = "Pasting " .. #files_to_paste .. " file(s) into current directory.",
      level = "info",
      timeout = 3,
    })
  end,
}
