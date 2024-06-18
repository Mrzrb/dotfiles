-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add this to your Neovim configuration file (init.lua or equivalent)
-- Ensure you have the 'nvim-lspconfig' and 'nvim-lsp-installer' plugins installed
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "go" },
  callback = function()
    vim.b.autoformat = true
  end,
})
