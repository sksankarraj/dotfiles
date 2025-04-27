return {
  'rmagatti/auto-session',
  lazy = false,
  -- dependencies = {
  --   'nvim-telescope/telescope.nvim', -- Only needed if you want to use session lens
  -- },

  ---enables autocomplete for opts
  ---@module "auto-session"
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    auto_clean_after_session_restore = true,
    mappings = {
      -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
      delete_session = { "i", "<C-D>" },
      alternate_session = { "i", "<C-S>" },
    },
  }
}

