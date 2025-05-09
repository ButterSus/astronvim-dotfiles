return {
  "nvim-focus/focus.nvim",
  version = false,
  config = function()
    require("focus").setup {
      enable = true, -- Enable module
      commands = true, -- Create Focus commands
      autoresize = {
        enable = true, -- Enable or disable auto-resizing of splits
        width = 0, -- Force width for the focused window
        height = 0, -- Force height for the focused window
        minwidth = 0, -- Force minimum width for the unfocused window
        minheight = 0, -- Force minimum height for the unfocused window
        height_quickfix = 10, -- Set the height of quickfix panel
      },
      split = {
        bufnew = false, -- Create blank buffer for new split windows
        tmux = false, -- Create tmux splits instead of neovim splits
      },
      ui = {
        number = false, -- Display line numbers in the focussed window only
        relativenumber = false, -- Display relative line numbers in the focussed window only
        hybridnumber = false, -- Display hybrid line numbers in the focussed window only
        absolutenumber_unfocussed = true, -- Preserve absolute numbers in the unfocussed windows
        cursorline = true, -- Display a cursorline in the focussed window only
        cursorcolumn = false, -- Display cursorcolumn in the focussed window only
        colorcolumn = {
          enable = false, -- Display colorcolumn in the foccused window only
          list = "+1", -- Set the comma-saperated list for the colorcolumn
        },
        signcolumn = false, -- Display signcolumn in the focussed window only
        winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
      },
    }

    local ignore_filetypes = { "help", "toggleterm", "qf" }
    local ignore_buftypes = { "nofile", "prompt", "popup", "nowrite", "terminal" }
    local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

    -- More robust way to disable focus for specific buffers, including terminals
    vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "TermOpen" }, {
      group = augroup,
      callback = function(args)
        local buf = args.buf
        if
          vim.tbl_contains(ignore_buftypes, vim.bo[buf].buftype)
          or vim.tbl_contains(ignore_filetypes, vim.bo[buf].filetype)
        then
          -- Disable focus for the window containing this buffer
          local wins = vim.fn.win_findbuf(buf)
          for _, win in ipairs(wins) do
            vim.w[win].focus_disable = true
          end
        end
      end,
      desc = "Disable focus for specific buffer types",
    })

    vim.api.nvim_create_autocmd("WinEnter", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then vim.b.focus_disable = true end
      end,
      desc = "Disable focus autoresize for BufType",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then vim.b.focus_disable = true end
      end,
      desc = "Disable focus autoresize for FileType",
    })
  end,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<leader>W"] = { desc = "󰼀 Focus" },
            ["<leader>Wa"] = { "<cmd>FocusAutoresize<CR>", desc = "Focus autoresize" },
            ["<leader>W="] = { "<cmd>FocusEqualise<CR>", desc = "Focus equalize" },
            ["<leader>Wm"] = { "<cmd>FocusMaximise<CR>", desc = "Focus maximise" },
            ["<leader>WM"] = { "<cmd>FocusMaxOrEqual<CR>", desc = "Focus max or equal" },
            ["<leader>uW"] = { "<cmd>FocusToggle<CR>", desc = "Focus toggle" },
          },
        },
      },
    },
  },
}
