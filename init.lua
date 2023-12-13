vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.cmd "wa"
    -- local startify_config = require "custom.configs.overrides"
    -- startify_config.save_session()
  end,
})

vim.opt.swapfile = false
vim.opt.clipboard = ""

vim.cmd [[
  autocmd VimLeavePre * :bufdo :update
]]

vim.cmd [[
  autocmd BufWritePre * %s/\s\+$//e
]]

vim.opt.autoread = true

local autocmd = vim.api.nvim_create_autocmd -- alias for nvim_create_autocmd

autocmd("FocusGained", {
  pattern = "*",
  command = "checktime",
})

autocmd("FocusLost", {
  pattern = "*",
  command = ":wa",
})

-- local group = vim.api.nvim_create_augroup("formatting", { clear = true })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = group,
--     pattern = {"*.markdown", "*.md"},
--     command = "lua vim.lsp.buf.format({ name = 'prettier' })"
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = group,
--     pattern = "*.css",
--     command = "lua vim.lsp.buf.format({ name = 'prettier' })"
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = group,
--     pattern = "*.html",
--     command = "lua vim.lsp.buf.format({ name = 'prettier' })"
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = group,
--     pattern = "*.json",
--     command = "lua vim.lsp.buf.format({ name = 'prettier' })"
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = group,
--     pattern = "*.astro",
--     command = "lua vim.lsp.buf.format({ name = 'prettier' })"
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = group,
--     pattern = {"*.js", "*.ts", "*.tsx"},
--     command = "lua vim.lsp.buf.format({ name = 'prettier' })"
-- })

