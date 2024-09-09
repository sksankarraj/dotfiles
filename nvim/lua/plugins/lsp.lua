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
				ensure_installed = { "lua_ls", "tsserver", "snyk_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.snyk_ls.setup({
				cmd = { "/usr/local/bin/snyk-ls" },
				root_dir = function(name)
					return lspconfig.util.find_git_ancestor(name) or vim.loop.os_homedir()
				end,
				init_options = {
					activateSnykCode = "true",
					enableTrustedFoldersFeature = "false", -- Disable folder trust
					enableTelemetry = "false",
					token = os.getenv("SNYK_TOKEN"),
					filterSeverity = {
						critical = true,
						high = true,
						medium = true,
						low = false,
					},
					organization = "",
					enableSnykOpenBrowserActions = "false",
					activateSnykCodeSecurity = "true",
					activateSnykCodeQuality = "true",
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
