local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	-- builtin.grep_string({ search = vim.fn.input("Grep > ") });
  builtin.live_grep({ prompt_title = "Live Grep > " });
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

