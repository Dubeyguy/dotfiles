return {
  "Pocco81/auto-save.nvim",
  opts = {
    -- Set a delay (in ms) like VS Code's "afterDelay"
    -- The default is 135ms, which is very fast.
    -- 1000ms (1 second) is a more common and less aggressive value.
    debounce_delay = 1000,

    -- Disable the "File saved" message (can be annoying)
    execution_message = {
      enabled = true,
    },

    -- Set the events that trigger auto-save.
    -- "TextChanged" will save 1 second after you stop typing.
    -- "InsertLeave" will save when you exit insert mode.
    trigger_events = { "TextChanged", "InsertLeave" },
  },
}
