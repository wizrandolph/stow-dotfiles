-- OSC 52: let the terminal handle clipboard (works over SSH)
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = function() end,
    ["*"] = function() end,
  },
}

vim.opt.clipboard = "unnamedplus"
