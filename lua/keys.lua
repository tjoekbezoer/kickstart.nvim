-- Clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Set the current working directory of the active window, based on
-- the currently displayed buffer
vim.keymap.set('n', 'cd', function()
  local cur_filename = vim.api.nvim_buf_get_name(0)
  if cur_filename == nil or cur_filename == '' then
    return
  end

  local cur_directory = vim.fs.dirname(cur_filename)
  vim.fn.chdir(cur_directory)
end)

-- Cursor repositioning corrections
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
-- Better indenting in visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- Delete without replacing yank register
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without replacing yank register' })
vim.keymap.set({ 'n', 'v', 'o' }, '<leader>d', [["_d]], { desc = 'Delete without replacing yank register' })
-- Yank straight to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Paste from system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Paste to end of line from system clipboard' })
-- Duplicate line, putting the cursor at the right spot
vim.keymap.set('n', 'yp', [[mqyyp`qj]], { desc = 'Duplicate line' })
-- Select last change/paste. A save counts changing the entire file...
vim.keymap.set('n', 'gV', '`[v`]', { desc = 'Select last change' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Arrow keys for movement
vim.keymap.set('n', '<left>', 'h')
vim.keymap.set('n', '<right>', 'l')
-- Set vertical arrow keys to visual line movement (this takes
-- into account line wrapping). When jumping to a relative line,
-- add it to the jumplist. Also, use j/k instead of gj/gk as the
-- line count is off when jumping relative lines.
vim.keymap.set('n', '<up>', function()
  if vim.v.count > 1 then
    return "m'" .. vim.v.count .. 'k'
  else
    return 'gk'
  end
end, { expr = true })
vim.keymap.set('n', '<down>', function()
  if vim.v.count > 1 then
    return "m'" .. vim.v.count .. 'j'
  else
    return 'gj'
  end
end, { expr = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Walking through all windows is less useful than switching between
-- the two most recent
vim.keymap.set('n', '<C-w><C-w>', '<C-w><C-p>')
vim.keymap.set('n', '<C-w><C-p>', '<C-w><C-w>')

-- Keybindings for changing tabs
vim.keymap.set('n', '<C-,>', 'gT', { desc = 'Move to the prev tab' })
vim.keymap.set('n', '<C-.>', 'gt', { desc = 'Move to the next tab' })

-- Scroll faster
vim.keymap.set('n', '<C-e>', '7<C-e>')
vim.keymap.set('n', '<C-y>', '7<C-y>')
