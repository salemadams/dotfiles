-- [[ Colorscheme ]]
-- See `:help tokyodark.nvim`

return {
  'tiagovla/tokyodark.nvim',
  priority = 1000,
  config = function()
    require('tokyodark').setup {
      transparent_background = false,
      gamma = 1.00,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        identifiers = { italic = false },
        functions = {},
        variables = {},
      },
    }
    vim.cmd.colorscheme 'tokyodark'
  end,
}
