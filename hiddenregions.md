# hiddenregions

lets you add hidden regions to a player as a function

```lua
hide {beat, duration, [column] [plr]}
```
column and plr can be numbers or tables, similar to `ease`'s plr behavior

example:

```lua
	hide
	{0, 2, plr = 1, column = {0, 1, 2}}
	{2, 2, plr = 2, column = {0, 1, 2}}
```
