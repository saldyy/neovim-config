require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "terraform",
    "dockerfile"
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
