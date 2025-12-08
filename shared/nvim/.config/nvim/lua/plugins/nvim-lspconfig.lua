local neoconf = require("neoconf")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
            useFlatConfig = true,
          },
        },

        -- qmlls = {},

        -- marksman = {},

        tailwindcss = {
          settings = {
            classAttributes = {
              "class",
              "className",
              "ngClass",
              "ui",
            },
            experimental = {
              classRegex = {
                "ui:\\s*{([^)]*)\\s*}",
                "[\"'`]([^\"'`]*).*?[\"'`]",
                "/\\*\\s?ui\\s?\\*/\\s*{([^;]*)}",
                ":\\s*[\"'`]([^\"'`]*).*?[\"'`]",
              },
              configFile = "tailwind.config.ts",
            },
          },
          filetypes_exclude = { "markdown", "javascript", "typescript" },
          filetypes_include = {},
        },

        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
            },
          },
        },
      },

      setup = {
        eslint = function(_, opts)
          -- Don't use flat config on vue projects for now
          if neoconf.get("vue") then
            opts.settings.useFlatConfig = false
          end
        end,

        tailwindcss = function(_, opts)
          opts.filetypes = opts.filetypes or {}

          -- Hack to disable tailwind on projects that don't need it.
          if neoconf.get("tailwind") then
            vim.list_extend(opts.filetypes, vim.lsp.config.tailwindcss.filetypes)

            opts.filetypes = vim.tbl_filter(function(ft)
              return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
            end, opts.filetypes)

            -- Add additional filetypes
            vim.list_extend(opts.filetypes, opts.filetypes_include or {})
          else
            return true
          end
        end,
      },
    },
  }
}
