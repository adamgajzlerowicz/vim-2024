vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.api.nvim_command "silent wall"
  end,
})

vim.opt.swapfile = false
vim.opt.clipboard = ""

vim.cmd [[
  autocmd VimLeavePre * silent :bufdo :update
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
  command = "silent! wa",
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "highlight Visual guibg=#E76F51 guifg=#000000",
})

vim.opt.mouse = ""
