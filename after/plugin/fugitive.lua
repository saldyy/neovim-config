vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

vim.api.nvim_create_user_command('Gcmsg',function(opts)
  vim.cmd("Git commit -m " .. opts.fargs[1])
end,{
  nargs = 1,
})

vim.api.nvim_create_user_command('Gp',function()
  vim.cmd("Git push")
end,{})

vim.api.nvim_create_user_command('Gf',function()
  vim.cmd("Git fetch")
end,{})

vim.api.nvim_create_user_command('Gl',function(opts)
  local pullArgs = ""
  for _, arg in ipairs(opts.fargs) do
    print(arg)
    pullArgs = pullArgs .. arg .. " "
  end

  vim.cmd("Git pull ".. pullArgs)
end,{
  nargs = "*"
})

vim.api.nvim_create_user_command('Gbl',function()
  vim.cmd("Git blame")
end, {})
