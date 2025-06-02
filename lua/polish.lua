-- Do not preserve comments with `o` action in normal mode
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = [[set fo-=o]],
})

-- Optimization for *.txt and *.csv files
vim.g.Illuminate_ftblacklist = { "txt", "csv" }
