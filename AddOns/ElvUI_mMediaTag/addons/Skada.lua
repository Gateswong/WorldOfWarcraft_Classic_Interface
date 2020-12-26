local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);

function mMT:LoadSkadaProfile()

SkadaDB = {
	["profiles"] = {
		["Default"] = {
			["showtotals"] = true,
			["showself"] = true,
			["windows"] = {
				{
					["barheight"] = 17,
					["classicons"] = false,
					["barslocked"] = true,
					["y"] = 8.000045776367188,
					["barfont"] = "PT Sans Narrow Bold",
					["title"] = {
						["color"] = {
							["b"] = 0.1411764705882353,
							["g"] = 0.1411764705882353,
							["r"] = 0.1411764705882353,
						},
						["font"] = "PT Sans Narrow Bold",
						["fontsize"] = 14,
						["texture"] = "|CFF8E44ADm|r|CFF2ECC71Media|r |CFF3498DB4a|r",
					},
					["modeincombat"] = "Schaden",
					["x"] = 1447.00212097168,
					["point"] = "TOPRIGHT",
					["barcolor"] = {
						["b"] = 0.2509803921568627,
						["g"] = 0.2352941176470588,
						["r"] = 0.2274509803921569,
					},
					["barfontsize"] = 14,
					["mode"] = "Schaden",
					["spark"] = false,
					["bartexture"] = "|CFF8E44ADm|r|CFF2ECC71Media|r |CFF3498DB4a|r",
					["barwidth"] = 236.0000762939453,
					["smoothing"] = true,
					["background"] = {
						["strata"] = "LOW",
						["borderthickness"] = 2,
						["height"] = 127.0002288818359,
						["bordertexture"] = "None",
					},
					["name"] = "DPS",
					["buttons"] = {
						["menu"] = false,
						["mode"] = false,
					},
				}, -- [1]
				{
					["titleset"] = true,
					["barheight"] = 17,
					["color"] = {
						["a"] = 0.6,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.3,
					},
					["issolidbackdrop"] = false,
					["classicons"] = false,
					["barslocked"] = true,
					["useframe"] = true,
					["clickthrough"] = false,
					["wipemode"] = "",
					["set"] = "current",
					["hidden"] = false,
					["y"] = 8.000045776367188,
					["barfont"] = "PT Sans Narrow Bold",
					["name"] = "HPS",
					["x"] = 1688.002105712891,
					["display"] = "bar",
					["classcolortext"] = false,
					["barfontflags"] = "",
					["isusingelvuiskin"] = true,
					["reversegrowth"] = false,
					["strata"] = "LOW",
					["point"] = "TOPRIGHT",
					["spellschoolcolors"] = true,
					["barbgcolor"] = {
						["a"] = 0.6,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.3,
					},
					["barcolor"] = {
						["a"] = 1,
						["b"] = 0.2509803921568627,
						["g"] = 0.2352941176470588,
						["r"] = 0.2274509803921569,
					},
					["returnaftercombat"] = false,
					["barfontsize"] = 14,
					["title"] = {
						["textcolor"] = {
							["a"] = 1,
							["r"] = 0.9,
							["g"] = 0.9,
							["b"] = 0.9,
						},
						["color"] = {
							["a"] = 1,
							["b"] = 0.1411764705882353,
							["g"] = 0.1411764705882353,
							["r"] = 0.1411764705882353,
						},
						["bordercolor"] = {
							["a"] = 1,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["font"] = "PT Sans Narrow Bold",
						["fontsize"] = 14,
						["height"] = 20,
						["fontflags"] = "",
						["bordertexture"] = "None",
						["borderthickness"] = 2,
						["texture"] = "|CFF8E44ADm|r|CFF2ECC71Media|r |CFF3498DB4a|r",
					},
					["isonnewline"] = false,
					["snapto"] = true,
					["roleicons"] = false,
					["barorientation"] = 1,
					["mode"] = "Heilung",
					["scale"] = 1,
					["width"] = 600,
					["bartexture"] = "|CFF8E44ADm|r|CFF2ECC71Media|r |CFF3498DB4a|r",
					["textcolor"] = {
						["r"] = 0.9,
						["g"] = 0.9,
						["b"] = 0.9,
					},
					["spark"] = false,
					["buttons"] = {
						["segment"] = true,
						["menu"] = true,
						["mode"] = false,
						["report"] = true,
						["reset"] = true,
					},
					["barwidth"] = 219.0008239746094,
					["barspacing"] = 0,
					["fixedbarwidth"] = false,
					["smoothing"] = true,
					["modeincombat"] = "Heilung",
					["enabletitle"] = true,
					["version"] = 1,
					["classcolorbars"] = true,
					["isusingclasscolors"] = true,
					["showself"] = true,
					["background"] = {
						["strata"] = "LOW",
						["tile"] = false,
						["color"] = {
							["a"] = 0.4,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["bordertexture"] = "None",
						["borderthickness"] = 2,
						["height"] = 127.0002288818359,
						["bordercolor"] = {
							["a"] = 1,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["tilesize"] = 0,
						["texture"] = "Solid",
					},
					["height"] = 30,
				}, -- [2]
			},
			["versions"] = {
				["1.6.7"] = true,
				["1.6.4"] = true,
				["1.6.3"] = true,
			},
		},
	},
}

end