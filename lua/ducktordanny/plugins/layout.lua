return {
  -- Colorize inside the editor
  {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require('colorizer').setup {
        '*';
        css = { rgb_fn = true; };
        scss = { rgb_fn = true; };
      }
    end,
  },

  -- Theme inspired by Atom
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {style = 'deep'}
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    'xiyaowong/transparent.nvim',
    opts = {
      extra_groups = {
        'NvimTreeNormal', -- NvimTree
        'NvimTreeEndOfBuffer',
        'NvimTreeCursorLine',
        'BufferLineDevIconLua',
        'BufferLineDevIconMd',
      },
    }
  },

  -- Harpoon
  {
    'ThePrimeagen/harpoon'
  },

  -- Fancy sidebar
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        filters = {custom = {'^.git$', '^.DS_Store$'}},
        git = {ignore = false},
        view = {width = 45},
        renderer = {
          indent_markers = {
            enable = true,
          },
        },
      }
    end,
  },

  -- Better comments with highlight
  {
    'folke/todo-comments.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      require('todo-comments').setup {
        keywords = {
          FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
      }
    end
  },

  -- Markdown preview
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }
}
