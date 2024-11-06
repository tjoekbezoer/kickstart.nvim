return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      backdrop = 1,
      width = 150,
    },
  },
  keys = {
    { '<leader>x', '<cmd>ZenMode<cr>', desc = 'Toggle [Z]en Mode' },
  },
}
