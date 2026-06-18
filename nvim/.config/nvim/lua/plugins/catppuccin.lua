return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    transparent_background = true,
    custom_highlights = function()
      return {
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        Pmenu = { bg = "NONE" },
        TelescopeNormal = { bg = "NONE" },
        TelescopeBorder = { bg = "NONE" },
        WhichKeyFloat = { bg = "NONE" },
      }
    end,
  },
}
