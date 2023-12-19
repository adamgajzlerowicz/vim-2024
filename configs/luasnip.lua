local luasnip = require "luasnip"

local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node

local consoleLog = snippet("cl", {
  text_node("console.log("),
  insert_node(1, "\"msg\""),
  text_node(");"),
})


luasnip.snippets = {
  {
    "pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup {
        trigger_events = { "VimLeavePre" },
        enabled = true,
        write_all_buffers = true,
      }
    end,
  },
  javascript = { consoleLog },
  typescript = { consoleLog },
  javascriptreact = { consoleLog },
  typescriptreact = { consoleLog },
}
