-- Simple project configuration loader for Neovim
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

function M.setup()
  -- Auto-load on directory change and startup
  vim.api.nvim_create_autocmd({ "DirChanged", "VimEnter" }, {
    callback = function()
      M.load_config(false) -- Silent loading
    end,
  })

  -- Manual reload command
  vim.api.nvim_create_user_command("ProjectLSP", function()
    M.load_config(true) -- With output
  end, { desc = "Reload project configuration" })

  -- Load initial config
  M.load_config(false)
end

return M
