vim.pack.add {
  { src = 'https://github.com/nvim-neorg/neorg', version = vim.version.range '*' },
  'https://github.com/nvim-neorg/lua-utils.nvim',
  'https://github.com/pysan3/pathlib.nvim',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/MunifTanjim/nui.nvim',
}

local notes_workspace = vim.env.NEORG_HOME or '~/Neorg'
local hugo_workspace = vim.env.NEORG_HUGO_WORKSPACE or '~/projects/my-hugo-site/content-norg'
local neorg_ready = false

for _, workspace in ipairs { notes_workspace, hugo_workspace } do
  local expanded = vim.fn.expand(workspace)
  if vim.fn.isdirectory(expanded) == 0 then
    vim.fn.mkdir(expanded, 'p')
  end
end

local function setup_neorg()
  if neorg_ready then
    return true
  end

  local ok, neorg = pcall(require, 'neorg')
  if not ok then
    vim.notify('Failed to load Neorg: ' .. tostring(neorg), vim.log.levels.ERROR)
    return false
  end

  neorg.setup {
    load = {
      ['core.defaults'] = {},
      ['core.concealer'] = {},
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

  neorg_ready = true
  return true
end

local function call_neorg_command(command)
  return function()
    if setup_neorg() then
      vim.cmd(command)
    end
  end
end

local function feed_neorg_plug(plug)
  return function()
    if not setup_neorg() then
      return
    end

    local keys = vim.api.nvim_replace_termcodes(plug, true, false, true)
    vim.api.nvim_feedkeys(keys, 'm', false)
  end
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'norg',
  callback = function()
    setup_neorg()
  end,
})

vim.keymap.set('n', '<leader>ni', call_neorg_command 'Neorg index', { desc = 'Neorg index' })
vim.keymap.set('n', '<leader>nn', feed_neorg_plug '<Plug>(neorg.dirman.new-note)', { desc = 'Neorg new note' })
vim.keymap.set('n', '<leader>nw', call_neorg_command 'Neorg workspace notes', { desc = 'Neorg notes workspace' })
vim.keymap.set('n', '<leader>nh', call_neorg_command 'Neorg workspace hugo', { desc = 'Neorg Hugo workspace' })
vim.keymap.set('n', '<leader>nt', feed_neorg_plug '<Plug>(neorg.qol.todo-items.todo.task-cycle)', { desc = 'Neorg cycle todo' })
vim.keymap.set('n', '<leader>ne', call_neorg_command 'NeorgExportToMarkdown', { desc = 'Neorg export markdown' })
vim.keymap.set('n', '<leader>nr', call_neorg_command 'Neorg return', { desc = 'Neorg return' })
