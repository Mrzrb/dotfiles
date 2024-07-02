-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function keymapOptions(desc)
  return {
    noremap = true,
    silent = true,
    nowait = true,
    desc = "GPT prompt " .. desc,
  }
end

-- Chat commands
vim.keymap.set({ "n", "i" }, "<C-g>c", "<cmd>GpChatNew<cr>", keymapOptions("New Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>a", "<cmd>GpRewrite<cr>", keymapOptions("New Chat"))
vim.keymap.set("v", "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", keymapOptions("Visual Chat New"))
vim.keymap.set({ "n", "i" }, "<C-g>r", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
vim.keymap.set("v", "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
vim.keymap.set("v", "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions("Visual Append (after)"))

vim.api.nvim_set_keymap("n", ",w", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>pr",
  ':lua require("telescope.builtin").grep_string({search = "POST(|GET("})<CR>',
  { noremap = true, silent = true, desc = "gin router" }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>pT",
  ':lua require("telescope.builtin").grep_string({search = "*testing.T"})<CR>',
  { noremap = true, silent = true, desc = "gin router" }
)

vim.api.nvim_set_keymap("n", "J", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "L", ":vertical resize -6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", ":vertical resize +6<CR>", { noremap = true, silent = true })

-- 在普通模式和插入模式下使用 Command + v 进行粘贴
vim.api.nvim_set_keymap("n", "<D-v>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<D-v>", '<Esc>"+pa', { noremap = true, silent = true })
