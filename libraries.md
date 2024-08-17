# Libraries, by Synnwave

A useful plugin that contains many libraries that help with working with 2D space, 3D space, colors and animation.

(ps. sorry for the reused examples, i can't really think of good examples as of writing this.)

## Credits

EgoMoose, for their CFrame library implemenation in lua.

XeroOl, for their [rand](rand.md) plugin.

Roblox, for the inspiration of these libraries!

## List of Libraries

* [vec2](#vec2)
* [vec3](#vec3)
* [vec4](#vec4)
* [color](#color)
* [coord](#coord)
* [numberRange](#numberrange)
* [numberSequence](#numbersequence)

## Documentation

## `vec2`

A two-dimensional vector.

Useful for positioning actors using `actor:xy()`

---

### `vec2` Constructors

### `vec2.new(x, y)`

Returns a `vec2` with the given `x` and `y` components.

### `vec2.sequence(keypoints)`

Used to construct a sequence of `vec2`s, and can be used for animations.

See the [example](#animating-a-vec2-using-vec2sequence-and-func_ease).

### `vec2.keypoint(time, vec2)`

Used to construct a keypoint for [vec2.sequence](#vec2sequencekeypoints).

See the [example](#animating-a-vec2-using-vec2sequence-and-func_ease).

---

### `vec2` Properties

### `vec2.zero`

A preset `vec2`, equivalent to `vec2.new(0, 0)`

### `vec2.one`

A preset `vec2`, equivalent to `vec2.new(1, 1)`

### `vec2.xAxis`

A preset `vec2`, equivalent to `vec2.new(1, 0)`

### `vec2.yAxis`

A preset `vec2`, equivalent to `vec2.new(0, 1)`

### `vec2.center`

A preset `vec2`, equivalent to `vec2.new(scx, scy)`

### `vec2.scale`

A preset `vec2`, equivalent to `vec2.new(sw, sh)`

---

### `vec2` Class Methods

### `vec2:lerp(goalVec2, alpha)`

Returns a `vec2` linearly interpolated between this `vec2` and the goal `vec2` by the given alpha.

### `vec2:dot(otherVec2)`

Returns the dot product of the two vectors.

### `vec2:cross(otherVec2)`

Returns the cross product of the two vectors.

### `vec2()`

Returns the `x` and `y` components of the vector.

This should be used for applying the vector to an actor, as shown [here](#vec2-example-usages)

---

### `vec2` Class Properties

### `vec2.x`

Returns the x-axis of the vector.

### `vec2.y`

Returns the y-axis of the vector.

### `vec2.length`

The length of the vector.
Equivalent to `sqrt(x^2 + y^2)`

### `vec2.unit`

A normalized copy of the vector.
Equivalent to `vec2 / vec2.length`

---

### `vec2` Math Operations

### `vec2 + vec2`

Returns a vector where each component is the sum of the corresponding components from the two vectors.

### `vec2 - vec2`

Returns a vector where each component is the difference of the corresponding components from the two vectors.

### `vec2 * vec2`

Returns a vector where each component is the product of the corresponding components from the two vectors.

### `vec2 / vec2`

Returns a vector where each component is the quotient of the corresponding components from the two vectors.

### `vec2 * number`

Returns a vector where each component is multiplied by the number.

### `vec2 / number`

Returns a vector where each component is divided by the number.

### `-vec2`

Returns an opposite version of the vector

---

### `vec2` Example Usages

### Positioning an Actor using `vec2`

```lua
local position = vec2.center + vec2.new(20, 20) -- offset 20 pixels away from the center of the screen 
actor:xy(position()) -- position the actor, calling the vector is required for this to work!

-- (tip: a shorthand for vec2.new(20, 20) can be: vec2.one * 20)
```

### Animating a `vec2` using [`vec2.sequence`](#vec2sequencekeypoints) and [`func_ease`](https://xerool.github.io/notitg-mirin/docs/func.html#func-ease)

```lua
local thisSequence = vec2.sequence { -- construct the sequence
    -- create keypoints, sorted by time.
    -- NOTE: the keypoint's time must be within 0-1!
    vec2.keypoint(0 / 4, vec2.new(scx, 0)), 
    vec2.keypoint(1 / 4, vec2.new(0, scy)),
    vec2.keypoint(2 / 4, vec2.new(scx, scy * 2)),
    vec2.keypoint(3 / 4, vec2.new(scx * 2, scy)),
    vec2.keypoint(4 / 4, vec2.new(scx, 0)),
}

func_ease {0, 4, outExpo, function(percent) -- using func_ease to get an animated percent
    local thisPosition = thisSequence:evaluate(percent) -- get current position of the sequence
    actor:xy(thisPosition()) -- apply!
end}
```

---

## `vec3`

A three-dimensional vector.

Useful for positioning actors using `actor:xyz()`

### `vec3` Constructors

### `vec3.new(x, y, z)`

Returns a `vec3` with the given `x`, `y` and `z` components.

### `vec3.sequence(keypoints)`

Used to construct a sequence of `vec3`s, and can be used for animations.

See the [example](#animating-a-vec3-using-vec3sequence-and-func_ease).

### `vec3.keypoint(time, vec3)`

Used to construct a keypoint for [vec3.sequence](#vec3sequencekeypoints).

See the [example](#animating-a-vec3-using-vec3sequence-and-func_ease).

---

### `vec3` Properties

### `vec3.zero`

A preset `vec3`, equivalent to `vec3.new(0, 0, 0)`

### `vec3.one`

A preset `vec3`, equivalent to `vec3.new(1, 1, 1)`

### `vec3.xAxis`

A preset `vec3`, equivalent to `vec3.new(1, 0, 0)`

### `vec3.yAxis`

A preset `vec3`, equivalent to `vec3.new(0, 1, 0)`

### `vec3.zAxis`

A preset `vec3`, equivalent to `vec3.new(0, 0, 1)`

### `vec3.center`

A preset `vec3`, equivalent to `vec3.new(scx, scy, 0)`

### `vec3.scale`

A preset `vec3`, equivalent to `vec3.new(sw, sh, 0)`

---

### `vec3` Class Methods

### `vec3:lerp(goalVec3, alpha)`

Returns a `vec3` linearly interpolated between this `vec3` and the goal `vec3` by the given alpha.

### `vec3:dot(otherVec3)`

Returns the dot product of the two vectors.

### `vec3:cross(otherVec3)`

Returns the cross product of the two vectors.

### `vec3()`

Returns the `x`, `y` and `z` components of the vector.

This should be used for applying the vector to an actor, as shown [here](#vec3-example-usages)

---

### `vec3` Class Properties

### `vec3.x`

Returns the x-axis of the vector.

### `vec3.y`

Returns the y-axis of the vector.

### `vec3.z`

Returns the z-axis of the vector.

### `vec3.length`

The length of the vector.
Equivalent to `sqrt(x^2 + y^2 + z^2)`

### `vec3.unit`

A normalized copy of the vector.
Equivalent to `vec3 / vec3.length`

---

### `vec3` Math Operations

### `vec3 + vec3`

Returns a vector where each component is the sum of the corresponding components from the two vectors.

### `vec3 - vec3`

Returns a vector where each component is the difference of the corresponding components from the two vectors.

### `vec3 * vec3`

Returns a vector where each component is the product of the corresponding components from the two vectors.

### `vec3 / vec3`

Returns a vector where each component is the quotient of the corresponding components from the two vectors.

### `vec3 * number`

Returns a vector where each component is multiplied by the number.

### `vec3 / number`

Returns a vector where each component is divided by the number.

### `-vec3`

Returns an opposite version of the vector

---

### `vec3` Example Usages

### Positioning an Actor using `vec3`

```lua
local position = vec3.center + vec3.new(20, 20, 20) -- offset 20 pixels away from the center of the screen
actor:xyz(position()) -- position the actor, calling the vector is required for this to work!

-- (tip: a shorthand for vec3.new(20, 20, 20) can be: vec3.one * 20)
```

### Animating a `vec3` using [`vec3.sequence`](#vec3sequencekeypoints) and [`func_ease`](https://xerool.github.io/notitg-mirin/docs/func.html#func-ease)

```lua
local thisSequence = vec3.sequence { -- construct the sequence
    -- create keypoints, sorted by time.
    -- NOTE: the keypoint's time must be within 0-1!
    vec3.keypoint(0 / 4, vec3.new(scx, 0, 0)), 
    vec3.keypoint(1 / 4, vec3.new(0, scy, 0)),
    vec3.keypoint(2 / 4, vec3.new(scx, scy * 2, 0)),
    vec3.keypoint(3 / 4, vec3.new(scx * 2, scy, 0)),
    vec3.keypoint(4 / 4, vec3.new(scx, 0, 0)),
}

func_ease {0, 4, outExpo, function(percent) -- using func_ease to get an animated percent
    local thisPosition = thisSequence:evaluate(percent) -- get current position of the sequence
    actor:xyz(thisPosition()) -- apply!
end}
```

---

## `vec4`

A four-dimensional vector.

Useful for positioning and resizing actors using `actor:xywh()`, `actor:stretchto()`, `actor:scaletofit()` and `actor:scaletocover()`

### `vec4` Constructors

### `vec4.new(x, y, w, h)`

Returns a `vec4` with the given `x`, `y`, `w` and `h` components.

### `vec4.sequence(keypoints)`

Used to construct a sequence of `vec4`s, and can be used for animations.

See the [example](#animating-a-vec4-using-vec4sequence-and-func_ease).

### `vec4.keypoint(time, vec4)`

Used to construct a keypoint for [vec4.sequence](#vec4sequencekeypoints).

See the [example](#animating-a-vec4-using-vec4sequence-and-func_ease).

---

### `vec4` Properties

### `vec4.zero`

A preset `vec4`, equivalent to `vec4.new(0, 0, 0, 0)`

### `vec4.one`

A preset `vec4`, equivalent to `vec4.new(1, 1, 1, 1)`

### `vec4.xAxis`

A preset `vec4`, equivalent to `vec4.new(1, 0, 0, 0)`

### `vec4.yAxis`

A preset `vec4`, equivalent to `vec4.new(0, 1, 0, 0)`

### `vec4.wAxis`

A preset `vec4`, equivalent to `vec4.new(0, 0, 1, 0)`

### `vec4.hAxis`

A preset `vec4`, equivalent to `vec4.new(0, 0, 0, 1)`

### `vec4.center`

A preset `vec4`, equivalent to `vec4.new(scx, scy, 0, 0)`

### `vec4.scale`

A preset `vec4`, equivalent to `vec4.new(0, 0, sw, sh)`

### `vec4.full`

A preset `vec4`, equivalent to `vec4.new(scx, scy, sw, sh)`

---

### `vec4` Class Methods

### `vec4:lerp(goalVec4, alpha)`

Returns a `vec4` linearly interpolated between this `vec4` and the goal `vec4` by the given alpha.

### `vec4:dot(otherVec4)`

Returns the dot product of the two vectors.

### `vec4()`

Returns the `x`, `y`, `w` and `h` components of the vector.

This should be used for applying the vector to an actor, as shown [here](#vec4-example-usages)

---

### `vec4` Class Properties

### `vec4.x`

Returns the x-axis of the vector.

### `vec4.y`

Returns the y-axis of the vector.

### `vec4.w`

Returns the w-axis of the vector.

### `vec4.h`

Returns the h-axis of the vector.

### `vec4.length`

The length of the vector.
Equivalent to `sqrt(x^2 + y^2 + w^2 + h^2)`

### `vec4.unit`

A normalized copy of the vector.
Equivalent to `vec4 / vec4.length`

---

### `vec4` Math Operations

### `vec4 + vec4`

Returns a vector where each component is the sum of the corresponding components from the two vectors.

### `vec4 - vec4`

Returns a vector where each component is the difference of the corresponding components from the two vectors.

### `vec4 * vec4`

Returns a vector where each component is the product of the corresponding components from the two vectors.

### `vec4 / vec4`

Returns a vector where each component is the quotient of the corresponding components from the two vectors.

### `vec4 * number`

Returns a vector where each component is multiplied by the number.

### `vec4 / number`

Returns a vector where each component is divided by the number.

### `-vec4`

Returns an opposite version of the vector

---

### `vec4` Example Usages

### Positioning & Scaling an Actor

```lua
local vector = vec4.full -- screen center and screen size vector
actor:xywh(vector()) -- calling the vector is required for this to work!
```

### Animating a `vec4` using [`vec4.sequence`](#vec4sequencekeypoints) and [`func_ease`](https://xerool.github.io/notitg-mirin/docs/func.html#func-ease)

```lua
local thisSequence = vec4.sequence { -- construct the sequence
    -- create keypoints, sorted by time.
    -- NOTE: the keypoint's time must be within 0-1!
    -- 3dgifmaker squishy animation Haha
    vec4.keypoint(0 / 8, vec4.new(scx, scy, (sw / 1.25     ), (sh / 1.25 + 50))),
    vec4.keypoint(1 / 8, vec4.new(scx, scy, (sw / 1.25 + 35), (sh / 1.25 + 35))),
    vec4.keypoint(2 / 8, vec4.new(scx, scy, (sw / 1.25 + 50), (sh / 1.25     ))),
    vec4.keypoint(3 / 8, vec4.new(scx, scy, (sw / 1.25 + 35), (sh / 1.25 - 35))),
    vec4.keypoint(4 / 8, vec4.new(scx, scy, (sw / 1.25     ), (sh / 1.25 - 50))),
    vec4.keypoint(5 / 8, vec4.new(scx, scy, (sw / 1.25 - 35), (sh / 1.25 - 35))),
    vec4.keypoint(6 / 8, vec4.new(scx, scy, (sw / 1.25 - 50), (sh / 1.25     ))),
    vec4.keypoint(7 / 8, vec4.new(scx, scy, (sw / 1.25 - 35), (sh / 1.25 + 35))),
    vec4.keypoint(8 / 8, vec4.new(scx, scy, (sw / 1.25     ), (sh / 1.25 + 50))),
}

func_ease {0, 2, linear, function(percent) -- using func_ease to get an animated percent
    local thisScale = thisSequence:evaluate(percent) -- get current position of the sequence
    actor:xywh(thisScale()) -- apply!
end}
```

---

## `color`

Useful for changing the color of actors using `actor:diffuse()` or `actor:diffusecolor()`

### `color` Constructors

### `color.new(r, g, b, a)`

Returns a `color` with the given `r`, `g`, `b` and `a` components. (values ranging from 0-1)

### `color.rgba(r, g, b, a)`

Returns a `color` with the given `r`, `g`, `b` and `a` components. (values ranging from 0-255)

### `color.hexa(hex, a)`

Returns a `color` with the given hex code string.

### `color.hsva(hue, sat, val, a)`

Returns a `color` from the HSV color space.

### `color.sequence(keypoints)`

Used to construct a sequence of `color`s, and can be used for animations.

See the [example](#animating-a-color-using-colorsequence-and-func_ease).

### `color.keypoint(time, color)`

Used to construct a keypoint for [color.sequence](#colorsequencekeypoints).

See the [example](#animating-a-color-using-colorsequence-and-func_ease).

---

### `color` Properties

### `color.transparent`

A preset `color`, equivalent to `color.new(1, 1, 1, 0)`

### `color.white`

A preset `color`, equivalent to `color.new(1, 1, 1, 1)`

### `color.black`

A preset `color`, equivalent to `color.new(0, 0, 0, 1)`

### `color.red`

A preset `color`, equivalent to `color.new(1, 0, 0, 1)`

### `color.green`

A preset `color`, equivalent to `color.new(0, 1, 0, 1)`

### `color.blue`

A preset `color`, equivalent to `color.new(0, 0, 1, 1)`

### `color.yellow`

A preset `color`, equivalent to `color.new(1, 1, 0, 1)`

### `color.magenta`

A preset `color`, equivalent to `color.new(1, 0, 1, 1)`

### `color.cyan`

A preset `color`, equivalent to `color.new(0, 1, 1, 1)`

---

### `color` Class Methods

### `color:lerp(goalColor, alpha)`

Returns a `color` linearly interpolated between this `color` and the goal `color` by the given alpha.

### `color:toHSV()`

Returns the hue, saturation and value of the `color`.

### `color:toHex()`

Returns the hexadecimal string of the `color`.

### `color:invert()`

Returns an inverted copy of the `color`.

### `color:invertColor()`

Returns an inverted copy of the `color` but preserves the alpha value.

### `color()`

Returns the `r`, `g`, `b` and `a` components of the `color`.

This should be used for applying the color to an actor, as shown [here](#color-example-usages)

---

### `color` Class Properties

### `color.r`

Returns the red value of the color.

### `color.g`

Returns the green value of the color.

### `color.b`

Returns the blue value of the color.

### `color.a`

Returns the alpha value of the color.

---

### `color` Example Usages

### Changing the color of an Actor

```lua
local color = color.rgba(100, 50, 150, 50) -- purple color, 50% alpha
actor:diffuse(color()) -- "diffuse" the actor, calling the color is required for this to work!
-- TIP: to ignore alpha, use actor:diffusecolor() instead!
```

### Animating a `color` using [`color.sequence`](#colorsequencekeypoints) and [`func_ease`](https://xerool.github.io/notitg-mirin/docs/func.html#func-ease)

```lua
local thisSequence = color.sequence { -- construct the sequence
    -- create keypoints, sorted by time.
    -- NOTE: the keypoint's time must be within 0-1!
    color.keypoint(0 / 4, color.new(1, 0, 0, 1)),
    color.keypoint(1 / 4, color.new(0, 1, 0, 0.5)),
    color.keypoint(2 / 4, color.new(0, 0, 1, 1)),
    color.keypoint(3 / 4, color.new(1, 1, 0, 0.5)),
    color.keypoint(4 / 4, color.new(1, 0, 0, 1)),
}

func_ease {0, 4, outExpo, function(percent) -- using func_ease to get an animated percent
    local thisPosition = thisSequence:evaluate(percent) -- get current position of the sequence
    actor:diffuse(thisPosition()) -- apply!
end}
```

---

## `coord`

3D Position and Orientation.

Useful for positioning actors using `actor:xyz()` and rotating actors using `actor:rotationx/y/z()`

### `coord` Constructors

### `coord.new(x, y, z)`

Returns a `coord` with the given `x`, `y` and `z` components.

### `coord.new(vec3)`

Returns a `coord` with the position from the given `vec3`.

### `coord.new(vec3, vec3)`

Returns a `coord` with the position from the given `vec3`, looking at the second `vec3`.

### `coord.new(number, number, number, number, number, number, number)`

Returns a quaternion `coord` with the given numbers.

### `coord.axisAngle(vec3, rotation)`

Returns a rotated `coord` from the unit `vec3` and the `rotation` in radians.

### `coord.eulerAnglesXYZ(rx, ry, rz)`

Returns a rotated `coord` from angles `rx`, `ry`, and `rz` in radians, in XYZ order.

### `coord.angles(rx, ry, rz)`

Equivalent to `coord.eulerAnglesXYZ(rx, ry, rz)`

### `coord.eulerAnglesYXZ(rx, ry, rz)`

Returns a rotated `coord` from angles `rx`, `ry`, and `rz` in radians, in YXZ order.

### `coord.orientation(rx, ry, rz)`

Equivalent to `coord.eulerAnglesYXZ(rx, ry, rz)`

### `coord.matrix(rx, ry, rz)`

Returns a `coord` from a translation and the columns of a rotation matrix.

### `coord.sequence(keypoints)`

Used to construct a sequence of `coord`s, and can be used for animations.

See the [example](#animating-a-coord-using-coordsequence-and-func_ease).

### `coord.keypoint(time, coord)`

Used to construct a keypoint for [coord.sequence](#coordsequencekeypoints).

See the [example](#animating-a-coord-using-coordsequence-and-func_ease).

---

### `coord` Properties

### `coord.identity`

A preset `coord`, equivalent to `coord.new(0, 0, 0)`

---

### `coord` Class Methods

### `coord:lerp(goalCoord, alpha)`

Returns a `coord` linearly interpolated between this `coord` and the goal `coord` by the given alpha.

### `coord:getComponents()`

Returns the components of the `coord`.

### `coord:inverse()`

Returns an inverse of the `coord`.

### `coord:toWorldSpace(otherCoord)`

Equivalent to `coord * otherCoord`

### `coord:toObjectSpace(otherCoord)`

Equivalent to `coord:inverse() * otherCoord`

### `coord:pointToWorldSpace(vec3)`

Equivalent to `coord * vec3`

### `coord:pointToObjectSpace(vec3)`

Equivalent to `coord:inverse() * vec3`

### `coord:vectorToWorldSpace(vec3)`

Equivalent to `(coord - coord.position) * vec3`

### `coord:vectorToObjectSpace(vec3)`

Equivalent to `(coord - coord.position):inverse() * vec3`

### `coord:toEulerAnglesXYZ()`

Returns approximate angles that could be used to generate the `coord` using the `XYZ` order.

### `coord:toEulerAnglesYXZ()`

Returns approximate angles that could be used to generate the `coord` using the `YXZ` order.

### `coord:toOrientationDegrees()`

Equivalent to:

```lua
local rx, ry, rz = coord:toEulerAnglesYXZ()
rx, ry, rz = math.deg(rx), math.deg(ry), math.deg(rz)
```

### `coord:toAxisAngle()`

Returns a `vec3` and a `number` representing the rotation of the `coord` in the axis-angle representation.

### `coord:getXYZ()`

Returns the `x`, `y` and `z` components of the `coord`.

---

### `coord` Class Properties

### `coord.x`

Returns the x-axis of the coord.

### `coord.y`

Returns the y-axis of the coord.

### `coord.z`

Returns the z-axis of the coord.

### `coord.position`

Returns a `vec3` of the `coord`'s position

### `coord.xVector`

Returns the x component of the `coord`'s orientation.

### `coord.yVector`

Returns the y component of the `coord`'s orientation.

### `coord.zVector`

Returns the z component of the `coord`'s orientation.

---

### `coord` Math Operations

### `coord * coord`

Returns a `coord` representing the composition of the two `coord`s

### `coord + vec3`

Returns a `vec3` translated in world space by the `vec3`.

### `coord - vec3`

Returns a `coord` translated in world space by the negative `vec3`.

### `coord * vec3`

Returns a `coord` transformed from object to world coordinates.

---

### `coord` Example Usages

### Positioning & Orientating an Actor

```lua
local function applyCoord(thisCoord, actor) -- Helper function for applying a coord to an actor.
    actor:xyz(thisCoord:getXYZ())
    local rx, ry, rz = thisCoord:toOrientationDegrees()
    actor:rotationx(rx)
    actor:rotationy(ry)
    actor:rotationz(rz)
end

local position = coord.new(scx, scy, 0) * coord.angles(math.rad(45), 0, 0) -- position at center, orientate it 45 degress (looking up)
applyCoord(position, actor) -- apply!
```

### Animating a `coord` using [`coord.sequence`](#coordsequencekeypoints) and [`func_ease`](https://xerool.github.io/notitg-mirin/docs/func.html#func-ease)

```lua
local thisSequence = coord.sequence { -- construct the sequence
    -- create keypoints, sorted by time.
    -- NOTE: the keypoint's time must be within 0-1!
    coord.keypoint(0 / 4, coord.new(scx, 0, 0)       * coord.angles(0, 0, -math.pi)),
    coord.keypoint(1 / 4, coord.new(0, scy, 0)       * coord.angles(0, 0, math.pi / 2)),
    coord.keypoint(2 / 4, coord.new(scx, scy * 2, 0) * coord.angles(0, 0, math.pi)),
    coord.keypoint(3 / 4, coord.new(scx * 2, scy, 0) * coord.angles(0, 0, -math.pi / 2)),
    coord.keypoint(4 / 4, coord.new(scx, 0, 0)       * coord.angles(0, 0, math.pi)),
}

func_ease {0, 4, outExpo, function(percent) -- using func_ease to get an animated percent
    local thisPosition = thisSequence:evaluate(percent) -- get current position of the sequence
    applyCoord(thisPosition, actor) -- apply using the helper function!
end}
```

---

## `numberRange`

A range of numbers.

### `numberRange` Constructors

### `numberRange.new(min, max)`

Returns a `numberRange` with the given `min` and `max` components.
Will error if `min` is greater than `max`.

---

### `numberRange` Class Methods

### `numberRange:isWithin(number)`

Returns a `boolean` indicating whether the provided `number` is within the `range`.

### `numberRange:isOutside(number)`

Returns a `boolean` indicating whether the provided `number` is outside the `range`.
Equivalent to: `not numberRange:isWithin(number)`

### `numberRange:randomNumber()`

Returns a random float within the `range`.

### `numberRange:randomInt()`

Returns a random integer within the `range`.

---

### `numberRange` Class Properties

### `numberRange.min`

Returns the minimum value of the `numberRange`.

### `numberRange.max`

Returns the maximum value of the `numberRange`.

---

### `numberRange` Example Usages

### Positioning the actor to a random point in the X-axis

```lua
local range = numberRange.new(0, sw) -- the left and right points of the screen
actor:x(range:randomNumber()) -- set the position to a random point in the x-axis
```

---

## `numberSequence`

A sequence of numbers that can be used for animation.

Useful for changing the alpha of an actor using `actor:diffusealpha()`.

### `numberSequence` Constructors

### `numberSequence.new(keypoints)`

Used to construct the sequence.

See the [example](#animating-a-coord-using-coordsequence-and-func_ease).

### `numberSequence.keypoint(time, number, envelope)`

Used to construct a keypoint for [numberSequence.sequence](#numbersequencenewkeypoints).

See the [example](#animating-a-coord-using-coordsequence-and-func_ease).

The `envelope` is the amount of variance from the `number`.
This can only be used once the sequence is [resolved](#numbersequenceresolve), and is exclusive to `numberSequence`.

---

### `numberSequence` Class Methods

### `numberSequence:resolve()`

Returns a `numberSequence` with all of it's envelope parameters resolved.

---

### `numberSequence` Example Usages

### Changing the alpha of an actor using a `numberSequence`

```lua
local thisSequence = numberSequence.new { -- construct the sequence
    -- create keypoints, sorted by time.
    -- NOTE: the keypoint's time must be within 0-1!
    numberSequence.keypoint(0 / 4, 1), -- 100% Alpha
    numberSequence.keypoint(1 / 4, 0.5), -- 50% Alpha
    numberSequence.keypoint(2 / 4, 0.25), -- 25% Alpha
    numberSequence.keypoint(3 / 4, 0.75), -- 75% Alpha
    numberSequence.keypoint(4 / 4, 1), -- 100% Alpha
}

func_ease {0, 4, outExpo, function(percent) -- using func_ease to get an animated percent
    local thisAlpha = thisSequence:evaluate(percent) -- get current position of the sequence
    actor:diffusealpha(thisAlpha) -- apply!
end}
```
