return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "dockerfile", "groovy", "json", "yaml", "markdown", "markdown_inline", "bash", "python", "typescript", "tsx", "css", "terraform" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

