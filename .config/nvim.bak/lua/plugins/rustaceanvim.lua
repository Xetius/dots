return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {
        hover_actions = {
          replace_builtin_hover = true,
        },
      },
      -- LSP configuration
      server = {
        on_attach = function(client, bufnr)
          -- Rust-specific keymaps
          local opts = { buffer = bufnr, silent = true }

          -- Hover and documentation
          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, vim.tbl_extend("force", opts, { desc = "Rust Hover Actions" }))

          -- Code actions
          vim.keymap.set("n", "<leader>ca", function()
            vim.cmd.RustLsp("codeAction")
          end, vim.tbl_extend("force", opts, { desc = "Rust Code Action" }))

          -- Runnables
          vim.keymap.set("n", "<leader>rr", function()
            vim.cmd.RustLsp("runnables")
          end, vim.tbl_extend("force", opts, { desc = "Rust Runnables" }))
          vim.keymap.set("n", "<leader>rl", function()
            vim.cmd.RustLsp({ "runnables", bang = true })
          end, vim.tbl_extend("force", opts, { desc = "Rust Run Last" }))

          -- Debuggables
          vim.keymap.set("n", "<leader>rd", function()
            vim.cmd.RustLsp("debuggables")
          end, vim.tbl_extend("force", opts, { desc = "Rust Debuggables" }))
          vim.keymap.set("n", "<leader>rD", function()
            vim.cmd.RustLsp({ "debuggables", bang = true })
          end, vim.tbl_extend("force", opts, { desc = "Rust Debug Last" }))

          -- Testables
          vim.keymap.set("n", "<leader>rt", function()
            vim.cmd.RustLsp("testables")
          end, vim.tbl_extend("force", opts, { desc = "Rust Testables" }))
          vim.keymap.set("n", "<leader>rT", function()
            vim.cmd.RustLsp({ "testables", bang = true })
          end, vim.tbl_extend("force", opts, { desc = "Rust Test Last" }))

          -- Expand macro
          vim.keymap.set("n", "<leader>rm", function()
            vim.cmd.RustLsp("expandMacro")
          end, vim.tbl_extend("force", opts, { desc = "Rust Expand Macro" }))

          -- Open Cargo.toml
          vim.keymap.set("n", "<leader>rc", function()
            vim.cmd.RustLsp("openCargo")
          end, vim.tbl_extend("force", opts, { desc = "Open Cargo.toml" }))

          -- Parent module
          vim.keymap.set("n", "<leader>rp", function()
            vim.cmd.RustLsp("parentModule")
          end, vim.tbl_extend("force", opts, { desc = "Rust Parent Module" }))

          -- Join lines (Rust-aware)
          vim.keymap.set("n", "J", function()
            vim.cmd.RustLsp("joinLines")
          end, vim.tbl_extend("force", opts, { desc = "Rust Join Lines" }))

          -- Explain error
          vim.keymap.set("n", "<leader>re", function()
            vim.cmd.RustLsp("explainError")
          end, vim.tbl_extend("force", opts, { desc = "Rust Explain Error" }))

          -- Render diagnostics
          vim.keymap.set("n", "<leader>rE", function()
            vim.cmd.RustLsp("renderDiagnostic")
          end, vim.tbl_extend("force", opts, { desc = "Rust Render Diagnostic" }))

          -- Standard LSP keymaps
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
            vim.tbl_extend("force", opts, { desc = "Go to Declaration" }))
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
            vim.tbl_extend("force", opts, { desc = "Go to Implementation" }))
          vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to References" }))
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition,
            vim.tbl_extend("force", opts, { desc = "Type Definition" }))
          vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, vim.tbl_extend("force", opts, { desc = "Previous Diagnostic" }))
          vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            checkOnSave = true,
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            -- Disable separate flycheck progress to avoid duplicate fidget notifications
            workspace = {
              symbol = {
                search = {
                  kind = "all_symbols",
                },
              },
            },
            notifications = {
              cargoTomlNotFound = false,
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
            inlayHints = {
              bindingModeHints = { enable = true },
              closureCaptureHints = { enable = true },
              closureReturnTypeHints = { enable = "always" },
              lifetimeElisionHints = { enable = "always" },
              parameterHints = { enable = true },
              typeHints = { enable = true },
            },
          },
        },
      },
      -- DAP configuration
      dap = {
        adapter = {
          type = "server",
          port = "${port}",
          host = "127.0.0.1",
          executable = {
            command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
            args = { "--port", "${port}" },
          },
        },
      },
    }
  end,
}
