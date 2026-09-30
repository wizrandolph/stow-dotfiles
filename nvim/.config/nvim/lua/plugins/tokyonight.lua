---@type LazySpec
return {
  "folke/tokyonight.nvim",
  lazy = true,
  ---@type tokyonight.Config
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(hl)
      -- styles.floats does not reach bg_popup, so Pmenu stays solid without this
      hl.Pmenu.bg = "NONE"
      hl.PmenuMatch.bg = "NONE"
    end,
  },
}
