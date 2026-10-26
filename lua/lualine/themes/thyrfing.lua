local black      = "#000000"
local bg_alt     = "#31120a"
local fg         = "#c1c1c1"
local red        = "#B04024"
local orange     = "#AF4C35"
local gray       = "#505050"
local teal       = "#5f8787"
local light_gray = "#aaaaaa"

return {
	normal = {
		a = { bg = red,      fg = black,      gui = "bold" },
		b = { bg = bg_alt,   fg = fg },
		c = { bg = black,    fg = light_gray },
	},
	insert = {
		a = { bg = teal,     fg = black },
		b = { bg = bg_alt,   fg = fg },
		c = { bg = black,    fg = light_gray },
	},
	visual = {
		a = { bg = orange,   fg = black },
		b = { bg = bg_alt,   fg = fg },
		c = { bg = black,    fg = light_gray },
	},
	replace = {
		a = { bg = gray,     fg = black },
		b = { bg = bg_alt,   fg = fg },
		c = { bg = black,    fg = light_gray },
	},
	command = {
		a = { bg = red,      fg = black },
		b = { bg = bg_alt,   fg = fg },
		c = { bg = black,    fg = light_gray },
	},
	inactive = {
		a = { bg = black,    fg = gray },
		b = { bg = black,    fg = gray },
		c = { bg = black,    fg = gray },
	},
}
