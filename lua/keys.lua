-- Editing
-- -------
-- Better indenting in visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move Lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Registers
-- ---------
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

-- Navigation
-- ----------
-- Arrow keys for movement
vim.keymap.set('n', '<left>', 'h')
vim.keymap.set('n', '<right>', 'l')
-- Set vertical arrow keys to visual line movement (this takes
-- into account line wrapping). When jumping to a relative line,
-- add it to the jumplist. Also, use j/k instead of gj/gk as the
-- line count is off when jumping relative lines.
vim.keymap.set('n', '<up>', function()
  -- Only perform this trick when we're not in a quickfix list
  local isqf = vim.fn.getwininfo(vim.fn.win_getid())[1]['quickfix']

  if isqf == 1 then
    return 'k'
  elseif vim.v.count > 1 then
    return "m'" .. vim.v.count .. 'k'
  else
    return 'gk'
  end
end, { expr = true })
vim.keymap.set('n', '<down>', function()
  -- Only perform this trick when we're not in a quickfix list
  local isqf = vim.fn.getwininfo(vim.fn.win_getid())[1]['quickfix']

  if isqf == 1 then
    return 'j'
  elseif vim.v.count > 1 then
    return "m'" .. vim.v.count .. 'j'
  else
    return 'gj'
  end
end, { expr = true })

-- Cursor positioning corrections
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Logical inverse of <C-t> (move back in taglist) is <CA-t> to move forward in taglist
vim.keymap.set('n', '<CA-t>', '<cmd>ta<cr>', { desc = 'Move forward one tag' })

-- Walking through quikfix list items
vim.keymap.set('n', '<A-n>', '<cmd>cnext<cr>zz')
vim.keymap.set('n', '<A-e>', '<cmd>cprev<cr>zz')
-- Walking through quickfix list history
vim.keymap.set('n', '<CA-n>', '<cmd>cnewer<cr>')
vim.keymap.set('n', '<CA-e>', '<cmd>colder<cr>')

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

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Misc
-- ----
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

-- Quickfix delete
-- Set `dd` to delete a quickfix list item, but only set the
-- keymap when we are focused on the quickfix window itself.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  desc = 'Set keymappings for the quickfix list',
  callback = function()
    vim.keymap.set('n', 'dd', function()
      local qf = vim.fn.getqflist()
      local idx = vim.fn.line '.'

      table.remove(qf, idx)
      vim.fn.setqflist(qf, 'r')

      local win = vim.fn.win_getid()
      local newpos = math.min(#qf, idx)
      vim.api.nvim_win_set_cursor(win, { newpos, 0 })
    end, { buffer = true })
  end,
})

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
