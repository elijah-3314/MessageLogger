local CODES = {
	textColor = {
		reset = 0,
		black = 30,
		red = 31,
		green = 32,
		yellow = 33,
		blue = 34,
		magenta = 35,
		cyan = 36,
		white = 37,
		default = 39,
		brightblack = 90,
		brightred = 91,
		brightgreen = 92,
		brightyellow = 93,
		brightblue = 94,
		brightmagenta = 95,
		brightcyan = 96,
		brightwhite = 97,
	},
	backgroundColor = {
		reset = 0,
		black = 40,
		red = 41,
		green = 42,
		yellow = 43,
		blue = 44,
		magenta = 45,
		cyan = 46,
		white = 47,
		default = 49,
		brightblack = 100,
		brightred = 101,
		brightgreen = 102,
		brightyellow = 103,
		brightblue = 104,
		brightmagenta = 105,
		brightcyan = 106,
		brightwhite = 107,
	},
	modifier = {
		bold = 1,
		dim = 2,
		italic = 3,
		underline = 4,
		blink = 5,
		inverse = 7,
		hidden = 8,
		strikethrough = 9,
	},
}

local MessageLogger = {}

MessageLogger.__index = MessageLogger

function MessageLogger.new()
	local self = setmetatable({}, MessageLogger)

	self.textColor = 39
	self.backgroundColor = 49
	self.modifiers = {}

	return self
end

function MessageLogger:SetTextColor(textColor)
	assert(type(textColor) == "string", "SetTextColor argument #1 must be a string.")
	textColor = string.lower(textColor)
	assert(CODES.textColor[textColor], string.format("SetTextColor argument #1 invalid text color '%s'.", textColor))

	self.textColor = CODES.textColor[textColor]
end

function MessageLogger:SetBackgroundColor(backgroundColor)
	assert(type(backgroundColor) == "string", "SetBackgroundColor argument #1 must be a string.")
	backgroundColor = string.lower(backgroundColor)
	assert(
		CODES.backgroundColor[backgroundColor],
		string.format("SetBackgroundColor argument #1 invalid background color '%s'.", backgroundColor)
	)

	self.backgroundColor = CODES.backgroundColor[backgroundColor]
end

function MessageLogger:AddModifier(modifier)
	assert(type(modifier) == "string", "AddModifier argument #1 must be a string.")
	modifier = string.lower(modifier)
	assert(CODES.modifier[modifier], string.format("AddModifier argument #1 invalid modifier '%s'.", modifier))

	self.modifiers[CODES.modifier[modifier]] = true
end

function MessageLogger:RemoveModifier(modifier)
	assert(type(modifier) == "string", "RemoveModifier argument #1 must be a string.")
	modifier = string.lower(modifier)
	assert(CODES.modifier[modifier], string.format("RemoveModifier argument #1 invalid modifier '%s'.", modifier))

	self.modifiers[CODES.modifier[modifier]] = false
end

function MessageLogger:Log(message)
	message = tostring(message)

	local format = self:GetFormat()

	print(format .. message .. "\27[0m")
end

function MessageLogger:GetFormat()
	local codes = {}

	for modifier, active in next, self.modifiers do
		if active then
			table.insert(codes, modifier)
		end
	end

	table.insert(codes, self.textColor)
	table.insert(codes, self.backgroundColor)

	return "\27[" .. table.concat(codes, ";") .. "m"
end

function MessageLogger:Reset()
	self.textColor = 39
	self.backgroundColor = 49
	self.modifiers = {}
end

return MessageLogger
