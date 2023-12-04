
require('lint').linters.eslint = {
  cmd = 'eslint_d',
  stdin = false,
  args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
  ignore_exitcode = true,
  parser = require('lint.parser').eslint,
}

require("lint").linters_by_ft = {
  javascript = { "eslint" },
  typescript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
