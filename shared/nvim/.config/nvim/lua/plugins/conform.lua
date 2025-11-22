return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    require("conform").format({ async = true, lsp_fallback = true })

    opts.formatters_by_ft = {
      bash = { "beautysh" },
      html = { "htmlbeautifier" },
      javascript = { "prettierd" },
      -- markdown = { "prettier", "markdownlint-cli2", "markdown-toc" },
      -- ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      typescript = { "prettierd" },
      vue = { "prettierd" },
      yaml = { "yamlfix" },
    }

    opts.formatters = {
      -- ["markdown-toc"] = {
      --   condition = function(_, ctx)
      --     for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
      --       if line:find("<!%-%- toc %-%->") then
      --         return true
      --       end
      --     end
      --   end,
      -- },
      --
      -- ["markdownlint-cli2"] = {
      --   condition = function(_, ctx)
      --     local diag = vim.tbl_filter(function(d)
      --       return d.source == "markdownlint"
      --     end, vim.diagnostic.get(ctx.buf))
      --     return #diag > 0
      --   end,
      -- },

      yamlfix = {
        -- Adds environment args to the yamlfix formatter - https://lyz-code.github.io/yamlfix/
        env = {
          YAMLFIX_SEQUENCE_STYLE = "block_style",
          YAMLFIX_WHITELINES = "1",
          YAMLFIX_LINE_LENGTH = "140",
          YAMLFIX_preserve_quotes = true,
          -- YAMLFIX_EXPLICIT_START = "false",
        },
      },
    }
  end,

  -- opts = function()
  --   vim.api.nvim_create_user_command("Format", function(args)
  --     local range = nil
  --     if args.count ~= -1 then
  --       local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
  --       range = {
  --         start = { args.line1, 0 },
  --         ["end"] = { args.line2, end_line:len() },
  --       }
  --     end
  --     require("conform").format({ async = true, lsp_fallback = true, range = range })
  --   end, { range = true })
  --
  --   local opts = {
  --     formatters_by_ft = {
  --       bash = { "beautysh" },
  --       css = { "prettierd" },
  --       html = { "htmlbeautifier" },
  --       javascript = { "prettierd" },
  --       json = { "prettierd" },
  --       lua = { "stylua" },
  --       markdown = { "prettierd", "markdownlint", "markdown-toc" },
  --       svelte = { "prettierd" },
  --       typescript = { "prettierd" },
  --       vue = { "prettierd" },
  --       yaml = { "yamlfix" },
  --     },
  --
  --     formatters = {
  --       yamlfix = {
  --         -- Adds environment args to the yamlfix formatter
  --         env = {
  --           YAMLFIX_SEQUENCE_STYLE = "block_style",
  --           YAMLFIX_EXPLICIT_START = "false",
  --         },
  --       },
  --     },
  --   }
  --   return opts
  -- end,
}
