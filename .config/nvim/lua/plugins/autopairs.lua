return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local npairs = require 'nvim-autopairs'

    npairs.setup {
      check_ts = true, -- Use treesitter for better pair detection
      ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
      },
      disable_filetype = { 'TelescopePrompt', 'vim' },
      disable_in_macro = false,
      disable_in_visualblock = false,
      disable_in_replace_mode = true,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
      enable_moveright = true,
      enable_afterquote = true,
      enable_check_bracket_line = true,
      enable_bracket_in_quote = true,
      enable_abbr = false,
      break_undo = true,
      map_cr = true,
      map_bs = true,
      map_c_h = false,
      map_c_w = false,
    }

    -- Custom keybindings to insert brackets without auto-closing
    -- Hold Ctrl while typing bracket to prevent auto-pairing
    vim.keymap.set('i', '<C-{>', '{', { desc = 'Insert { without autopair' })
    vim.keymap.set('i', '<C-}>', '}', { desc = 'Insert } without autopair' })
    vim.keymap.set('i', '<C-(>', '(', { desc = 'Insert ( without autopair' })
    vim.keymap.set('i', '<C-)>', ')', { desc = 'Insert ) without autopair' })
    vim.keymap.set('i', '<C-]>', ']', { desc = 'Insert ] without autopair' })
    vim.keymap.set('i', '<C-">', '"', { desc = 'Insert " without autopair' })
    vim.keymap.set('i', "<C-'>", "'", { desc = "Insert ' without autopair" })
    vim.keymap.set('i', '<C-`>', '`', { desc = 'Insert ` without autopair' })
  end,
}
