return {
  {
    "AstroNvim/astrocommunity",

    -- Fetch fork first
    dependencies = { "ButterSus/astrocommunity", name = "astrocommunity-fork" },

    -- Override with fork
    dev = true,
    dir = vim.fn.stdpath "data" .. "/lazy/astrocommunity-fork",
  },
}
