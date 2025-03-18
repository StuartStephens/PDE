return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>G', '<cmd>vertical G<cr>', { desc = '[G]it Fugitive' })
  end,
}
