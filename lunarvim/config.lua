-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.which_key.mappings['<Tab>'] = ':bnext<CR>'
lvim.builtin.which_key.mappings['<S-Tab>'] = ':bprevious<CR>'


-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed =  "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end


lvim.lang.python.formatters = {
  {
    exe = "black",
  },
  {
    exe = "isort",
    args = {"-w 2"}
  },
}
-- set an additional linter
lvim.lang.python.linters = {
  {
    exe = "flake8",
    args = {}
  }
}

lvim.plugins = {
  {"vim-test/vim-test"}, 
}

vim.cmd([[
  nmap <silent> t<C-n> :TestNearest<CR>
  nmap <silent> t<C-f> :TestFile<CR>
  nmap <silent> t<C-s> :TestSuite<CR>
  nmap <silent> t<C-l> :TestLast<CR>
  nmap <silent> t<C-g> :TestVisit<CR>
]])

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
}
