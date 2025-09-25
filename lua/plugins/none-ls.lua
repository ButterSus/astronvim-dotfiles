local null_ls = require "null-ls"

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
