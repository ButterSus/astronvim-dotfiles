-- Disable snacks in vscode
if vim.g.vscode then return {} end

local header = table.concat({
  "____________ _____   ___        ______ _____ _     ",
  "|  ___| ___ \\  __ \\ / _ \\       | ___ \\_   _| |    ",
  "| |_  | |_/ / |  \\// /_\\ \\______| |_/ / | | | |    ",
  "|  _| |  __/| | __ |  _  |______|    /  | | | |    ",
  "| |   | |   | |_\\ \\| | | |      | |\\ \\  | | | |____",
  "\\_|   \\_|    \\____/\\_| |_/      \\_| \\_| \\_/ \\_____/",
  " _____                       _ _                   ",
  "/  __ \\                     (_) |                  ",
  "| /  \\/ ___  _ __ ___  _ __  _| | ___ _ __ ___     ",
  "| |    / _ \\| '_ ` _ \\| '_ \\| | |/ _ \\ '__/ __|    ",
  "| \\__/\\ (_) | | | | | | |_) | | |  __/ |  \\__ \\    ",
  " \\____/\\___/|_| |_| |_| .__/|_|_|\\___|_|  |___/    ",
  "                      | |                          ",
  " _____          _     |_|      _     _          _  ",
  "|  ___|        | |            | |   | |        | | ",
  "| |__ _ __ ___ | |__   ___  __| | __| | ___  __| | ",
  "|  __| '_ ` _ \\| '_ \\ / _ \\/ _` |/ _` |/ _ \\/ _` | ",
  "| |__| | | | | | |_) |  __/ (_| | (_| |  __/ (_| | ",
  "\\____/_| |_| |_|_.__/ \\___|\\__,_|\\__,_|\\___|\\__,_| ",
}, "\n")

---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = header,
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      notifier = {
        style = "minimal",
      },
    },
  },
}
