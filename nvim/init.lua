-- ~/.config/nvim/init.lua

-- Enable true color and syntax
vim.opt.termguicolors = true
vim.cmd("syntax on")
vim.cmd("set background=dark")

-- Set leader key (optional)
vim.g.mapleader = " "

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require("lazy").setup({
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard", -- soft, medium, hard
        transparent_background_level = 0,
        italics = true,
      })
      vim.cmd("colorscheme everforest")
    end,
  },
})

