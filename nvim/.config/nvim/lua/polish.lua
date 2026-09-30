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

-- 缩进：4 个空格（覆盖 AstroNvim 默认的 2 空格）
vim.opt.tabstop = 4 -- 一个 Tab 显示为 4 个空格宽
vim.opt.shiftwidth = 4 -- 自动缩进使用 4 个空格
vim.opt.softtabstop = 4 -- 按 Tab 键插入 4 个空格
vim.opt.expandtab = true -- 将 Tab 转换为空格
