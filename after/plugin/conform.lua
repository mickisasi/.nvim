require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript  = { "prettier",},
    typescript  = { "prettier",},
    javascriptreact = { "prettier"},
    typescriptreact = { "prettier"},
    css = { "prettier"},
    html = { "prettier"},
    json = { "prettier"},
    go = { "goimports", "gofmt" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
