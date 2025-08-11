-- Initialize Mason
require('mason').setup()
require('mason-lspconfig').setup({
  automatic_enable = false,
  ensure_installed = {
    "ts_ls", "lua_ls", "eslint", "dockerls", "docker_compose_language_service",
    "gopls", "golangci_lint_ls", "templ", "tailwindcss", "pyright", "html",
  }
})

-- Common LSP setup
local lspconfig = require('lspconfig')
local client_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Common on_attach function
local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- Keymaps (defined once, applied globally)
  local keymap = vim.keymap.set
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  keymap("n", "<leader>vd", vim.diagnostic.open_float, opts)
  keymap("n", "[d", vim.diagnostic.goto_next, opts)
  keymap("n", "]d", vim.diagnostic.goto_prev, opts)
  keymap("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>vrr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  keymap("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  keymap('n', '<space>f', function() vim.lsp.buf.format({ async = true }) end)
end

-- Function to simplify LSP server setup
local function setup_servers(servers)
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      capabilities = client_capabilities,
      on_attach = on_attach,
    }
  end
end

-- Setup common language servers
setup_servers({ 'ts_ls', 'lua_ls', 'dockerls', 'gopls', 'golangci_lint_ls', 'pyright', 'templ',
  "html"
})

-- TailwindCSS setup with specific filetypes
lspconfig['tailwindcss'].setup {
  capabilities = client_capabilities,
  on_attach = on_attach,
  filetypes = {
    "aspnetcorerazor", "astro", "blade", "django-html", "html", "markdown", "typescriptreact", "vue", "svelte", "templ",
    -- other filetypes...
  }
}

-- Eslint specific setup
lspconfig.eslint.setup {
  capabilities = client_capabilities,
  flags = { debounce_text_changes = 500 },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "mjs", "cjs" },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    if client.server_capabilities.documentFormattingProvider then
      local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function() end,
        -- callback = function() vim.lsp.buf.format({ async = false }) end,
        group = au_lsp,
      })
    end
  end,
}

-- Additional filetype definitions
vim.filetype.add({ extension = { templ = "templ" } })
