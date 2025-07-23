-- Auto-reloading project configuration loader for Neovim
local M = {}

local CONFIG_FILE = ".nvim.lua"

-- Load project config from current directory
function M.load_config(show_output)
  local config_path = vim.fn.getcwd() .. "/" .. CONFIG_FILE

  if vim.fn.filereadable(config_path) ~= 1 then return false end

  local success, err = pcall(function() dofile(config_path) end)

  if success then
    -- Trigger linting on all open buffers after config reload
    vim.schedule(function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_get_option_value("buflisted", { buf = buf }) then
          vim.api.nvim_buf_call(buf, function() require("lint").try_lint() end)
        end
      end
    end)
    if show_output then vim.notify("Loaded config from: " .. config_path, vim.log.levels.INFO) end
    return true
  else
    vim.notify("Error loading config: " .. err, vim.log.levels.ERROR)
    return false
  end
end

-- Setup file watcher for automatic reloading
function M.setup_file_watcher()
  local config_path = vim.fn.getcwd() .. "/" .. CONFIG_FILE
  local group = vim.api.nvim_create_augroup("ProjectConfigWatcher", { clear = true })

  if vim.fn.filereadable(config_path) == 1 then
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = group, -- Associate with the augroup
      pattern = config_path,
      callback = function()
        vim.notify("Detected " .. CONFIG_FILE .. " change, reloading...", vim.log.levels.INFO)
        M.load_config(false)
      end,
      desc = "Auto-reload project config on file change",
    })
  end
end

function M.setup()
  -- Auto-load on directory change and startup
  vim.api.nvim_create_autocmd({ "DirChanged" }, {
    callback = function()
      M.load_config(true)
      M.setup_file_watcher()
    end,
  })

  -- Manual reload command
  vim.api.nvim_create_user_command(
    "ProjectLSP",
    function() M.load_config(true) end,
    { desc = "Reload project configuration" }
  )

  -- Load every time session is loaded
  if not vim.g.vscode then
    require("resession").add_hook("post_load", function()
      M.load_config(true)
      M.setup_file_watcher()
    end)
  else
    M.load_config(true)
    M.setup_file_watcher()
  end
end

return M
