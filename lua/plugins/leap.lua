return {
  'ggandor/leap.nvim',
  config = function()
    -- local leap = require 'leap'
    -- leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
    -- leap.create_default_mappings()

    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')

    -- vim.api.nvim_set_hl(0, 'LeapBackdrop', {})
    -- vim.api.nvim_create_autocmd('OptionSet', {
    --   pattern = 'background',
    --   callback = function()
    --     vim.api.nvim_set_hl(0, 'LeapBackdrop', {})
    --   end,
    -- })

    -- vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'S', function()
    --   require('leap.remote').action()
    -- end)
    -- vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
  end,
}
