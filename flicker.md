# Flicker
#### Created by Sudospective
The flicker plugin will create flicker mods or sugarkill mods using specified percent, mode, and FPS values. It can also be player-specific if desired.

## Usage
```lua
-- Flicker
flicker {beat, len, perc1, perc2, mod, [fps = 60]}
-- Sugarkill
sugarkill {beat, len, [minstealth], [maxstealth], [mode = 'normal'], [fps = 60]}
```

## Flicker
To flicker drunk between 200 and -200 at 60 FPS at beat 32 for 4 beats, one can add to their code:
```lua
flicker {32, 4, 200, -200, 'drunk'}
```

Default value for FPS is 60. This can be changed by adding an `fps` value to the table.
```lua
-- This will flicker tipsy between 100 and 0 at 30 FPS at beat 4 for 2 beats.
flicker {4, 2, 100, 0, 'tipsy', fps = 30}
```

## Sugarkill
To activate a Sugarkill, all the necessary arguments needed are as follows:
```lua
-- This will activate a sugarkill mod similar to how it originally appeared in Sugarkill X.
sugarkill {16, 8}
```

Adding a third and fourth argument will give minimum stealth and maximum stealth, the maximum being the correct column positioning.
```lua
-- Sugarkill with a min of 95 stealth and a max of 75 stealth (lower values may help when AFTs are involved)
sugarkill {16, 8, 95, 75}
```

Along with FPS, you can also provide a `mode` value, which accepts `'confusion'` or `'normal'`. The default is `'normal'` to preserve the Sugarkill X default.
```lua
-- Stealth-default sugarkill at 30 FPS with confusion mode enabled.
sugarkill {16, 8, fps = 30, mode = 'confusion'}
```