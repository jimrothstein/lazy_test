-- /home/jim/.config/nvim/lua/config/luasnip.lua
--
-- REF:   luansip documentation (good examples)
-- 2023-05-13; TODO: add if/then tosnippet sep
--

-- testng   -- benefit ??   does not load this file
--2023-05-31
require("luasnip.loaders.from_lua").load({ paths = "~/config/nvim/lua/config/luasnip.lua" })
require("luasnip.loaders.from_vscode").load()

-- list?
--  required abbrev
local ls = require("luasnip")
---------------------------------- Works !
--  13,16so
print(vim.inspect(ls.available()))
----------------------------------
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_nodek
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key
--- -----------------------------
-- some shorthands...
local snip = ls.snippet
local text = ls.text_node
local func = ls.function_node
local insert = ls.insert_node

-- HELPERS
--
local date = function()
  return { os.date("%Y-%m-%d") }
end

local filename = function()
  return { vim.fn.expand("%:p") }
end

ls.add_snippets("all", { -- all file types
  all = {
    -- simplest
    s("triggerA", { t("Wow Text!") }),
    -- study, placehold
    s("trigger", {
      t({ "After expanding, the cursor is here ->" }),
      i(1),
      t({ "", "After jumping forward once, cursor is here ->" }),
      i(2),
      t({ "", "After jumping once more, the snippet is exited there ->" }),
      i(0),
    }),
    snip({
      trig = "date_jr",
      namr = "Date",
      dscr = "jr: Date in the form of DD-MM-YYYY",
    }, {
      func(date, {}),
    }),
    snip({
      trig = "filename",
      namr = "Filename",
      dscr = "Absolute path to file",
    }, {
      t("-- "),
      func(filename, {}),
    }),
    snip({
      trig = "sep",
      namr = "Separate",
      dscr = "Separate sections",
    }, {
      text(" -------------------------------------------------- "),
      t("<add reason>"),
      insert(0),
    }),
    snip({
      trig = "signature",
      namr = "Signature",
      dscr = "Name and Surname",
    }, {
      text("Sergei Bulavintsev"),
      insert(0),
    }),
  },

  -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
  s("condition", {
    i(1, "cond"),
    t(" ? "),
    i(2, "then"),
    t(" : "),
    i(3, "else"),
  }),
})
-------------------------
