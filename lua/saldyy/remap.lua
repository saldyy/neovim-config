vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>bls", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
vim.keymap.set("n", "<leader>ba", '<cmd>lua require("harpoon.mark").add_file()<cr>')
vim.keymap.set("n", "<leader>bn", '<cmd>lua require("harpoon.ui").nav_next()<cr>')
vim.keymap.set("n", "<leader>bp", '<cmd>lua require("harpoon.ui").nav_prev()<cr>')
