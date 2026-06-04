return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      backdrop = 1,
      width = 120,
    },
  },
  keys = {
    { '<leader>xz', '<cmd>ZenMode<cr>', desc = 'Toggle [Z]en Mode' },
  },
}
