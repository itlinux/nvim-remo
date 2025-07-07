local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        { import = "remo.plugins" },
        { import = "remo.plugins.lsp" },
    },
    {
        checker = {
            enabled = true,
            notify = false,
        },
        change_detection = {
            notify = false,
        },
    },
{
  'tigion/nvim-asciidoc-preview',
  ft = { 'asciidoc' },
  build = 'cd server && npm install --omit=dev',
  opts = {
       server = {
        converter = 'js'
      },
      preview = {
        position = 'current',
     },
  },
 },
{
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'darker'
    }
    -- Enable theme
    require('onedark').load()
  end
 }
)

