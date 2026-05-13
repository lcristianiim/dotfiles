-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.laststatus = 2
vim.opt.statusline = "%F%m%r%h%w (%{&ff}){%Y} [%l,%v][%p%%]"
vim.opt.termguicolors = true
vim.opt.undolevels = 1000
vim.opt.history = 1000
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.autochdir = false

-- Keybindings
vim.keymap.set("n", "<Leader>rtw", ":%s/\\s\\+$//e<CR>", { desc = "Remove trailing whitespace" })
vim.keymap.set("n", "<C-Right>", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":tabprevious<CR>", { silent = true })
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<F10>", ":set paste!<CR>", { silent = true })
vim.keymap.set("n", "<F12>", ":terminal<CR>", { silent = true })

-- Window navigation (tmux-aware)
if os.getenv("TMUX") then
  vim.keymap.set("n", "<C-h>", function()
    vim.cmd("wincmd h")
  end, { silent = true })
  vim.keymap.set("n", "<C-j>", function()
    vim.cmd("wincmd j")
  end, { silent = true })
  vim.keymap.set("n", "<C-k>", function()
    vim.cmd("wincmd k")
  end, { silent = true })
  vim.keymap.set("n", "<C-l>", function()
    vim.cmd("wincmd l")
  end, { silent = true })
else
  vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
  vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
  vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
  vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
end

-- Highlight trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

-- Filetype settings
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.ejs",
  command = "set filetype=html",
})

-- Colorscheme
vim.opt.background = "dark"

-- Load plugins
require("lazy").setup("plugins")