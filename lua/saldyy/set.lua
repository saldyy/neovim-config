vim.opt.relativenumber = true

vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab = true

vim.opt.clipboard='unnamedplus'
vim.opt.incsearch=false
vim.opt.hlsearch=false

vim.cmd([[
  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=100 }
  augroup END
]])
