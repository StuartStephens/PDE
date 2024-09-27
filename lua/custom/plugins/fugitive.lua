return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>G', '<cmd>vertical G<cr>', { desc = 'Markdown Preview' })
  end,
}
