require "nvchad.autocmds"

-- Limpar arquivos swap antigos ao iniciar
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local swap_dir = vim.fn.stdpath("state") .. "/swap"
    -- Remove swap files mais antigos que 1 dia
    vim.fn.system(string.format("find %s -name '*.sw*' -mtime +1 -delete 2>/dev/null", swap_dir))
  end,
  desc = "Clean old swap files on startup"
})

-- Auto organize imports ao salvar arquivos Go
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    -- Organiza imports automaticamente
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" } },
      apply = true,
    })
  end,
  desc = "Auto organize imports on save for Go files"
})
