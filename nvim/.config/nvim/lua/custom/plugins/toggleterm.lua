-- toggleterm: Ctrl-\ 开/关终端
vim.pack.add { 'https://github.com/akinsho/toggleterm.nvim' }

require('toggleterm').setup {
  open_mapping = [[<c-\>]],
  direction = 'float', -- 'horizontal' | 'vertical' | 'tab' | 'float'
  size = 20,
  float_opts = {
    border = 'rounded', -- 默认 'single'（直角），可选 'double' | 'shadow' | 'curved' | 'solid' | 'none'
  },
}

-- 设置快捷键
-- 1. <leader> t t 
vim.keymap.set('n', '<leader>tt', function() require('toggleterm').toggle() end, { desc = '[T]oggle [T]erminal' })
