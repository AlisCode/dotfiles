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
local Config = require("flash.config")
local Char = require("flash.plugins.char")
for _, motion in ipairs({ "f", "t", "F", "T" }) do
  vim.keymap.set({ "n", "x", "o" }, motion, function()
    flash.jump(Config.get({
      mode = "char",
      search = {
        mode = Char.mode(motion),
        max_length = 1,
      },
    }, Char.motions[motion]))
  end)
end

-- Enables treesitter selection
vim.keymap.set("n", "<leader>t", flash.treesitter, { noremap = true, silent = true });
