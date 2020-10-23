# log

Proper logging can help prevent countless hours of debugging.
This plugin provides basic logging functionality.

## Logging functions

```lua
log.trace(...)
log.debug(...)
log.info(...)
log.warn(...)
log.error(...)
log.fatal(...)
```

These functions write a message to the game's console.
During gameplay, all but `log.error` and `log.fatal` are disabled by default.
These functions behave similarly to `print`, but come with a header.

### Example:
```lua
log.trace('Hello world')

log.warn('Uh oh, the value of x is ', 1)

log.fatal('Something is horribly wrong')

log.debug('foo')

log.trace()

log.info('here')
```

These examples above show some potential uses of the logging functions.

## Setting the logging level

```lua
-- log.level.trace
-- log.level.debug
-- log.level.info
-- log.level.warn
-- log.level.error
-- log.level.fatal
-- log.level.all
-- log.level.off
log.set(level)
log.seteditor(level)
log.setgameplay(level)
```

The logging level can be set with `log.set`. Any logs that are less important
than the logging level are discarded. `log.seteditor` works just like `log.set`,
but only works in the editor. Likewise, `log.setgameplay` sets the logging level
only in gameplay.

### Example

```lua
-- logs completely off in gameplay
log.setgameplay(log.level.off)

-- ignore any trace and debug logs:
log.set(log.level.info)
```

## Additional formatting

```lua
log.format = '[%f %L]'
```

The `log.format` string can be overwritten to change how log messages appear.
The following codes can be used:

* `%b` Song beat
* `%t` Song time
* `%l` logging level
* `%L` logging level, uppercase
* `%f` filename and line number
* `%F` full file path and line number
