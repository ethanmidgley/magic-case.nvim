# Magic Case

**MagicCase** temporarily remaps the space key to insert a delimiter of your choice, for example `_`, so you can type `snake_case` or `kebab-case` without reaching for the delimiter key.

## Installation

Install the plugin with your preferred package manager:

### lazy.nvim

```lua
{
  "ethanmidgley/magic-case.nvim",
}
```

## Usage

1. Run `:MagicCase` (or call `require("magic-case").start()`)
2. Press the character you want to use as the delimiter, for example `_`. You'll be put into insert mode automatically
3. Type normally, for example `my variable name` becomes `my_variable_name`
4. Press the delimiter again to stop **MagicCase** and stay in insert mode, or press `<Esc>` to stop it and return to normal mode

## Keybinding (optional)

**MagicCase** doesn't set any keymaps by default. To start it from insert mode, add a `config` function to your plugin spec as shown below:

```lua
{
  "ethanmidgley/magic-case.nvim",
  config = function()
    vim.keymap.set("i", "<C-g>m", require("magic-case").start, { desc = "Start MagicCase" })
  end
}
```

Change `<C-g>m` to whatever suits you.
