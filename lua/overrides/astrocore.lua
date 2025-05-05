return {
  {
    "AstroNvim/astrocore",

    -- Fetch fork first
    dependencies = { "ButterSus/astrocore", name = "astrocore-fork" },

    -- Override with fork
    dev = true,
    dir = vim.fn.stdpath "data" .. "/lazy/astrocore-fork",
  },
}
