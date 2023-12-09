vim.g.startify_lists = {
  { type = "sessions", header = { "   Sessions" } },
  { type = "bookmarks", header = { "   Bookmarks" } },
  { type = "commands", header = { "   Commands" } },
}

vim.g.startify_bookmarks = {
  { agilix = "~/projects/agilix" },
  { vim_config = "~/.config/nvim/lua/custom" },
  { console = "~/projects/cmp-main" },
}

vim.g.startify_session_persistence = 1
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_enable_special = 0
vim.g.startify_session_dir = "~/.config/nvim/session"

local function save_session()
  if vim.v.this_session ~= "" then
    vim.cmd("mks! " .. vim.v.this_session)
  end
end

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = save_session,
})
-- g:startify_session_persistence
