---@type LazySpec
return {
  -- Customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
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
      }
      return opts
    end,
  },

  -- Disable JK mapping
  { "max397574/better-escape.nvim", enabled = false },
}
