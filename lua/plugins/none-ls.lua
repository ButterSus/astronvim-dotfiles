local null_ls = require "null-ls"

vim.api.nvim_create_autocmd("Filetype", {
  pattern = { "systemverilog", "verilog" },
  callback = function()
    -- buffer-local tab settings for SystemVerilog
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})

return {
  "nvimtools/none-ls.nvim",
  opts = {
    sources = {
      null_ls.builtins.formatting.verible_verilog_format.with {
        extra_args = {
          "--port_declarations_right_align_packed_dimensions=true",
          "--port_declarations_right_align_unpacked_dimensions=true",
          "--port_declarations_alignment=align",
          "--port_declarations_indentation=indent",
          "--named_port_alignment=align",
          "--named_port_indentation=indent",
          "--named_parameter_alignment=align",
          "--named_parameter_indentation=indent",
          "--indentation_spaces=4",
          "--wrap_end_else_clauses=true",
        },
      },
    },
  },
}
