require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "tsserver", "lua_ls", "eslint", "terraformls", "dockerls", "docker_compose_language_service", "gopls", "golangci_lint_ls", "templ",
    "tailwindcss"
  }
})
-- Setup language servers.
local lspconfig = require('lspconfig')
local client_capabilities = require('cmp_nvim_lsp').default_capabilities()


local on_attach = function(_, _)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
    print('format')
    vim.lsp.buf.format { async = true }
  end, opts)
end

lspconfig['tailwindcss'].setup {
  capabilities = client_capabilities,
  on_attach = on_attach,
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ" }
}

lspconfig.tsserver.setup {
  capabilities = client_capabilities,
  on_attach = on_attach
}

lspconfig.lua_ls.setup {
  capabilities = client_capabilities,
  on_attach = on_attach
}

lspconfig.terraformls.setup {
  capabilities = client_capabilities,
  on_attach = on_attach
}

lspconfig['dockerls'].setup {
  capabilities = client_capabilities,
  on_attach = on_attach
}

lspconfig.gopls.setup {
  capabilities = client_capabilities,
  on_attach = on_attach
}

lspconfig.golangci_lint_ls.setup {
  capabilities = client_capabilities,
  on_attach = on_attach
}

lspconfig.templ.setup {
  capabilities = client_capabilities,
  on_attach = on_attach,
  filetypes = {"templ"}
}

lspconfig.eslint.setup({
	capabilities = client_capabilities,
	flags = { debounce_text_changes = 500 },
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
		if client.server_capabilities.documentFormattingProvider then
      			local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      			vim.api.nvim_create_autocmd("BufWritePre", {
        			pattern = "*",
        			callback = function()
        			end,
        			group = au_lsp,
      			})
    		end
  	end,
})

vim.cmd([[
  au User lsp_setup call lsp#register_server({
      \ 'name': 'terraform-ls',
      \ 'cmd': {server_info->['terraform-ls', 'serve']},
      \ 'whitelist': ['terraform'],
      \ })
]])

vim.filetype.add({ extension = { templ = "templ" } })


