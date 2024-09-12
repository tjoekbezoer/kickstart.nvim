return {
  'folke/zen-mode.nvim',
  opts = {},
  config = function()
    vim.keymap.set('n', '<leader>x', '<cmd>ZenMode<cr>', { desc = 'Toggle [Z]en Mode' })
  end,
}
