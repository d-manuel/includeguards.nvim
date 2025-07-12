This is a simple plugin that adds includeguards to a .h/.hpp file in C/C++ projects.

## Installation
### Lazy.nvim
```lua
{
	"includeguards.nvim",
	dev    = true,
	config = function()
		require("includeguards").setup({})
		vim.keymap.set("n", "<leader>hg", function() require("includeguards").addIncludeguards() end)
	end
}
```
