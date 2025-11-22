-- [[ Tailwind CSS Tools ]]
-- Provides Tailwind CSS integration and tooling
-- See: https://github.com/luckasRanarison/tailwind-tools.nvim

return {
  'luckasRanarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
    'neovim/nvim-lspconfig', -- optional
  },
  opts = {
    -- Disable automatic LSP setup to avoid deprecation warnings
    -- (configure tailwindcss-language-server in your lsp.lua instead)
    server = {
      override = false, -- Don't override existing LSP setup
    },
  },
  config = function(_, opts)
    require('tailwind-tools').setup(opts)
  end,
}
