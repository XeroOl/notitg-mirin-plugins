# rand
This plugin adds various methods for generating seeded random numbers.

```lua
rand.bool()
rand.bool(chance)
rand.float()
rand.float(max)
rand.float(min, max)
rand.int(max)
rand.int(min, max)
rand.int(min, max, step)
```
Generates a random number of the specified type.
`rand.bool` will output a `true` or `false` value. By default it will have a 50%, or 0.5, chance of being true, but can take an optional `chance` arg if it needs to have a different chance.
`rand.float` will output a number between `0.0` and `1.0`. It can take in different arguments if a different range of numbers is needed.
`rand.int` will output a number between `min` and `max` (inclusive). If only one argument is given, `min` will default to `1`. If a `step` value is provided, then the output will be an integer number of steps away from `min`.

### Example:
```lua
print(rand.bool(0.75)) -- 75% chance of true
print(rand.float()) -- a number between 0.0 and 1.0
print(rand.float(0, scx)) -- a number between 0.0 and scx

print(rand.int(10)) -- a number between 1 and 10
print(rand.int(5, 10, 0.5)) -- a multiple of 0.5 between 5 and 10, (inclusive)
```

## `rand.setseed`
```lua
rand.setseed(number)
```
Sets the seed to a specific value. If you don't like the numbers you're getting from the `rand` plugin, you can set the seed to a different number to "reroll" and get different values.