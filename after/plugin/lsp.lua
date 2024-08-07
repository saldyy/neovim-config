require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "tsserver", "lua_ls", "eslint", "dockerls", "docker_compose_language_service",
    "gopls", "golangci_lint_ls", "templ",
    "tailwindcss", "pyright"
  }
})

-- Setup language servers.
local lspconfig = require('lspconfig')
local client_capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lspconfig['tailwindcss'].setup {
  capabilities = client_capabilities,
  on_attach = on_attach,
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ" }
}

lspconfig.pyright.setup {
  capabilities = client_capabilities,
  on_attach = on_attach,
}

lspconfig.tsserver.setup {
  capabilities = client_capabilities,
  on_attach = on_attach,
}

lspconfig.lua_ls.setup {
  capabilities = client_capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
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
  filetypes = { "templ" }
}

lspconfig.eslint.setup({
  capabilities = client_capabilities,
  flags = { debounce_text_changes = 500 },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "mjs", "cjs"},
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
