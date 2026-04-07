local flash = require("flash")

flash.setup({
    modes = {
        char = {
            enabled = false, -- superseded by the below config
        },
        search = {
            enabled = false, -- I like my normal search (at least for now)
        }
    }
})

-- Setup labels when moving
local config = require("flash.config")
local char = require("flash.plugins.char")
for _, motion in ipairs({ "t", "T" }) do
  vim.keymap.set({ "n", "x", "o" }, motion, function()
    flash.jump(config.get({
      mode = "char",
      search = {
        mode = char.mode(motion),
        max_length = 1,
      },
    }, char.motions[motion]))
  end)
end

-- Default "jump"
vim.keymap.set({ "n", "x", "o" }, "f", function()
    flash.jump()
end, { noremap = true, silent = true });

-- Enables treesitter selection
vim.keymap.set("n", "<leader>s", function()
    flash.treesitter()
end, { noremap = true, silent = true });
