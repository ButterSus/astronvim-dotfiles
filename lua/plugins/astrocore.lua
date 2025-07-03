---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Automatically Restore Previous Session
    autocmds = {
      restore_session = {
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true, -- trigger other autocommands as buffers open
          callback = function()
            local cwd = vim.fn.getcwd()

            local plugin = require("lazy.core.config").spec.plugins["astrocore"]
            local opts = require("lazy.core.plugin").values(plugin, "opts", false)
            local dirs = opts.sessions.ignore.dirs

            local ignored = false
            for _, dir in ipairs(dirs) do
              if cwd == dir then
                ignored = true
                break
              end
            end

            -- Only load the session if nvim was started with no args
            -- and we are not running inside the VSCode extension
            -- Also don't load ignored directories
            if vim.fn.argc(-1) == 0 and not vim.g.vscode and not ignored then
              -- try to load a directory session using the current working directory
              require("resession").load(cwd, { dir = "dirsession", silence_errors = true })
            end
          end,
        },
      },
    },
    -- Configuration table of session options for AstroNvim's session management powered by Resession
    sessions = {
      -- Configure auto saving
      autosave = {
        last = true, -- auto save last session
        cwd = true, -- auto save session for each working directory
      },
      -- Patterns to ignore when saving sessions
      ignore = {
        dirs = { vim.fn.expand "~" }, -- working directories to ignore sessions in
        filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
        buftypes = {}, -- buffer types to ignore sessions
      },
    },
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true,
      notifications = true,
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      -- extension = {
      --   foo = "fooscript",
      -- },
      extension = {
        mdx = "markdown",
      },
      -- filename = {
      --   [".foorc"] = "fooscript",
      -- },
      -- pattern = {
      --   [".*/etc/foo/.*"] = "fooscript",
      -- },
    },
    -- vim options can be configured here
    options = {
      opt = {
        winborder = "solid",
        signcolumn = "number",
        relativenumber = true,
        number = true,
        spell = false,
        wrap = not vim.g.vscode,
        conceallevel = 2,
      },
      g = {},
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        -- Navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- ["<Leader>c"] = {
        --   function()
        --     -- Standard buffer close for non-last buffer
        --     require("astrocore.buffer").close(0)
        --   end,
        --   desc = "Close buffer",
        -- },
      },
    },
  },
}
