return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot", -- or event = "InsertEnter" if you prefer
    event = "InsertEnter", -- or event = "InsertEnter" if you prefer
    config = function()
      require("copilot").setup({
      })
    end,
  },
}
