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
        ensure_installed = {
          "lua_ls",
          "eslint",
          "jsonls",
          "yamlls",
          "terraformls",
          "groovyls",
        },
      })
    end,
  },
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/schemastore.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        capabilities = capabilities,
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
      }

      vim.lsp.config.eslint = {
        cmd = { "vscode-eslint-language-server", "--stdio" },
        capabilities = capabilities,
        filetypes = {
          "javascript", "javascriptreact", "javascript.jsx",
          "typescript", "typescriptreact", "typescript.tsx",
          "vue", "svelte", "astro",
        },
        root_markers = {
          ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.mjs",
          ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml",
          "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs", "eslint.config.ts",
          "package.json",
        },
        settings = {
          workingDirectories = { mode = "auto" },
          format = true,
        },
      }

      vim.lsp.config.jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" },
        capabilities = capabilities,
        root_markers = { ".git", "package.json" },
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      }

      vim.lsp.config.yamlls = {
        cmd = { "yaml-language-server", "--stdio" },
        capabilities = capabilities,
        root_markers = { ".git" },
        settings = {
          yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      }

      vim.lsp.config.terraformls = {
        cmd = { "terraform-ls", "serve" },
        capabilities = capabilities,
        root_markers = { ".terraform", "*.tf" },
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.js", "*.jsx", "*.mjs", "*.cjs", "*.ts", "*.tsx" },
        command = "silent! EslintFixAll",
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition({
          on_list = function(options)
            local seen, unique = {}, {}
            for _, item in ipairs(options.items or {}) do
              local key = string.format("%s:%d:%d", item.filename or "", item.lnum or 0, item.col or 0)
              if not seen[key] then
                seen[key] = true
                table.insert(unique, item)
              end
            end
            if #unique == 0 then
              vim.notify("No definition found", vim.log.levels.INFO)
              return
            end
            if #unique == 1 then
              local item = unique[1]
              vim.cmd("edit " .. vim.fn.fnameescape(item.filename))
              pcall(vim.api.nvim_win_set_cursor, 0, { item.lnum, math.max((item.col or 1) - 1, 0) })
              return
            end
            vim.fn.setqflist({}, " ", { title = options.title, items = unique, context = options.context })
            vim.cmd("botright copen")
          end,
        })
      end, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
    end,
  },
}
