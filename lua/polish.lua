vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = [[set fo-=o]],
})
