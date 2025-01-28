-- i: cycle input
-- o: cycle output
-- q: close picker
-- enter: insert/replace color
return {
  'uga-rosa/ccc.nvim',
  config = function()
    local ccc = require 'ccc'
    ccc.setup {
      -- convert = { { ccc.picker.hex, ccc.output.css_rgb }, { ccc.picker.css_rgb, ccc.output.css_hsl }, { ccc.picker.css_hsl, ccc.output.hex } },
      -- pickers = {
      --   ccc.picker.css_hsl,
      -- },
      -- inputs = { ccc.input.hsl },
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
      recognize = {
        -- output = true,
        -- pattern = {
        --   [ccc.picker.hex] = { ccc.input.hsl, ccc.output.hex },
        -- },
      },
      mappings = {
        ['<right>'] = ccc.mapping.increase1,
        ['<a-right>'] = ccc.mapping.increase5,
        ['<c-a-right>'] = ccc.mapping.increase10,
        ['<left>'] = ccc.mapping.decrease1,
        ['<a-left>'] = ccc.mapping.decrease5,
        ['<c-a-left>'] = ccc.mapping.decrease10,
      },
    }

    vim.keymap.set('n', '<leader>cc', '<cmd>CccPick<enter>')
  end,
}
