local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);

function mMT:LoadPAProfile()
	ProjectAzilrokaDB = {
		["profiles"] = {
			["Default"] = {
				["EnhancedShadows"] = {
					["Enable"] = false,
				},
				["BrokerLDB"] = {
					["FontFlag"] = "NONE",
					["Font"] = "PT Sans Narrow",
					["ShowIcon"] = true,
				},
				["SquareMinimapButtons"] = {
					["Shadows"] = false,
					["IconSize"] = 21,
					["MoveQueue"] = false,
					["Backdrop"] = false,
					["ReverseDirection"] = true,
					["MoveMail"] = false,
					["ButtonsPerRow"] = 8,
				},
				["DragonOverlay"] = {
					["Enable"] = false,
				},
				["MovableFrames"] = {
					["GhostFrame"] = {
						["Points"] = {
							"TOP", -- [1]
							nil, -- [2]
							"TOP", -- [3]
							nil, -- [4]
							-150.0002288818359, -- [5]
						},
					},
					["GarrisonLandingPage"] = {
						["Points"] = {
							"TOPLEFT", -- [1]
							nil, -- [2]
							"TOPLEFT", -- [3]
							16, -- [4]
							-107.0000076293945, -- [5]
						},
					},
					["StaticPopup1"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-100.0001525878906, -- [5]
						},
					},
					["QuestFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000228881836, -- [5]
						},
					},
					["GuildRegistrarFrame"] = {
						["Permanent"] = false,
					},
					["GossipFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000228881836, -- [5]
						},
					},
					["LFGDungeonReadyDialog"] = {
						["Points"] = {
							nil, -- [1]
							"LFGDungeonReadyPopup", -- [2]
						},
					},
					["PVEFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							16, -- [4]
							-116.0000152587891, -- [5]
						},
					},
					["Enable"] = false,
					["MailFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000076293945, -- [5]
						},
					},
					["MacroFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000228881836, -- [5]
						},
					},
					["BarberShopFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							-50, -- [4]
							-50, -- [5]
						},
					},
					["CollectionsJournal"] = {
						["Points"] = {
							"TOP", -- [1]
							nil, -- [2]
							"TOP", -- [3]
							-127.5006942749023, -- [4]
							-104.9999694824219, -- [5]
						},
					},
					["AchievementFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000228881836, -- [5]
						},
					},
					["PlayerTalentFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							16, -- [4]
							-116.0000076293945, -- [5]
						},
					},
					["GuildBankFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							16, -- [4]
							-116.0000076293945, -- [5]
						},
					},
					["SpellBookFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000076293945, -- [5]
						},
					},
					["InspectFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000076293945, -- [5]
						},
					},
					["CommunitiesFrame"] = {
						["Points"] = {
							"TOPLEFT", -- [1]
							nil, -- [2]
							"TOPLEFT", -- [3]
							16, -- [4]
							-116.0000152587891, -- [5]
						},
					},
					["BankFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0, -- [4]
							0, -- [5]
						},
					},
					["MerchantFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000228881836, -- [5]
						},
					},
					["TradeSkillFrame"] = {
						["Points"] = {
							"TOP", -- [1]
							nil, -- [2]
							"TOP", -- [3]
							311.0001831054688, -- [4]
							-134.0000305175781, -- [5]
						},
					},
					["ClassTrainerFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000076293945, -- [5]
						},
					},
					["CharacterFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000228881836, -- [5]
						},
					},
					["AuctionHouseFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							36, -- [4]
							-116.0000076293945, -- [5]
						},
					},
					["ScrappingMachineFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							1290.000122070313, -- [4]
							-116.0000076293945, -- [5]
						},
					},
					["EncounterJournal"] = {
						["Points"] = {
							"TOPLEFT", -- [1]
							nil, -- [2]
							"TOPLEFT", -- [3]
							16, -- [4]
							-116.0000076293945, -- [5]
						},
					},
					["TradeFrame"] = {
						["Points"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							nil, -- [4]
							-116.0000228881836, -- [5]
						},
					},
				},
				["OzCooldowns"] = {
					["StatusBarTexture"] = "|CFF8E44ADm|r|CFF2ECC71Media|r |CFF3498DB4a|r",
					["StackFont"] = "PT Sans Narrow",
					["StackFontFlag"] = "NONE",
					["Enable"] = false,
				},
				["QuestSounds"] = {
					["Enable"] = false,
				},
				["stAddonManager"] = {
					["FontSize"] = 12,
					["ButtonHeight"] = 15,
					["ClassColor"] = true,
					["CheckTexture"] = "|CFF8E44ADm|r|CFF2ECC71Media|r |CFF3498DB4a|r",
					["FrameWidth"] = 350,
				},
				["MouseoverAuras"] = {
					["Enable"] = false,
				},
				["iFilger"] = {
					["Enhancements"] = {
						["Enable"] = false,
					},
					["FocusDebuffs"] = {
						["Enable"] = false,
					},
					["RaidDebuffs"] = {
						["Enable"] = false,
					},
					["FocusBuffs"] = {
						["Enable"] = false,
					},
					["Procs"] = {
						["Enable"] = false,
					},
					["Cooldowns"] = {
						["StatusBarTexture"] = "|CFF8E44ADm|r|CFF2ECC71Media|r |CFF3498DB4a|r",
						["StatusBarDirection"] = "DOWN",
						["StackCountFont"] = "PT Sans Narrow",
						["StatusBar"] = true,
						["StatusBarFont"] = "PT Sans Narrow",
						["StackCountFontFlag"] = "NONE",
						["StatusBarFontFlag"] = "NONE",
						["FollowCooldownText"] = true,
					},
					["Buffs"] = {
						["Enable"] = false,
					},
					["TargetDebuffs"] = {
						["Enable"] = false,
					},
				},
				["ReputationReward"] = {
					["ShowAll"] = true,
				},
				["EnhancedFriendsList"] = {
					["Texture"] = "Gloss",
					["ShowStatusBackground"] = true,
				},
				["AuraReminder"] = {
					["Enable"] = false,
				},
				["cooldown"] = {
					["enable"] = false,
				},
				["FasterLoot"] = {
					["Enable"] = false,
				},
			},
		},
	}
end