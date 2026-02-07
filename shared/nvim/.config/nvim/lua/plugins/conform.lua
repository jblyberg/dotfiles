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
      toml = { "taplo" },
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

      taplo = {
        prepend_args = {
          "format",
          "--option", "indent_string=  ",
          "--option", "column_width=80",
          "--option", "array_auto_expand=true"
        },
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
