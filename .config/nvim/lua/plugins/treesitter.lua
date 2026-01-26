return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require('nvim-treesitter').install({ 'typescript', 'tsx', 'javascript', 'html', 'css', 'lua' })
  end,
}
