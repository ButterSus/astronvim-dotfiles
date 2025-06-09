return {
  {
    "folke/todo-comments.nvim",
    opts = {
      -- https://github.com/folke/todo-comments.nvim/issues/10#issuecomment-2446101986
      search = {
        pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]],
      },
      highlight = {
        pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
        multiline = false,
        after = "",
      },
    },
  },
}
