vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.scrolloff = 8
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.showcmd = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.mouse = ""

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable inlay hints when supported',
  group = vim.api.nvim_create_augroup('lsp-inlay-hints', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Organize imports in TypeScript files on save (typescript-tools.nvim)
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.ts', '*.tsx' },
  callback = function()
    local ok, api = pcall(require, 'typescript-tools.api')
    if ok then
      api.organize_imports(true)
      api.add_missing_imports(true)
    end
  end,
})
