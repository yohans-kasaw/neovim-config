local neocodeium = require("neocodeium")
-- cycle through completions
vim.keymap.set("i", "<A-n>", function () neocodeium.cycle(1) end)
vim.keymap.set("i", "<A-p>", function () neocodeium.cycle(-1) end)


