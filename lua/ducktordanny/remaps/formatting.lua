local prettier = require 'prettier'

prettier.setup {
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    'css',
    'graphql',
    'html',
    'javascript',
    'javascriptreact',
    'json',
    'less',
    'markdown',
    'scss',
    'typescript',
    'typescriptreact',
    'yaml',
  },
  ['null-ls'] = {
    condition = function()
      return prettier.config_exists {
        -- if `false`, skips checking `package.json` for `"prettier"` key
        check_package_json = true,
      }
    end,
    runtime_condition = function(params)
      -- return false to skip running prettier
      return true
    end,
    timeout = 5000,
  },
}

local ft = require 'guard.filetype'
ft('typescript,javascript,typescriptreact'):fmt 'prettier'
ft('lua'):fmt 'stylua'

require('guard').setup {
  -- the only options for the setup function
  fmt_on_save = true,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = false,
}
