local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);

function mMT:LoadKalielsTrackerProfile()

	KalielsTrackerDB = {
		["profiles"] = {
			["Default"] = {
			["classBorder"] = true,
			["borderThickness"] = 3,
			["objNumSwitch"] = true,
			["xOffset"] = 0,
			["progressBar"] = "|CFF8E44ADm|r|CFF2ECC71Media|r |CFF3498DB4a|r",
			["yOffset"] = -270,
			["soundQuest"] = false,
			["bgrColor"] = {
				["a"] = 0.3400000333786011,
				["b"] = 0.1333333333333333,
				["g"] = 0.1333333333333333,
				["r"] = 0.1333333333333333,
			},
			["bgr"] = "None",
			["hdrBtnColor"] = {
				["b"] = 0.2745098039215687,
				["g"] = 0.2745098039215687,
				["r"] = 0.2745098039215687,
			},
			["font"] = "PT Sans Narrow",
			["hdrBgr"] = 3,
			["filterAuto"] = {
				"zone", -- [1]
			},
			["fontSize"] = 14,
			["maxHeight"] = 540,
			["qiXOffset"] = 2,
			["bgrInset"] = 1,
			["hdrBgrColorShare"] = true,
			["colorDifficulty"] = true,
			["sink20OutputSink"] = "ChatFrame",
			["textWordWrap"] = true,
			["qiBgrBorder"] = true,
			["hdrTxtColorShare"] = true,
			},
		},
	}
end