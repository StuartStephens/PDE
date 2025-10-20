local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- Exit file
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.api.nvim_set_keymap('n', '<leader>pv', ':bd<CR>', { noremap = true, silent = true })
-- Vertical Movement
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Move text up and down
keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)

-- Visual --
-- Press jk fast to exit visual mode
keymap('v', 'jk', '<ESC>', opts)
keymap('v', 'kj', '<ESC>', opts)

-- Stay in indent mode
keymap('v', '<', '<gv^', opts)
keymap('v', '>', '>gv^', opts)

-- Move text up and down
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)
keymap('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap('x', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('x', 'K', ":m '<-2<CR>gv=gv", opts)
keymap('x', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('x', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Don't yank when deleting --
keymap('n', 'd', '"_d', opts)

-- Quickfix Step File --
keymap('n', '<M-n>', ':cnext<CR>', opts)
keymap('n', '<M-p>', ':cprev<CR>', opts)

