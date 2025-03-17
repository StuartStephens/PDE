return {
  'iamcco/markdown-preview.nvim',
  -- keys = {
  --     { "<C-s>", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" }
  -- },
  config = function()
    vim.fn['mkdp#util#install']()
    vim.keymap.set('n', '<leader>md', '<cmd>MarkdownPreview<cr>', { desc = 'Markdown Preview' })
  end,
}
