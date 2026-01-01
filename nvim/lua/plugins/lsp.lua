return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "terraformls", "groovyls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Using the new vim.lsp.config API (nvim 0.11+)
      vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        capabilities = capabilities,
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
      }

      vim.lsp.config.ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = capabilities,
        root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
      }

      vim.lsp.config.terraformls = {
        cmd = { "terraform-ls", "serve" },
        capabilities = capabilities,
        root_markers = { ".terraform", "*.tf" },
      }

      vim.lsp.config.pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        capabilities = capabilities,
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
        on_new_config = function(config, root_dir)
          local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
          if string.len(env) > 0 then
            -- print the python binary path
            print('Using python from poetry: ' .. env)
            config.settings = config.settings or {}
            config.settings.python = config.settings.python or {}
            config.settings.python.pythonPath = env .. '/bin/python'
          end
        end,
      }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
