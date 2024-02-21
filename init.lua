-- Check if vim-plug is installed
require("config.lazy")
local plug_path = vim.fn.stdpath('data')..'/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) >  0 then
  -- Install vim-plug
  vim.cmd('!curl -fLo '..plug_path..' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  -- Set up an autocmd to run PlugInstall and reload the configuration file on startup
  vim.cmd([[
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  ]])
else
  -- If vim-plug is already installed, load the plugins
  vim.cmd([[
    call plug#begin('~/AppData/Local/nvim/plugged')
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'andweeb/presence.nvim'
    Plug 'windwp/nvim-ts-autotag', {'do': ':TSUpdate'}
    call plug#end()
  ]])

  -- Set up an autocmd to check if plugins are not installed and install them
  vim.cmd([[
    autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | q | endif
  ]])

  -- Configure nvim-ts-autotag
  require('nvim-treesitter.configs').setup {
    autotag = {
      enable = true,
    },
  }
end