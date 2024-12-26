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
				ensure_installed = { "lua_ls", "ts_ls", "snyk_ls", "pyright", "terraformls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()


			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
      lspconfig.terraformls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_new_config = function(config, root_dir)
          local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
          if string.len(env) > 0 then
            config.settings.python.pythonPath = env .. '/bin/python'
          end
        end,
      })
			lspconfig.snyk_ls.setup({
				cmd = { "/usr/local/bin/snyk-ls" },
				root_dir = function(name)
					return lspconfig.util.find_git_ancestor(name) or vim.loop.os_homedir()
				end,
				init_options = {
					activateSnykCode = "true",
					enableTelemetry = "false",
          activateSnykIaC = "false",
					token = os.getenv("SNYK_TOKEN"),
					filterSeverity = {
						critical = true,
						high = true,
						medium = true,
						low = false,
					},
					organization = "ps-flow",
					enableSnykOpenBrowserActions = "false",
          enableTrustedFoldersFeature = "true", -- Whether LS will prompt to trust a folder (default: true)
          activateSnykCodeSecurity = "false", -- Enables Snyk Code Security reporting
          activateSnykCodeQuality = "false", -- Enable Snyk Code Quality issue reporting (Beta, only in IDEs and LS)
          scanningMode = "manual", -- Specifies the mode for scans: "auto" for background scans or "manual" for scans on command
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
