-- Editing
-- -------
-- Better indenting in visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move text vertical
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Make 'delete to end of paragraph' behave more logical
vim.keymap.set('n', 'd}', '^d}')
vim.keymap.set('n', 'd{', 'gj^d{O<esc>gj')

-- Registers
-- ---------
-- Delete without replacing yank register
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without replacing yank register' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without replacing yank register' })

-- Yank entire file
vim.keymap.set('n', 'gy', function()
  vim.cmd ':%y'
end)

-- Paste register, starting with a newline. This is useful for when a register
-- contains a yank without newlines.
vim.keymap.set('n', 'gp', function()
  vim.cmd(':put ' .. vim.v.register)
end)
vim.keymap.set('n', 'gP', function()
  vim.cmd(':-1put ' .. vim.v.register)
end)

-- Duplicate line, putting the cursor at the right spot
vim.keymap.set('n', 'yp', [[mqyyp`qj]], { desc = 'Duplicate line' })
vim.keymap.set('v', 'yp', [[y'>p]], { desc = 'Duplicate selection' })

-- Select last change/paste. A save counts changing the entire file...
vim.keymap.set('n', 'gV', '`[v`]', { desc = 'Select last change' })

-- Navigation
-- ----------
-- Arrow keys for movement
vim.keymap.set('n', '<left>', 'h')
vim.keymap.set('n', '<right>', 'l')
-- Set vertical arrow keys to visual line movement (this takes into account
-- line wrapping). When jumping to a relative line, add it to the jumplist.
-- Also, use j/k instead of gj/gk as the line count is off when jumping
-- relative lines.
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
vim.keymap.set('n', 'n', 'nzv')
vim.keymap.set('n', 'N', 'Nzv')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-S-h>', '<C-w><S-h>', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w><S-l>', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w><S-j>', { desc = 'Move window down' })
vim.keymap.set('n', '<C-S-k>', '<C-w><S-k>', { desc = 'Move window up' })
-- And the arrow keys as well.
vim.keymap.set('n', '<C-left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-S-left>', '<C-w><S-h>', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-right>', '<C-w><S-l>', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-down>', '<C-w><S-j>', { desc = 'Move window down' })
vim.keymap.set('n', '<C-S-up>', '<C-w><S-k>', { desc = 'Move window up' })

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
vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', function()
  vim.diagnostic.setqflist { severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Open diagnostic [Q]uickfix list' })

-- Misc
-- ----
vim.keymap.set('n', 'ZA', '<cmd>qa<cr>')

-- Clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Reveal file in finder
vim.keymap.set('n', '<leader>rf', '<cmd>silent !open -R %<CR>', { desc = 'Reveal in [F]inder' })

-- Set the current working directory of the active window, based on
-- the currently displayed buffer
vim.keymap.set('n', '<leader>cd', function()
  local cur_filename = vim.api.nvim_buf_get_name(0)
  if cur_filename == nil or cur_filename == '' then
    return
  end

  local cur_directory = vim.fs.dirname(cur_filename)
  vim.fn.chdir(cur_directory)
end, { desc = 'Set [C]urrent [D]irectory' })

vim.keymap.set('n', '<leader>cw', function()
  local ft = vim.bo.filetype
  -- `read ++edit` makes read do automatic detection of file encodings, file
  -- formats, and modelines.
  vim.cmd('vnew | setlocal buftype=nofile | setlocal filetype=' .. ft .. ' | read ++edit # | 0d_ | diffthis | wincmd p | diffthis')
end, { desc = '[C]lone [W]indow in diff mode' })

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
