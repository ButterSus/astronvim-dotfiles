local gitUrlFormatter = {}

function gitUrlFormatter:format(plugin_name)
  -- My custom forks
  if plugin_name == "AstroNvim/astrocommunity" then return "https://github.com/ButterSus/astrocommunity.git" end
  if plugin_name == "AstroNvim/astrocore" then return "https://github.com/ButterSus/astrocore.git" end

  -- Default behavior
  return ("https://github.com/%s.git"):format(plugin_name)
end

require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    version = "^5", -- Remove version tracking to elect for nightly AstroNvim
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
      update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
    },
  },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {

  -- Override urls to custom ones
  git = {
    url_format = gitUrlFormatter,
  },

  -- Configure any other `lazy.nvim` configuration options here
  install = { colorscheme = { "astrotheme", "habamax", "gruvbox" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
