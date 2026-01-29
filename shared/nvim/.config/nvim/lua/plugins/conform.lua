return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    require("conform").format({ async = true, lsp_fallback = true })

    opts.formatters_by_ft = {
      bash = { "beautysh" },
      cs = { "roslyn" },
      csproj = { "roslyn" },
      html = { "htmlbeautifier" },
      javascript = { "prettier" },
      razor = { "roslyn" },
      typescript = { "prettier" },
      vue = { "prettier" },
      yaml = { "yamlfix" },
    }

    opts.formatters = {
      roslyn = {
        command = "dotnet",
        args = { "format", "--include", "$FILENAME" },
        stdin = false,
      },
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
