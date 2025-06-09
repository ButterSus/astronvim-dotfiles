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
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.hyprlang" },
  { import = "astrocommunity.pack.markdown" },

  -- Markdown & Latex
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },

  -- Colorscheme
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.colorscheme.monokai-pro-nvim" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- File explorer
  { import = "astrocommunity.file-explorer.mini-files" },

  -- Git
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.gitgraph-nvim" },

  -- Keybinding
  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },

  -- LSP
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },

  -- Search
  { import = "astrocommunity.search.nvim-hlslens" },

  -- Motion
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.nvim-spider" },

  -- Terminal Integration
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },

  -- Completion
  { import = "astrocommunity.completion.codeium-nvim" },

  -- Editing support
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.bigfile-nvim" },
  { import = "astrocommunity.editing-support.multiple-cursors-nvim" },
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.vim-exchange" },

  -- Recipes
  { import = "astrocommunity.recipes.picker-nvchad-theme" },
  { import = "astrocommunity.recipes.cache-colorscheme" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.recipes.heirline-clock-statusline" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.recipes.neovide" },

  -- Diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- Code Runner
  { import = "astrocommunity.code-runner.overseer-nvim" },

  -- Media
  { import = "astrocommunity.media.img-clip-nvim" },
  { import = "astrocommunity.media.neocord-nvim" },
  { import = "astrocommunity.media.image-nvim" },
}
