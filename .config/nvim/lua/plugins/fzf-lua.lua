return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      '<leader>ff',
      function() require('fzf-lua').files() end,
      desc = 'Find Files'
    },
    {
      '<leader>fg',
      function() require('fzf-lua').live_grep() end,
      desc = 'Find Grep'
    },
    {
      '<leader>fc',
      function() require('fzf-lua').files({ cwd = vim.fn.stdpath("config") }) end,
      desc = 'Find Neovim Config'
    },
    {
      '<leader>fb',
      function() require('fzf-lua').buffers() end,
      desc = 'Find Buffers'
    },
    {
      '<leader>fh',
      function() require('fzf-lua').oldfiles() end,
      desc = 'Find History'
    },
    {
      '<leader>fr',
      function() require('fzf-lua').resume() end,
      desc = 'Resume Last Search'
    },
    {
      '<leader>fw',
      function() require('fzf-lua').grep_cword() end,
      desc = 'Find Word Under Cursor'
    },
    {
      '<leader>fd',
      function() require('fzf-lua').diagnostics_document() end,
      desc = 'Find Diagnostics'
    },
    {
      '<leader>fql',
      function() require('fzf-lua').quickfix() end,
      desc = 'Find Quickfix List'
    },
    {
      '<leader>fqs',
      function() require('fzf-lua').quickfix_stack() end,
      desc = 'Find Quickfix Stack'
    },
    {
      '<leader>gs',
      function() require('fzf-lua').git_status() end,
      desc = 'Git Status'
    },
    {
      '<leader>gr',
      function() require('fzf-lua').lsp_references() end,
      desc = 'Go to References'
    },
    {
      '<leader>gd',
      function() require('fzf-lua').lsp_definitions() end,
      desc = 'Go to Definitions'
    },
    {
      '<leader>gD',
      function() require('fzf-lua').lsp_declarations() end,
      desc = 'Go to Declarations'
    },
    {
      '<leader>gi',
      function() require('fzf-lua').lsp_implementations() end,
      desc = 'Go to Implementations'
    },
  }
}
