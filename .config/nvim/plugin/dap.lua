vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
  { src = "https://github.com/mfussenegger/nvim-dap-python" },
  { src = "https://github.com/leoluz/nvim-dap-go" },
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

require("dap-python").setup("python3")
require("dap-go").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Conditional breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step into" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Debug: Step out" })
vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug: Restart" })
vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: Terminate" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
vim.keymap.set({ "n", "v" }, "<leader>de", dapui.eval, { desc = "Debug: Evaluate expression" })
