---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "typescript-language-server",
        "stylua",
      },
    },
  },
}
