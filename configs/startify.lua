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

local function get_last_segment(path)
  local separator = package.config:sub(1, 1) == "\\" and "\\" or "/" -- Detects the directory separator based on the operating system
  local segments = {}
  for segment in string.gmatch(path, "[^" .. separator .. "]+") do
    table.insert(segments, segment)
  end
  return segments[#segments] -- Return the last segment
end

local function save_session()
  if vim.v.this_session ~= "" then
    vim.cmd("SSave! " .. get_last_segment(vim.v.this_session))
    vim.fn.input "Press any key to continue..."
  end
end

-- vim.api.nvim_create_autocmd("VimLeavePre", {
--   callback = save_session,
-- })

