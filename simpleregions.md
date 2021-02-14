# SimpleRegions
#### Created by Sudospective
sometimes you only just need the whole thing gone
here is the thing to help you with those times

Features:
- 14 lines of code
- literally fits in a 5-pack of spearmint gum

Usage:
```lua
    region {beat, len, plr = pn or nil}
    --[[
        here we infer that pn means player number, as in
        the number of the player you want to hide the
        region for, or, if you don't want to hide a
        specific player, the keyword nil, which is a keyword
        that nullifies a variable which the mirin template
        internally recognizes as "a table of {1, 2}"
        (to be more specific, it determins between a table
        of {1, 2}, which is assigned to a variable called
        default_plr, or, which is gone into more in-depth
        below, what the user has specified for plr itself),
        which is both players, a shorthand for actually
        writing the table of {1, 2} yourself, and even further,
        an acceptable assignment of nothing at all, which will
        accept the previous value it has been set at (the case
        in which the template infers from a function known as
        get_plr() which players to consider), which
        could be anywhere from 1 player up to 8 players
        for NotITG and 2 players for SM5, and any possible
        combination of them

        beat is start and len is how long
    ]]--
```

To-Do:
- figure out how to make it 13 lines of code
- not support columns