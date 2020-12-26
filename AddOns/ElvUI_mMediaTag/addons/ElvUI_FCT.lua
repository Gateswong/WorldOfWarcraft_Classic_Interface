local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);

function mMT:LoadElvUIFCTProfile()
	ElvFCT = {
		["nameplates"] = {
			["frames"] = {
				["Player"] = {
					["enable"] = true,
					["font"] = "PT Sans Narrow Bold",
				},
				["EnemyNPC"] = {
					["font"] = "PT Sans Narrow Bold",
					["textShake"] = true,
					["iconSize"] = 18,
					["showHots"] = true,
					["showDots"] = true,
					["critFontSize"] = 20,
					["fontSize"] = 16,
				},
				["FriendlyPlayer"] = {
					["font"] = "PT Sans Narrow Bold",
					["showIcon"] = false,
				},
				["EnemyPlayer"] = {
					["font"] = "PT Sans Narrow Bold",
					["showIcon"] = false,
				},
				["FriendlyNPC"] = {
					["font"] = "PT Sans Narrow Bold",
					["showIcon"] = false,
				},
			},
		},
		["unitframes"] = {
			["frames"] = {
				["Target"] = {
					["enable"] = false,
				},
				["Player"] = {
					["showName"] = false,
					["font"] = "PT Sans Narrow Bold",
				},
				["Boss"] = {
					["enable"] = false,
				},
				["Focus"] = {
					["enable"] = false,
				},
				["FocusTarget"] = {
					["enable"] = false,
				},
			},
		},
	}
end