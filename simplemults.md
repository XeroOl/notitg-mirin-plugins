# SimpleMults
a plugin by sorae, i guess
this is a horrifying amalgamation of sudospective's SimpleRegions and oatmealine's hiddenregions plugins

adds simple shorthand for inserting SetNoteTypeMults calls in modfiles

# Usage
```lua
    notemult{beat, len, multiplier, plr = pn or nil}
	
	--[[
		beat: starting beat
		len: how many beats the SetNoteTypeMults region runs for
		multiplier: quantization color multiplier of the region
		players: takes in a number or a table, if nil or unspecified it'll apply to all players
	]]--
	
	-- example usage
	notemult{8, 16, 0.5, plr = 1} -- starting at beat 8, half all quantization colors for the next 16 beats on player 1
	notemult{4, 32, 2, plr = {1, 2}} -- starting at beat 4, double all quantization colors for the next 32 beats on players 1 and 2
```