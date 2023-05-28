return {
  -- Theme inspired by Atom
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {style = 'deep'}
      vim.cmd.colorscheme 'onedark'
    end,
  },

  -- Showing opened buffers in the top
  {
    'akinsho/bufferline.nvim',
    version = 'v3.*',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('bufferline').setup {
        options = {
          buffer_close_icon = '𝙓',
          close_icon = '',
          numbers = 'ordinal',
          offsets = {{
            filetype = 'NvimTree',
            text = 'neovim',
            highlight = 'Directory',
            text_align = 'left'
          }},
          diagnostics = 'nvim_lsp',
       }
      }
    end
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
      }
    end,
  },

  -- Better comments with highlight
  {
    'folke/todo-comments.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      require('todo-comments').setup {}
    end
  },
}
