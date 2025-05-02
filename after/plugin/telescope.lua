local builtin = require('telescope.builtin')
local telescope = require('telescope')


telescope.setup {
  defaults = {
    sorting_strategy = 'ascending',
    selection_strategy = 'follow',
    layout_strategy = 'vertical',
    layout_config = {
      height = 0.8,
      width = 0.9,
      prompt_position = 'bottom',
      preview_height = 0.6
    }
  }
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  -- builtin.grep_string({ search = vim.fn.input("Grep > ") });
  builtin.live_grep({ prompt_title = "Live Grep > " });
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
