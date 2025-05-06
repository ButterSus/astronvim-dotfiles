-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Languages
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.verilog" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.hyprlang" },
  { import = "astrocommunity.pack.markdown" },
}
