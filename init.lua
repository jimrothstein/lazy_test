local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'


-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)


-- get plugins ready
require('lazy').setup({
  ---
  -- List of plugins...
  {'folke/tokyonight.nvim'},

  -- lsp-zero
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  } 
})

-- call &  load
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
local lsp = require('lsp-zero').preset({})

-- lsp config
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- setups lua lsp server 
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()