-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move around stuff here:
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- move around between splits better:
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Undotree stuff
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<cr>', {desc = '[U]ndotree'})

-- nvim-tree.lua remaps and other stuff
local function open_nvim_tree()
  require('nvim-tree.api').tree.open()
end

require("nvim-tree.api").tree.toggle({ find_file = true, focus = false })
vim.keymap.set('n', 'F', ':NvimTreeFocus<cr>', { desc = 'NvimTree [F]ocus' })
vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<cr>', { desc = '[N]vimTree [T]oggle' })
vim.keymap.set('n', '<leader>ns', ':NvimTreeFindFile<cr>', { desc = '[N]vimTree [S]earch_file' })
vim.keymap.set('n', '<leader>nr', ':NvimTreeRefresh<cr>', { desc = '[N]vimTree [R]efresh' })
vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

-- bufferline remaps and other config
vim.keymap.set('n', '<leader>bc', ':BufferLinePickClose<cr>', { desc = '[B]ufferLine Pick_[C]lose' })
vim.keymap.set('n', '<leader>bo', ':BufferLinePick<cr>', { desc = '[B]ufferLine Pick for [O]pen' })
vim.keymap.set('n', 'N', ':BufferLineCycleNext<cr>', { desc = '[B]ufferLine Cycle_[N]ext' })
vim.keymap.set('n', 'P', ':BufferLineCyclePrev<cr>', { desc = '[B]ufferLine Cycle_[P]rev' })
vim.keymap.set('n', '<leader>W', ':bd<cr>:bprevious<cr>', { desc = 'Close current buffer window' })
vim.keymap.set('n', 'T', ':bprevious<cr>', { desc = 'Buffer previous' })

-- git, gitsigns and vgit remaps
vim.keymap.set('n', '<leader>gl', ':Flogsplit<cr>', { desc = '[G]it [L]og' })
vim.keymap.set('n', '<leader>gr', ':Gitsigns refresh<cr>', { desc = '[G]itsigns [R]efresh' })
vim.keymap.set('n', '<leader>ga', ':Git add --all<cr>', { desc = '[G]it add [a]ll' })
vim.keymap.set('n', '<leader>gc', ':Git commit -m ""', { desc = '[G]it [C]ommit' })
vim.keymap.set('n', '<leader>gs', ':Git status<cr>', { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gp', ':Git push', { desc = '[G]it [P]ush' })
vim.keymap.set('n', '<leader>gf', ':Git fetch', { desc = '[G]it [F]etch' })
vim.keymap.set('n', '<leader>gb', ':Git blame<cr>', { desc = '[G]it [B]lame' })
vim.keymap.set('n', '<leader>gd', ':VGit project_diff_preview<cr>', { desc = '[G]it [D]iff preview' })
vim.keymap.set('n', '<leader>l', ':LazyGit<cr>', { desc = '[L]azyGit' })
vim.keymap.set('n', '<leader>gu', ':Gitsigns reset_hunk<cr>', { desc = '[G]it [U]ndo hunk' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- SymbolsOutline
vim.keymap.set('n', '<leader>s', ':SymbolsOutline<cr>', { desc = '[S]ymbolsOutline'})

-- Glow
vim.keymap.set('n', '<leader>md', ':Glow<cr>', { desc = 'Glow [M]ark[d]own' })

-- Better visual mode indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
