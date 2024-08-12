# LuaLayout, by Synnwave

For Mirin Template 5.

This plugin allows you to create actors in Lua like you would in Stepmania 5.

This plugin is very useful when you need to create a lot of actors, you can use for loops in cases like these!

## Setup

### The setup for this plugin works differently compared to the other mirin template plugins, please follow these steps carefully

Drag and drop the plugin into your `plugins` folder.
If you don't have a plugin folder, create one.

Create a new file under your `lua` folder and name it `layout.lua`.

In `lua/layout.xml`, add the following line to make this plugin work:

```xml
<Layer File = "../plugins/luaLayout" />
```

If you don't plan on editing `layout.xml`, you can make the whole file just that one line.

## Usage

### Creating an Actor

To create an actor, there are two methods to do so.
Choose the one you like the best!

1. Def Table (SM5-Like, this will be used for the examples)

    ```lua
    Def.ActorProxy { Name = 'PP[1]' }   
    ```

2. CreateActor

    ```lua
    CreateActor 'ActorProxy' { Name = 'PP[1]' }
    ```

### Actor Children

To add a child to a ActorFrame there are two methods to do so.

(sorry if these examples aren't clear, i couldn't think of a better way to explain this)

1. Creating the actor directly inside the table

    ```lua
    Def.ActorFrame { 
        Name = 'holder',
        Def.Actor { Name = 'child1' },
        Def.Actor { Name = 'child2' },
        Def.Actor { Name = 'child3' },
    }   
    ```

2. Using `:appendChild()`

    ```lua
    local holder = Def.ActorFrame { Name = 'holder' }   
    holder:appendChild(Def.Actor { Name = 'child1' })
    holder:appendChild(Def.Actor { Name = 'child2' })
    holder:appendChild(Def.Actor { Name = 'child3' })
    ```

## Usage Examples

### Example 1 - Recursive AFT

(in your `lua/layout.lua` script)

```lua
RecursiveSprite = Def.Sprite { InitCommand = sprite } -- you can assign actors to variables! (you can also use 'Name=' aswell, use whatever one you like!)
RecursiveSprite:diffusealpha(0.5) -- you can call setter functions in this script! (note: please read the Notes/Drawbacks of this plugin)
RecursiveSprite:zoom(1.1)
RecursiveAFT = Def.ActorFrameTexture { InitCommand = aft }
```

(in your `lua/mods.lua` script)

```lua
RecursiveSprite:SetTexture(RecursiveAFT:GetTexture())
```

### Example 2 - Player, Combo & Judgment Proxies

(in your `lua/layout.lua` script)

```lua
for player = 1, 2 do -- change 2 to the amount of player proxies you would like to create
    Def.ActorProxy { Name = string.format('PP[%s]', player) }
    if player <= 2 then -- we only need to create combo & judgment proxies for players 1 and 2
        Def.ActorProxy { Name = string.format('PC[%s]', player) }
        Def.ActorProxy { Name = string.format('PJ[%s]', player) }
    end
end
```

## Notes / Drawbacks

* Actors have to be created in `lua/layout.lua` and cannot be created in `lua/mods.lua` or anywhere else.

    This is because your mods script gets loaded right before the song starts, and actors cannot be created at that time.

* Actor setter functions (eg. diffuse, xy, ...) can be called in your `layout.lua` script and will be ran once the actor has been created, but getter functions (eg. GetTexture, GetShader, ...) can not be called.

    It is recommended to call functions in your `mods.lua` script instead, or by using InitCommand when defining your actor.

* ActorScrollers aren't supported because they do not run Lua functions for configuration at all.

    (there is also no way to set configurations for ActorScrollers in Lua, sadly..)

* If you encounter any issues or weird behaviour when using this plugin, or just have any questions please let me know!!
