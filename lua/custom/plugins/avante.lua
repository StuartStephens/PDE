return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    provider = 'copilot',
    auto_suggestions_provider = nil, -- Disable auto-suggestions to save API calls
    providers = {
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-4-5-haiku',
        timeout = 30000,
        extra_request_body = {
          temperature = 1,
          max_tokens = 4096,
        },
      },
      openai = {
        endpoint = 'https://api.openai.com/v1',
        model = 'gpt-4o',
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },
      copilot = {
        endpoint = 'https://api.openai.com/v1',
        model = 'claude-haiku-4.5',
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },
    },
    behaviour = {
      auto_suggestions = false, -- Disable auto-suggestions
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      support_paste_from_clipboard = false,
      minimize_diff = true, -- Whether to only show the difference in changes
    },
    mappings = {
      --- When you band `change_keymap` to change `select_ai_model`, you replace the default key.
      diff = {
        ours = 'co',
        theirs = 'ct',
        all_theirs = 'ca',
        both = 'cb',
        cursor = 'cc',
        next = ']x',
        prev = '[x',
      },
      suggestion = {
        accept = '<M-l>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-]>',
      },
      jump = {
        next = ']]',
        prev = '[[',
      },
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      sidebar = {
        apply_all = 'A',
        apply_cursor = 'a',
        switch_windows = '<Tab>',
        reverse_switch_windows = '<S-Tab>',
      },
    },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = 'right', -- the position of the sidebar
      wrap = true, -- whether the lines in the sidebar are wrapped
      width = 30, -- width of the sidebar in percentage
      sidebar_header = {
        enabled = true, -- whether the header is enabled
        align = 'center', -- left, center, right
        rounded = true,
      },
      input = {
        prefix = '> ',
        height = 8, -- height of the input window in lines
      },
      edit = {
        border = 'rounded',
        start_header = '--- Avante Edit ---',
        end_header = '--- End Avante Edit ---',
      },
      ask = {
        floating = true, -- make ask window floating so it can have borders
        start_header = '--- Avante Ask ---',
        end_header = '--- End Avante Ask ---',
        border = 'rounded',
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = 'DiffText',
        incoming = 'DiffAdd',
      },
    },
    --- @class AvanteGetStatusFunction
    get_status = function()
      return ''
    end,
  },
  build = 'make',
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-telescope/telescope.nvim', -- for file selector
    'ibhagwan/fzf-lua', -- for file selector
    'folke/snacks.nvim', -- for input
  },
  config = function(_, opts)
    require('avante').setup(opts)

    -- Keybindings for Avante
    local keymap = vim.keymap.set
    local opts_desc = function(desc)
      return { noremap = true, silent = true, desc = desc }
    end

    -- Ask about code (with Copilot Premium)
    keymap({ 'n', 'x' }, '<leader>aa', function()
      require('avante.api').ask()
    end, opts_desc('[A]vante [A]sk'))

    -- Edit with Avante
    keymap({ 'n', 'x' }, '<leader>ae', function()
      require('avante.api').edit()
    end, opts_desc('[A]vante [E]dit'))

    -- Toggle Avante sidebar
    keymap('n', '<leader>at', function()
      require('avante.api').toggle()
    end, opts_desc('[A]vante [T]oggle'))

    -- Refactor code
    keymap({ 'n', 'x' }, '<leader>ar', function()
      require('avante.api').ask('Refactor this code for better performance and readability.')
    end, opts_desc('[A]vante [R]efactor'))

    -- Add/run slash command
    keymap('n', '<leader>ax', function()
      require('avante.api').ask('/')
    end, opts_desc('[A]vante e[X]ecute command'))

    -- Explain code
    keymap({ 'n', 'x' }, '<leader>ad', function()
      require('avante.api').ask('Explain this code in detail.')
    end, opts_desc('[A]vante [D]ocument'))

    -- Fix errors/issues
    keymap({ 'n', 'x' }, '<leader>af', function()
      require('avante.api').ask('Fix any issues or errors in this code.')
    end, opts_desc('[A]vante [F]ix'))
  end,
}
