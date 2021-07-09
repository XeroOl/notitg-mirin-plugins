# LimitAft

A plugin for limiting the refresh rate of AFTs,
to make them consistent across variable frame rates.

---

## Documentation

###### Globals
```lua
-- Takes in an AFT and converts it into a LimitAft Object
LimitAft(AFT) --> LimitAft
```
###### LimitAft Methods
```lua
-- Toggles the auto updating of the AFT's texture
AutoUpdate(boolean) --> Void
-- Returns the current state of `AutoUpadate`
GetAutoUpdate() --> boolean
-- Sets the `AutoUpdate` rate of the AFT's texture, minimum value of 1 FPS
SetFPS(float) --> Void
-- Returns the current FPS of the AFT
GetFPS() --> float
-- Forces the AFT to update its texture
update() --> Void
```

---

## Plugin User Guide

The `LimitAft` table is the constructor for adding LimitAFT methods to a pre-existing AFT.
To use it simply call `LimitAft` as a function with the AFT as input.
```lua
-- This is all you need to make `MyAft` limited
LimitAft(MyAft)
```
`MyAft` is now an AFT with limited update rate,
by default it will auto update at 60 fps but this can be changed via the `SetFPS` method.
The `SetFPS` method and other custom methods can be called just like other standard actor methods.
```lua
-- This will set `MyAft` to only update 30 times per second
MyAft:SetFPS(30)
```
That is all you need to know to use the basic functionality of this plugin.
This plugin's other main feature is the ability to manually update the AFT using a method call.
Typically you'll want to turn auto updating off via the `AutoUpdate` method,
then you can manually tell it to update whenever you want using the `update` method.
```lua
-- This function disables auto updating on `MyAft` at beat 0
func{0,function()
	MyAft:AutoUpdate(false)
}
-- This will manually update `MyAft` on beats 1, 2, 3, and 4
for i = 1,4 do
	func{i,function()
		MyAft:update()
	end}
end
-- This function re-enables auto updating on `MyAft` at beat 5
func{5,function()
	MyAft:AutoUpdate(true)
end}
```
Note: if the AFT is hidden it will never update it's texture no matter what.
There are also two debug methods to aid with debugging code,`GetFPS` and `GetAutoUpdate`,
these methods return the current FPS of the ActorFrameTexture and weither AutoUpdate is enabled or not.
Finally, here is a complete example of how one might use everything in this plugin.
```lua
-- Limit `MyAft`
LimitAft(MyAft)
-- Do the default sprite setup on `MySprite`
sprite(MySprite)
-- Tell the sprite which AFT to get its texture from
MySprite:SetTexture(MyAft:GetTexture())
-- Set FPS to 30
MyAft:SetFPS(30)
-- Disable auto updating on beat 12
func{12,function()
	MyAft:AutoUpdate(false)
end}
-- Manually update the AFT from beats 12 to 24 (inclusive) every 0.5 beats
for i = 12,24,0.5 do
	func{i,function()
		MyAft:update()
	end}
end
-- Re-enable auto updating on beat 24
func{24,function()
	MyAft:AutoUpate(true)
end}
```