require("toggleterm").setup({
  open_mapping = [[<C-t>]],
  direction = 'float'
})

function _G.set_terminal_keymaps()
  local opts = {buffer = true}
  vim.keymap.set('t', '<esc>', [[<C-t><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-t><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-t><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

