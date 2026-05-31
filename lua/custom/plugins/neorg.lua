return {
  {
    'nvim-neorg/neorg',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-neorg/lua-utils.nvim',
      'pysan3/pathlib.nvim',
      'nvim-neotest/nvim-nio',
      'MunifTanjim/nui.nvim',
      'hrsh7th/nvim-cmp',
    },
    keys = {
      { '<leader>ni', '<cmd>Neorg index<CR>', desc = 'Neorg index' },
      { '<leader>nn', '<Plug>(neorg.dirman.new-note)', desc = 'Neorg new note' },
      { '<leader>nw', '<cmd>Neorg workspace notes<CR>', desc = 'Neorg notes workspace' },
      { '<leader>nh', '<cmd>Neorg workspace hugo<CR>', desc = 'Neorg Hugo workspace' },
      { '<leader>nt', '<Plug>(neorg.qol.todo-items.todo.task-cycle)', desc = 'Neorg cycle todo' },
      { '<leader>ne', '<cmd>NeorgExportToMarkdown<CR>', desc = 'Neorg export markdown' },
      { '<leader>nr', '<cmd>Neorg return<CR>', desc = 'Neorg return' },
    },
    config = function()
      local notes_workspace = vim.env.NEORG_HOME or '~/Neorg'
      local hugo_workspace = vim.env.NEORG_HUGO_WORKSPACE or '~/projects/my-hugo-site/content-norg'

      for _, workspace in ipairs { notes_workspace, hugo_workspace } do
        local expanded = vim.fn.expand(workspace)
        if vim.fn.isdirectory(expanded) == 0 then
          vim.fn.mkdir(expanded, 'p')
        end
      end

      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = notes_workspace,
                hugo = hugo_workspace,
              },
              default_workspace = 'notes',
              index = 'index.norg',
            },
          },
          ['core.qol.todo_items'] = {},
          ['core.export'] = {},
          ['core.export.markdown'] = {
            config = {
              extensions = {
                'todo-items-basic',
                'todo-items-pending',
                'todo-items-extended',
                'definition-lists',
                'metadata',
                'mathematics',
              },
            },
          },
        },
      }

      local cmp_ok, cmp = pcall(require, 'cmp')
      if cmp_ok then
        cmp.setup.filetype('norg', {
          sources = cmp.config.sources({
            { name = 'neorg' },
          }, cmp.get_config().sources),
        })
      end

      if vim.fn.exists ':NeorgWorkspaceAdd' == 0 then
        vim.api.nvim_create_user_command('NeorgWorkspaceAdd', function(opts)
          if #opts.fargs ~= 2 then
            vim.notify('Usage: NeorgWorkspaceAdd <name> <path>', vim.log.levels.ERROR)
            return
          end

          local name = opts.fargs[1]
          local path = vim.fn.expand(opts.fargs[2])
          local dirman = require('neorg').modules.get_module 'core.dirman'

          if not dirman then
            vim.notify('Neorg dirman module is unavailable', vim.log.levels.ERROR)
            return
          end

          local added = dirman.add_workspace(name, path)
          if not added then
            vim.notify(string.format("Neorg workspace '%s' already exists", name), vim.log.levels.WARN)
          end

          dirman.open_workspace(name)
        end, {
          desc = 'Add and open a Neorg workspace',
          nargs = '+',
          complete = 'dir',
        })
      end

      if vim.fn.exists ':NeorgExportToMarkdown' == 0 then
        vim.api.nvim_create_user_command('NeorgExportToMarkdown', function(opts)
          local destination = opts.args
          if destination == '' then
            destination = vim.fn.expand '%:p:r'
            destination = destination .. '.md'
          else
            destination = vim.fn.expand(destination)
          end

          local escaped = vim.fn.fnameescape(destination)
          vim.cmd('Neorg export to-file ' .. escaped .. ' markdown')
          vim.notify('Neorg exported to ' .. destination)
        end, {
          desc = 'Export current .norg file to markdown',
          nargs = '?',
          complete = 'file',
        })
      end
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
      parser_config.norg_meta = {
        install_info = {
          url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
          branch = 'main',
          files = { 'src/parser.c' },
        },
        filetype = 'norg_meta',
      }

      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 'norg', 'norg_meta' })
    end,
  },
}
