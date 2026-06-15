-- OSC 52: copy reaches system clipboard, paste uses local cache (no terminal round-trip)
local osc52 = require("vim.ui.clipboard.osc52")
local clipboard_cache = {}

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = function(lines, regtype)
      clipboard_cache["+"] = { lines, regtype }
      osc52.copy("+")(lines, regtype)
    end,
    ["*"] = function(lines, regtype)
      clipboard_cache["*"] = { lines, regtype }
      osc52.copy("*")(lines, regtype)
    end,
  },
  paste = {
    ["+"] = function() return clipboard_cache["+"] or { { "" }, "v" } end,
    ["*"] = function() return clipboard_cache["*"] or { { "" }, "v" } end,
  },
}

vim.opt.clipboard = "unnamedplus"
