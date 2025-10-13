return {
  -- Dart language server
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        dartls = {},
      },
    },
  },

  -- Flutter tools integration
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional UI improvements
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('flutter-tools').setup {
        lsp = {
          color = {
            enabled = true,
            background = true,
          },
        },
      }
    end,
  },

  -- Treesitter for Dart syntax
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'dart' },
    },
  },
}
