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

-- Greates remap ever (according to ThePrimeagen)
vim.keymap.set('x', '<leader>p', '\"_dP')

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

vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<cr>', { desc = '[N]vimTree [T]oggle' })
vim.keymap.set('n', '<leader>ns', ':NvimTreeFindFile<cr>', { desc = '[N]vimTree [S]earch_file' })
vim.keymap.set('n', '<leader>nr', ':NvimTreeRefresh<cr>', { desc = '[N]vimTree [R]efresh' })

-- harpoon and buffer remaps
vim.keymap.set('n', '<leader>h', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon toggle' })
vim.keymap.set('n', '<C-n>', require('harpoon.ui').nav_next, { desc = 'Harpoon [N]ext' })
vim.keymap.set('n', '<C-p>', require('harpoon.ui').nav_prev, { desc = 'Harpoon [P]revious' })
vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon [A]dd' })
vim.keymap.set('n', '<leader>WW', ':%bd|e#|bd#<cr>', { desc = 'Close all buffers but this' })

-- quick switch between buffers
vim.keymap.set('n', '<leader>W', ':bd<cr>:bprevious<cr>', { desc = 'Close current buffer window and open previous' })

-- bufferline remaps and other config
vim.keymap.set('n', 'N', ':BufferLineCycleNext<cr>:LspStart<cr>', { desc = 'BufferLine Cycle_[N]ext' })
vim.keymap.set('n', 'P', ':BufferLineCyclePrev<cr>:LspStart<cr>', { desc = 'BufferLine Cycle_[P]rev' })

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
