# spellcards
This plugin adds support for adding spellcards to your modfile.

```lua
card {start, end, name, difficulty, color}
```
Adds a spellcard to the song.
The first two arguments specify the range of the spellcard.
The third argument specifies the name of the spellcard.
The fourth argument is a number that describes the difficulty of the spellcard.
The fifth argument is the color of the spellcard.

The color can be specified in two ways:
* an RGB/RGBA table from 0.0 to 1.0: ie `{1.0, 0.2, 0.0}`
* an RGB/RGBA hex color code: ie `'#FF3300'`

The `card` function is called with curly braces.