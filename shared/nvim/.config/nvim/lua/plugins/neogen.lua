return {
  "danymat/neogen",
  opts = function(_, opts)
    opts.languages = {
      javascript = {
        template = {
          annotation_convention = "jsdoc",
        },
      },
      typescript = {
        template = {
          annotation_convention = "tsdoc",
        },
      },
    }
  end,
}
