local CF = require("conform")

CF.setup({

  formatters_by_ft = {
    lua = { "stylua" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd" } },
  },
})

function Format(args)
  local range = nil
  if args and args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  CF.format({ async = true, lsp_fallback = true, range = range })
end

vim.api.nvim_create_user_command("Format", function(args)
  Format(args)
end, { range = true })


vim.keymap.set('n', '<space>f', function()
  Format()
end)
