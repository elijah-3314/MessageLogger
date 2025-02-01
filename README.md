# MessageLogger

MessageLogger is a simple Lua module that allows you to log messages to the console with ANSI escape codes for text formatting. You can customize text color, background color, and add modifiers like bold or underline.

## Features
- Supports ANSI color codes for text and background.
- Allows adding text modifiers like bold, underline, and strikethrough.
- Easy-to-use API for setting colors and modifiers.
- Resets formatting automatically after each log message.

## Installation
Simply include the `MessageLogger.lua` file in your project and require it:
```lua
local MessageLogger = require("MessageLogger")
local logger = MessageLogger.new()
```

## Usage
### Basic Logging
`Log` is used to log with the current format settings.
```lua
logger:Log("Hello, world!")
```

### Setting Text and Background Colors
`SetTextColor` and `SetTextBackground` are used to change the text and background colors.
```lua
logger:SetTextColor("red")
logger:SetBackgroundColor("black")
logger:Log("This is a red message on a black background!")
```

### Adding Modifiers
`AddModifier` will enable the provided modifier.
```lua
logger:AddModifier("bold")
logger:Log("This text is bold!")
```

### Removing Modifiers
`RemoveModifier` will disable the provided modifier.
```lua
logger:RemoveModifier("bold")
logger:Log("This text is not longer bold.")
```

### Resetting Logger
`Reset` changes the text and background colors to default while disabling all modifiers.
```lua
logger:Reset()
logger:Log("Back to default formatting.")
```

### Getting Format
`GetFormat` will return the ANSII format for the current text and background colors aswell as the modifiers.\
_Note: You will need at add the reset format at the end if you don't want your console to stay formatted._
```lua
local format = logger:GetFormat()
print(format .. "Custom print with the same ANSII formatting." .. "\27[0")
```

## Available Colors and Modifiers

### Text Colors
| Name            | Code |
|----------------|------|
| reset          | 0    |
| black          | 30   |
| red            | 31   |
| green          | 32   |
| yellow         | 33   |
| blue           | 34   |
| magenta        | 35   |
| cyan           | 36   |
| white          | 37   |
| default        | 39   |
| brightblack    | 90   |
| brightred      | 91   |
| brightgreen    | 92   |
| brightyellow   | 93   |
| brightblue     | 94   |
| brightmagenta  | 95   |
| brightcyan     | 96   |
| brightwhite    | 97   |

### Background Colors
| Name            | Code |
|----------------|------|
| reset          | 0    |
| black          | 40   |
| red            | 41   |
| green          | 42   |
| yellow         | 43   |
| blue           | 44   |
| magenta        | 45   |
| cyan           | 46   |
| white          | 47   |
| default        | 49   |
| brightblack    | 100  |
| brightred      | 101  |
| brightgreen    | 102  |
| brightyellow   | 103  |
| brightblue     | 104  |
| brightmagenta  | 105  |
| brightcyan     | 106  |
| brightwhite    | 107  |

### Modifiers
| Name            | Code |
|----------------|------|
| bold           | 1    |
| dim            | 2    |
| italic         | 3    |
| underline      | 4    |
| blink          | 5    |
| inverse        | 7    |
| hidden         | 8    |
| strikethrough  | 9    |

## License
This project is licensed under the MIT License. Feel free to use and modify it in your own projects!

