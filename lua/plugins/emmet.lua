return {
  'olrtg/nvim-emmet',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  config = function()
    vim.keymap.set({ 'n', 'v' }, 'yt', require('nvim-emmet').wrap_with_abbreviation)
  end,
}
