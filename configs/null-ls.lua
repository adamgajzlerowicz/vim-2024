local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettierd.with {
    filetypes = {
      { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue",
        "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars"
      }
  } },
  b.code_actions.eslint_d,
  b.diagnostics.golangci_lint,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
          -- vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}
