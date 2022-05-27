# Spline Helper
#### Made by ArbitraryRage


## Syntax:
Load spline helper plugin:
```lua
local spline=require('splinehelper')
```
## spline.set:

```lua 
spline.set{axis,offset,value,offset,value,...,col=-1,plr={1,2},speed=-1}
--or
spline.set{axis,{{offset,value},{offset,value},...},col=-1,plr={1,2},speed=-1}
```

## spline.reset:

Apparently spline resets with the column set to -1 don't work, you can have col set to -1 and it automatically converts to {0,1,2,3} in this case.
```lua
spline.reset{axis,col={0,1,2,3},plr={1,2}}
```

col, plr, and speed are optional, defaults are as you see them set here, unless plr is set outside of the call, in which case it uses whatever it was set to.

axis can be a table or a single value, if no axis is defined for reset, it resets all splines.

so for example:
```lua
--reset all splines on both players
spline.reset{}

--reset all splines on down column
spline.reset(col=1)

--reset x splines on player 1
spline.reset{'x',plr=1}

--reset x, y, and z splines on player 2
spline.reset{{'x','y','z'},plr=2}
```

Also, the case sensitivity for the axis doesn't matter as it corrects it in the code, so for example you don't have to type 'RotX', you can just type 'rotx', or even 'rOTx' if you want

There are also a couple aliases rotx, roty, rotz, and one other name for size

'rx/y/z' and 'rotationx/y/z' as axis point to RotX/Y/Z
'tiny' as axis points to Size

Use definemod, func, etc to ease splines, or set at a certain beat.
You can also just run it outside of a func to set default splines or reset all at the start (cause it seems like in editor splines sometimes don't get reset???)

speed = activation time

## func_ease example:
```lua
--ease from beat 0 to beat 4, point 0 at offset 0, easing to 200, point 1 at offset 200, easing to -150, and point 3 at 400, easing to -200, on player 1
func_ease{0,4,inQuad,function(p)
    spline.set{'size',0,200*p,200,-150*p,400,-200*p,plr=1}
end}
--reset size spline on player 1 at beat 4
func{4,function() spline.reset{'size',plr=1} end}    
```

## generate points with loop:
```lua
set{0,50,'reverse'}

--generate a circle with 9 points, with first and last overlapping on y and z axes
func{0,function()
    local splineY={}
    for i=0,8 do
        table.insert(splineY,{200*i,-300*math.sin(45*i*(math.pi/180))})
    end
    local splineZ={}
    for i=0,8 do
        table.insert(splineZ,{200*i,300*math.cos(45*i*(math.pi/180))})
    end
    spline.set{'z',splineZ}
    spline.set{'y',splineY}
end}
```

It also automatically ignores points over index of 40 in the points list.