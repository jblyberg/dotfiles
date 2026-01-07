return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    require("conform").format({ async = true, lsp_fallback = true })

    opts.formatters_by_ft = {
      bash = { "beautysh" },
      cs = { "roslyn" },
      csproj = { "roslyn" },
      html = { "htmlbeautifier" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      vue = { "prettierd" },
      yaml = { "yamlfix" },
    }

    opts.formatters = {
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

}
