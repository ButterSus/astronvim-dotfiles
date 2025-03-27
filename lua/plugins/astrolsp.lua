local verible_rules = {
  "parameter-name-style=parameter_style_regex:[a-z_][a-z0-9_]*",
  "parameter_style:ALL_CAPS",
  "localparam_style_regex:[a-z_][a-z0-9_]*",
  "localparam_style:",
  "+module-port",
  "-always-comb",
  "-explicit-parameter",
  "-storage-type",
  "-unpacked-dimensions-range-ordering",
  "-explicit-task-lifetime",
  "-module-filename",
}

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = true,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = { "systemverilog", "verilog" },
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {},
    ---@diagnostic disable: missing-fields
    config = {
      verible = {
        cmd = { "verible-verilog-ls", "--rules", table.concat(verible_rules, ";") },
      },
    },
    -- customize how language servers are attached
    handlers = {
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    },
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
    on_attach = function(_, _) end,
  },
}
