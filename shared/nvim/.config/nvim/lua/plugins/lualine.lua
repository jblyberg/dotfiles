return {
  "nvim-lualine/lualine.nvim",
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  opts = function(_, opts)
    opts.sections.lualine_a = { "mode" }
    opts.sections.lualine_b = { "branch", "diff", "diagnostics" }
    opts.sections.lualine_c = { "location" }

    opts.sections.lualine_x = { "filename" }
    opts.sections.lualine_y = {
      {
        'filetype',
        fmt = function(str)
          if str == 'snacks_picker_list' then
            return 'File Explorer'
          end

          return str
        end,
      },
    }
    opts.sections.lualine_z = {
      function()
        local msg = "󱤳 LSP inactive"
        local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
        local clients = vim.lsp.get_clients()
        local client_list = "󱤵 "
        local show_lsp_status = false

        if next(clients) == nil then
          return msg
        end

        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes

          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            show_lsp_status = true
            client_list = client_list .. client.name .. ", "
          end
        end

        if show_lsp_status then
          msg = client_list:sub(1, -3) or "󱤵 LSP"
        end

        return msg
      end,
    }
  end,
}
