return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,

  opts = {
    flavour = "mocha",
    integrations = {
      lualine = true
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = { "italic" },
      keywords = { "italic" },
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
