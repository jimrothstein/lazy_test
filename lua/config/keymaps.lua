-- Keymaps are automatically loaded on the VeryLazy event - sudo luarocks install jsregexp
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- Additional keymaps here
--
-- TAGS:    which-key, telescope.builtin
--
--
-- TODO
-- 2023-06-05
-- -    virtualedit mode?   to position cursor on EMPTY line
-- -    LazyVim includes several keymaps!   I maybe duplicating !
-- 2023-06-04
-- -    fixed a few errors,  fz remains
-- 2023-06-03
--      vim.keymap.set("n", "<leader>pv", vim.cmd.e)
-- 31MAY2023
--  easy ESC
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("i", "kk", "<ESC>")

--  insert # --------...
vim.keymap.set("n", "<leader>ic", "yypVr-I# <ESC>")

--TODO:  virtualedit mode
--vim.keymap.set("n", "<leader><Tab>", "12i<TAB>##")
--  move cursor 12 tabs, insert ##

-- keeps prior word
--
-- 	
-- vim.keymap.set("x", '<leader>p', "\"_dP)

--      required, not sure
-- require("telescope")

-- Sets Root Dir to HOME, gives ERROR TODO
local builtin = require("telescope.builtin")
--------------------------------------------
-- vim.keymap.set("n", "<leader>fz", builtin.find_files({ cwd = "~" }))

--     keep cursor in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-u>", "<C-u>zz")

---------------------- ALT-Terminal ----------------------
-- I stole
-- Split navigations.
vim.keymap.set("n", "<A-j>", "<C-w><C-j>")
vim.keymap.set("n", "<A-k>", "<C-w><C-k>")
vim.keymap.set("n", "<A-l>", "<C-w><C-l>")
vim.keymap.set("n", "<A-h>", "<C-w><C-h>")

-- Buffer resizing.
vim.keymap.set("n", "<S-h>", ":call ResizeLeft(3)<CR><Esc>")
vim.keymap.set("n", "<S-l>", ":call ResizeRight(3)<CR><Esc>")
vim.keymap.set("n", "<S-k>", ":call ResizeUp(1)<CR><Esc>")
--  <S-j> is my concatinate key (2 lines)
-- vim.keymap.set("n", "<S-j>", ":call ResizeDown(1)<CR><Esc>")

-- Buffer switching.
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")

-- Moving lines in visual select.
-- map("v", "K", ":move '<-2<CR>gv-gv")
-- map("v", "J", ":move '>+1<CR>gv-gv")

-- ToggleTerm
local function set_terminal_keymaps()
  vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
  vim.keymap.set("t", "<A-h>", "<c-\\><c-n><c-w>h")
  vim.keymap.set("t", "<A-j>", "<c-\\><c-n><c-w>j")
  vim.keymap.set("t", "<A-k>", "<c-\\><c-n><c-w>k")
  vim.keymap.set("t", "<A-l>", "<c-\\><c-n><c-w>l")

  --   TODO:  interfering with navigation
  --  vim.keymap.set("t", "<S-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
  --  vim.keymap.set("t", "<S-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
  --  vim.keymap.set("t", "<S-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
  --  vim.keymap.set("t", "<S-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")
end

--  open terminal, in insert mode
vim.keymap.set("n", "<leader>tt", ":vsplit term://zsh<CR>a")

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    set_terminal_keymaps()
  end,
})

-- Don't copy the replaced text after pasting.
vim.keymap.set("v", "p", '"_dP')

-- With this you can use > < multiple time for changing indent when you visual selected text.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
---------------------- END ALT-Terminal ----------------------
--      FUTURE
--
--  Stole from https://github.com/sum-rock/just-sum-nix/blob/master/homes/modules/neovim/lua/navigation.lua
--
--  ERROR
-- require("which-key").register({
--   w = {
--     name = "Windows",
--     q = { "<cmd>q<cr>", "Quit Window" },
--     Q = { "<cmd>qa<cr>", "Quit All Windows" },
--     h = { "<c-w>h", "Move Left" },
--     j = { "<c-w>j", "Move Down" },
--     k = { "<c-w>k", "Move Up" },
--     l = { "<c-w>l", "Move Right" },
--     s = { "<c-w>s", "Split Horizontally" },
--     v = { "<c-w>v", "Split Vertically" },
-- })
--   },

--   h = {
--     name = "Hop",
--     f = { function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false }) end, "Hop Forward on" },
--     F = { function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end, "Hop Backward on" },
--     t = { function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 }) end, "Hop Forward to" },
--     T = { function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 }) end, "Hop Backward to" },
--   }
-- }, { prefix = "<leader>" })

-- ERROR
--   ["<C-U>"] = { "Scroll up" },
-- require("which-key").register({
--   ["<C-D>"] = { "Scroll down" },
--   ["<C-B>"] = { "Scroll up greater" },
--   ["<C-F>"] = { "Scroll down greater" },
--   ["<C-Y>"] = { "Scroll up lesser" },
-- })
--   ["<C-E>"] = { "Scroll down lesser" },

--  STOLE from :h which-key help

-- require("which-key").register({
--   f = {
--     name = "file", -- optional group name
--     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, buffer = 123 }, -- additional options for creating the keymap
--     n = { "New File" }, -- just a label. don't create any mapping
--     e = "Edit File", -- same as above
--     ["1"] = "which_key_ignore", -- special label to hide it in the popup
--     b = {
--       function()
--         print("bar")
--       end,
--       "Foobar",
--     }, -- you can also pass functions!
--   },
-- }, { prefix = "<leader>" })

