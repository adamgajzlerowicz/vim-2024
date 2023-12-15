local function find_prettier()
  local filepath = vim.fn.expand('%:p')
  local root = vim.loop.cwd()

  while filepath and filepath ~= root do
    filepath = vim.fn.fnamemodify(filepath, ':h')
    local prettier_path = filepath .. '/node_modules/.bin/prettier'
    if vim.fn.executable(prettier_path) == 1 then
      return prettier_path
    end
  end
  return 'prettier'
end

local filetypes = {
  "lua",
  "css",
  "eruby",
  "html",
  "javascript",
  "javascriptreact",
  "less",
  "sass",
  "scss",
  "svelte",
  "pug",
  "typescriptreact",
  "typescript",
  "vue",
  "astro",
}

local formatterConfig = {}
for _, filetype in ipairs(filetypes) do
  formatterConfig[filetype] = {
    function()
      return {
        exe = find_prettier(),
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
      }
    end
  }
end

require('formatter').setup({
  filetype = formatterConfig
})

