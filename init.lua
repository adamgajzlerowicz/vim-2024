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
