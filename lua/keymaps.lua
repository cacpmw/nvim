-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<c-n>',':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader>h',':nohlsearch<CR>')
vim.keymap.set('n', '<C-h>', '<C-w>h', opts) -- navigate left 
vim.keymap.set('n', '<C-j>', '<C-w>j', opts) -- navigate down 
vim.keymap.set('n', '<C-k>', '<C-w>k', opts) -- navigate up  
vim.keymap.set('n', '<C-l>', '<C-w>l', opts) -- navigate right

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------
-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('n', '<leader>f', '<cmd>:Telescope find_files<cr>', opts)
vim.keymap.set('n','<leader>e','<cmd>:NvimTreeToggle<cr>', opts)
vim.keymap.set('n','<leader>t','<cmd>:terminal<cr>', opts)
vim.keymap.set('n','<leader>s',':w<CR>',opts)
