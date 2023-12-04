vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.cmd "wa"
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
