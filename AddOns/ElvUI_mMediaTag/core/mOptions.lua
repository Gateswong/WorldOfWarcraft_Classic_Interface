local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);
local addon, ns = ...

P[mPlugin] = {
	["mMsg"] 				= true,
	["mTIcon"] 				= true,
	["mTIconSize"] 			= 32,
	["mProfUp"] 			= false,
	["mProfIcon"] 			= true,
	["mMenuUp"] 			= false,
	["mMenuColor"] 			= true,
	["mClassColorHover"] 	= true,
	["mHoverTexture"] 		= "|CFF8E44ADm|r|CFF2ECC71Media|r |CFF3498DB4a|r",
	["mPluginVersion"] 		= 0,
	["mClassNameplate"] 	= false,
	["mBackup"] 			= false,
	["mBackupHover"] 		= {
								["cr"] = 0, 
								["cg"] = 0, 
								["cb"] = 0, 
								["br"] = 0, 
								["bg"] = 0, 
								["bb"] = 0
							},
	["mBackupHoverBorder"] 	= nil,
	["InstancInfoToolTip"]	= true,
	["InstancInfoName"]		= true,
	["SAchievement10"]		= false,
	["SAchievement15"]		= false,
	["SAchievement0"]		= false,
	["DAchievement10"]		= false,
	["DAchievement15"]		= false,
	["DAchievement0"]		= false,
	["mAchievementIcon"]	= false,
	["SAffix"]				= false,
	["SKeystone"]			= false,
	["DKeystone"]			= true,
	["DAffix"]				= true,
	["DInstancInfoName"]	= true,
	["cClassRare"]			= {
								["b"] = 0.77254901960784,
								["color"] = "|cff8356c5",
								["g"] = 0.33725490196078,
								["r"] = 0.51372549019608,
							},
	["cClassRareElite"]		= {
								["b"] = 0.78823529411765,
								["color"] = "|cffab54c9",
								["g"] = 0.32941176470588,
								["r"] = 0.67058823529412,
							},
	["cClassElite"]			= {
								["b"] = 0.83529411764706,
								["color"] = "|cffff68d5",
								["g"] = 0.4078431372549,
								["r"] = 1,
							},
	["cClassBoss"]			= {
								["b"] = 0.31372549019608,
								["color"] = "|cffe52b50",
								["g"] = 0.16862745098039,
								["r"] = 0.89803921568627,
							},
	["cGeneralAFK"]			= {
								["b"] = 0.32156862745098,
								["color"] = "|cffff2051",
								["g"] = 0.12549019607843,
								["r"] = 1,
							},
	["cGeneralTank"]		= {
								["b"] = 1,
								["color"] = "|cff007fff",
								["g"] = 0.49803921568627,
								["r"] = 0,
							},
	["cGeneralHeal"]		= {
								["b"] = 0.6,
								["color"] = "|cff00cc99",
								["g"] = 0.8,
								["r"] = 0,
							},
	["cGeneralZzz"]			= {
								["b"] 		= 0.34509803921569,
								["color"] 	= "|cfff7d358",
								["g"] 		= 0.82745098039216,
								["r"] 		= 0.96862745098039,
							},
	["cGeneralLevel"]		= {
								["b"] = 0.24313725490196,
								["color"] = "|cffff033e",
								["g"] = 0.011764705882353,
								["r"] = 1,
							},
}

function mMT:InsertOptions()
	E.Options.args.mMediaTag = {
		order = 100,
		type = "group",
		childGroups = 'tab',
		name = ns.mName,
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = ns.mName,
			},
			logo1 = {
				order = 2,
				type = 'description',
				name = "",
				fontSize = 'medium',
				image = function() return 'Interface\\AddOns\\ElvUI_mMediaTag\\media\\textures\\logo.tga', 320, 80 end,
			},
			header2 = {
				order = 3,
				type = "header",
				name = "|CFF8E44ADby|r |CFF2ECC71Blin|r|CFF3498DBkii|r",
			},
			spacer1 = {
				order = 4,
				type = "description",
				name = "\n",
			},
			setting1 = {
				order = 1,
				type = "group",
				name = L["General"],
				args = {
					subsetting1 = {
						order = 1,
						type = "group",
						name = L["Greeting text"],
						args = {
							grpsetting1 = {
								order = 1,
								type = 'toggle',
								name = L["Greeting text at start"],
								desc = L["Enables or disables the welcome text, at startup."],
								get = function(info)
									return E.db[mPlugin].mMsg
								end,
								set = function(info, value)
									E.db[mPlugin].mMsg = value
								end,
							},
						},
					},
					subsetting2 = {
						order = 2,
						type = "group",
						name = L["Nameplate Settings"],
						args = {
							grpsetting1 = {
							order = 1,
							type = 'toggle',
							name = L["Class colored Namplates"],
							desc = L["Class colored Namplates Hover and Boarder color."],
							get = function(info)
								return E.db[mPlugin].mClassNameplate
							end,
							set = function(info, value)
								E.db[mPlugin].mClassNameplate = value
								if value == false then
									mMT:mRestoreNameplateSettings()
								else
									mMT:mBackupNameplateSettings()
								end
								E:StaticPopup_Show("CONFIG_RL")
							end,
							},
							spacer1 = {
							order = 2,
							type = "description",
							name = "\n\n\n",
							},
							grpsetting2 = {
							order = 3,
							type = "execute",
							name = L["Reset Backup"],
							desc = L["Resets Namplate Backups"],
							func = function()
								mMT:mRestoreNameplateSettings()
								E.db[mPlugin].mClassNameplate = false
								E.db[mPlugin].mBackup = false
								E:StaticPopup_Show("CONFIG_RL")
							end,
							},
						},
					},
					subsetting3 = {
						order = 3,
						type = "group",
						name = L["Tooltip"],
						args = {
							grpsetting1 = {
								order = 1,
								type = 'toggle',
								name = L["Tooltip Icon"],
								desc = L["Enables or disables Tooltip Icon"],
								get = function(info)
									return E.db[mPlugin].mTIcon
								end,
								set = function(info, value)
									E.db[mPlugin].mTIcon = value
								end,
							},
							spacer1 = {
							order = 2,
							type = "description",
							name = "\n\n",
							},
							grpsetting2 = {
								order = 3,
								name = L["Icon size"],
								desc = L["Tooltip Icon size."],
								type = "range",
								min = 16, max = 128, step = 2,
								get = function(info)
								return E.db[mPlugin].mTIconSize
								end,
								set = function(info, value)
									E.db[mPlugin].mTIconSize = value
								end,
							},
						},
					},
					subsetting3 = {
						order = 3,
						type = "group",
						name = L["Menu Settings"],
						args = {
							grpsetting1 = {
								order = 1,
								type = 'toggle',
								name = L["Class colered hover texture"],
								desc = L["Enables or disables Class colered hover texture."],
								get = function(info)
									return E.db[mPlugin].mClassColorHover
								end,
								set = function(info, value)
									E.db[mPlugin].mClassColorHover = value
									E:StaticPopup_Show("CONFIG_RL")
								end,
							},
							spacer1 = {
							order = 2,
							type = "description",
							name = "\n\n",
							},
							grpsetting2 = {
								order = 3,
								type = "select",
								dialogControl = 'LSM30_Statusbar',
								name = L["Menu Hover Texture"],
								values = _G.AceGUIWidgetLSMlists.statusbar,
								get = function(info)
									return E.db[mPlugin].mHoverTexture
								end,
								set = function(info, value)
									E.db[mPlugin].mHoverTexture = value;
									E:StaticPopup_Show("CONFIG_RL")
								end,
							},
						},
					},
				},
			},
			setting2 = {
				order = 2,
				type = "group",
				name = L["Datatext Settings"],
				args = {
					subsetting1 = {
						order = 1,
						type = "group",
						name = L["Profession Menu"],
						args = {
							header1 = {
							order = 1,
							type = "header",
							name = L["General"],
							},
							grpsetting1 = {
								order = 2,
								type = 'toggle',
								name = L["Fold up"],
								desc = L["When activated, the Profession Menu opens upwards."],
								get = function(info)
									return E.db[mPlugin].mProfUp
								end,
								set = function(info, value)
									E.db[mPlugin].mProfUp = value
								end,
							},
							spacer1 = {
							order = 3,
							type = "description",
							name = "\n",
							},
							grpsetting2 = {
								order = 3,
								type = 'toggle',
								name = L["Symbols"],
								desc = L["Displays the icons for the professions in the menu."],
								get = function(info)
									return E.db[mPlugin].mProfIcon
								end,
								set = function(info, value)
									E.db[mPlugin].mProfIcon = value
								end,
							},
						},
					},
					subsetting2 = {
						order = 2,
						type = "group",
						name = L['System Menu'],
						args = {
							header1 = {
							order = 1,
							type = "header",
							name = L["General"],
							},
							grpsetting1 = {
								order = 2,
								type = 'toggle',
								name = L["Fold up"],
								desc = L["When activated, the System Menu opens upwards."],
								get = function(info)
									return E.db[mPlugin].mMenuUp
								end,
								set = function(info, value)
									E.db[mPlugin].mMenuUp = value
								end,
							},
							grpsetting2 = {
								order = 3,
								type = 'toggle',
								name = L["Colored System Menu"],
								desc = L["Activates a colored system menu."],
								get = function(info)
									return E.db[mPlugin].mMenuColor
								end,
								set = function(info, value)
									E.db[mPlugin].mMenuColor = value
								end,
							},
							grpsetting3 = {
								order = 4,
								type = 'toggle',
								name = L["Tooltip Instanceinfo"],
								desc = L["Shows Inctance Info and Mythic Plus key tone in tooltip."],
								get = function(info)
									return E.db[mPlugin].InstancInfoToolTip
								end,
								set = function(info, value)
									E.db[mPlugin].InstancInfoToolTip = value
								end,
							},
							spacer2 = {
							order = 5,
							type = "description",
							name = "\n\n",
							},
							header2 = {
							order = 6,
							type = "header",
							name = L["Tooltip Mythic Plus"],
							},
							grpsetting4 = {
								order = 7,
								type = 'toggle',
								name = L["Text to Instance Name"],
								desc = L["Display the instance name instead of System Menu."],
								get = function(info)
									return E.db[mPlugin].InstancInfoName
								end,
								set = function(info, value)
									E.db[mPlugin].InstancInfoName = value
								end,
							},
							grpsetting5 = {
								order = 8,
								type = 'toggle',
								name = L["Weekly Affixes"],
								desc = L["Shows the Weekly Affixes."],
								get = function(info)
									return E.db[mPlugin].SAffix
								end,
								set = function(info, value)
									E.db[mPlugin].SAffix = value
								end,
							},
							grpsetting6 = {
								order = 9,
								type = 'toggle',
								name = L["Tooltip Keystone"],
								desc = L["Shows your Keystone in the tooltip."],
								get = function(info)
									return E.db[mPlugin].SKeystone
								end,
								set = function(info, value)
									E.db[mPlugin].SKeystone = value
								end,
							},
							spacer3 = {
							order = 10,
							type = "description",
							name = "\n\n",
							},
							header3 = {
							order = 11,
							type = "header",
							name = L["Tooltip Achievement"],
							},
							grpsetting7 = {
								order = 12,
								type = 'toggle',
								name = L["Mythic +10 Achievement"],
								desc = L["Display the Achievement for Mythic +10 Dungeons."],
								get = function(info)
									return E.db[mPlugin].SAchievement10
								end,
								set = function(info, value)
									E.db[mPlugin].SAchievement10 = value
								end,
							},
							grpsetting8 = {
								order = 13,
								type = 'toggle',
								name = L["Mythic +15 Achievement"],
								desc = L["Display the Achievement for Mythic +15 Dungeons."],
								get = function(info)
									return E.db[mPlugin].SAchievement15
								end,
								set = function(info, value)
									E.db[mPlugin].SAchievement15 = value
								end,
							},
							grpsetting9 = {
								order = 14,
								type = 'toggle',
								name = L["Dungeon Achievement"],
								desc = L["Display the Achievement for Dungeons."],
								get = function(info)
									return E.db[mPlugin].SAchievement0
								end,
								set = function(info, value)
									E.db[mPlugin].SAchievement0 = value
								end,
							},
							grpsetting10 = {
								order = 15,
								type = 'toggle',
								name = L["Achievement Icon"],
								desc = L["Display the Achievement Icon."],
								get = function(info)
									return E.db[mPlugin].mAchievementIcon
								end,
								set = function(info, value)
									E.db[mPlugin].mAchievementIcon = value
								end,
							},
						},
					},
					subsetting3 = {
						order = 3,
						type = "group",
						name = L['Dungeon'],
						args = {
							header1 = {
							order = 1,
							type = "header",
							name = L["General"],
							},
							grpsetting1 = {
								order = 2,
								type = 'toggle',
								name = L["Text to Instance Name"],
								desc = L["Display the instance name instead of System Menu."],
								get = function(info)
									return E.db[mPlugin].DInstancInfoName
								end,
								set = function(info, value)
									E.db[mPlugin].DInstancInfoName = value
								end,
							},
							spacer1 = {
							order = 3,
							type = "description",
							name = "\n\n",
							},
							header2 = {
							order = 4,
							type = "header",
							name = L["Tooltip Mythic Plus"],
							},
							grpsetting2 = {
								order = 5,
								type = 'toggle',
								name = L["Weekly Affixes"],
								desc = L["Shows the Weekly Affixes."],
								get = function(info)
									return E.db[mPlugin].DAffix
								end,
								set = function(info, value)
									E.db[mPlugin].DAffix = value
								end,
							},
							grpsetting3 = {
								order = 6,
								type = 'toggle',
								name = L["Tooltip Keystone"],
								desc = L["Shows your Keystone in the tooltip."],
								get = function(info)
									return E.db[mPlugin].DKeystone
								end,
								set = function(info, value)
									E.db[mPlugin].DKeystone = value
								end,
							},
							spacer2 = {
							order = 7,
							type = "description",
							name = "\n\n",
							},
							header3 = {
							order = 8,
							type = "header",
							name = L["Tooltip Achievement"],
							},
							grpsetting4 = {
								order = 9,
								type = 'toggle',
								name = L["Mythic +10 Achievement"],
								desc = L["Display the Achievement for Mythic +10 Dungeons."],
								get = function(info)
									return E.db[mPlugin].DAchievement10
								end,
								set = function(info, value)
									E.db[mPlugin].DAchievement10 = value
								end,
							},
							grpsetting5 = {
								order = 10,
								type = 'toggle',
								name = L["Mythic +15 Achievement"],
								desc = L["Display the Achievement for Mythic +15 Dungeons."],
								get = function(info)
									return E.db[mPlugin].DAchievement15
								end,
								set = function(info, value)
									E.db[mPlugin].DAchievement15 = value
								end,
							},
							grpsetting6 = {
								order = 11,
								type = 'toggle',
								name = L["Dungeon Achievement"],
								desc = L["Display the Achievement for Dungeons."],
								get = function(info)
									return E.db[mPlugin].DAchievement0
								end,
								set = function(info, value)
									E.db[mPlugin].DAchievement0 = value
								end,
							},
							grpsetting7 = {
								order = 11,
								type = 'toggle',
								name = L["Achievement Icon"],
								desc = L["Display the Achievement Icon."],
								get = function(info)
									return E.db[mPlugin].mAchievementIcon
								end,
								set = function(info, value)
									E.db[mPlugin].mAchievementIcon = value
								end,
							},
						},
					},
				},
			},
			setting3 = {
				order = 3,
				type = "group",
				name = L["Tags"],
				args = {
					subsetting1 = {
						order = 1,
						type = "group",
						name = L["Colors"],
						args = {
							header1 = {
							order = 1,
							type = "header",
							name = L["Class"],
							},
							colorsetting1 = {
								type = 'color',
								order = 2,
								name = "Rare",
								desc = L["Class Colors"],
								hasAlpha = false,
								get = function(info)
									local t = E.db[mPlugin].cClassRare
									return t.r, t.g, t.b
								end,
								set = function(info, r, g, b)
									local t = E.db[mPlugin].cClassRare
									t.r, t.g, t.b, t.color = r, g, b, E:RGBToHex(r, g, b)
								end,
							},
							colorsetting2 = {
								type = 'color',
								order = 3,
								name = "Rare Elite",
								desc = L["Class Colors"],
								hasAlpha = false,
								get = function(info)
									local t = E.db[mPlugin].cClassRareElite
									return t.r, t.g, t.b
								end,
								set = function(info, r, g, b)
									local t = E.db[mPlugin].cClassRareElite
									t.r, t.g, t.b, t.color = r, g, b, E:RGBToHex(r, g, b)
								end,
							},
							colorsetting3 = {
								type = 'color',
								order = 4,
								name = "Elite",
								desc = L["Class Colors"],
								hasAlpha = false,
								get = function(info)
									local t = E.db[mPlugin].cClassElite
									return t.r, t.g, t.b
								end,
								set = function(info, r, g, b)
									local t = E.db[mPlugin].cClassElite
									t.r, t.g, t.b, t.color = r, g, b, E:RGBToHex(r, g, b)
									
								end,
							},
							colorsetting4 = {
								type = 'color',
								order = 4,
								name = "Boss",
								desc = L["Class Colors"],
								hasAlpha = false,
								get = function(info)
									local t = E.db[mPlugin].cClassBoss
									return t.r, t.g, t.b
								end,
								set = function(info, r, g, b)
									local t = E.db[mPlugin].cClassBoss
									t.r, t.g, t.b, t.color = r, g, b, E:RGBToHex(r, g, b)
								end,
							},
							header2 = {
							order = 5,
							type = "header",
							name = L["General"],
							},
							colorsetting5 = {
								type = 'color',
								order = 6,
								name = "AFK",
								desc = L["AFK Color"],
								hasAlpha = false,
								get = function(info)
									local t = E.db[mPlugin].cGeneralAFK
									return t.r, t.g, t.b
								end,
								set = function(info, r, g, b)
									local t = E.db[mPlugin].cGeneralAFK
									t.r, t.g, t.b, t.color = r, g, b, E:RGBToHex(r, g, b)
								end,
							},
							colorsetting6 = {
								type = 'color',
								order = 7,
								name = "Tank",
								desc = L["Tank Color"],
								hasAlpha = false,
								get = function(info)
									local t = E.db[mPlugin].cGeneralTank
									return t.r, t.g, t.b
								end,
								set = function(info, r, g, b)
									local t = E.db[mPlugin].cGeneralTank
									t.r, t.g, t.b, t.color = r, g, b, E:RGBToHex(r, g, b)
								end,
							},
							colorsetting7 = {
								type = 'color',
								order = 8,
								name = "Heal",
								desc = L["Heal Color"],
								hasAlpha = false,
								get = function(info)
									local t = E.db[mPlugin].cGeneralHeal
									return t.r, t.g, t.b
								end,
								set = function(info, r, g, b)
									local t = E.db[mPlugin].cGeneralHeal
									t.r, t.g, t.b, t.color = r, g, b, E:RGBToHex(r, g, b)
								end,
							},
							colorsetting8 = {
								type = 'color',
								order = 9,
								name = "Zzz",
								desc = L["Resting Zzz Color"],
								hasAlpha = false,
								get = function(info)
									local t = E.db[mPlugin].cGeneralZzz
									return t.r, t.g, t.b
								end,
								set = function(info, r, g, b)
									local t = E.db[mPlugin].cGeneralZzz
									t.r, t.g, t.b, t.color = r, g, b, E:RGBToHex(r, g, b)
								end,
							},
							colorsetting9 = {
								type = 'color',
								order = 10,
								name = "Level ??",
								desc = L["Boss Level ?? Color"],
								hasAlpha = false,
								get = function(info)
									local t = E.db[mPlugin].cGeneralLevel
									return t.r, t.g, t.b
								end,
								set = function(info, r, g, b)
									local t = E.db[mPlugin].cGeneralLevel
									t.r, t.g, t.b, t.color = r, g, b, E:RGBToHex(r, g, b)
								end,
							},
						},
					},
					subsetting2 = {
						order = 2,
						type = "group",
						name = L["Tags"],
						args = {
							tag1 = {
									order = 1,
									name = L["Classes are fully written."],
									type = 'input',
									width = 'full',
									get = function() return "mClass" end,
							},
							tag2 = {
									order = 2,
									name = L["Classes are fully written with spac on left side."],
									type = 'input',
									width = 'full',
									get = function() return "mClass:space-left" end,
							},
							tag3 = {
									order = 3,
									name = L["Classes are fully written with spac on right side."],
									type = 'input',
									width = 'full',
									get = function() return "mClass:space-right" end,
							},
							tag4 = {
									order = 4,
									name = L["Classes are short written."],
									type = 'input',
									width = 'full',
									get = function() return "mClass:short" end,
							},
							tag5 = {
									order = 5,
									name = L["Classes are short written with spac on left side."],
									type = 'input',
									width = 'full',
									get = function() return "mClass:short-space-left" end,
							},
							tag6 = {
									order = 6,
									name = L["Classes are short written with spac on right side."],
									type = 'input',
									width = 'full',
									get = function() return "mClass:short-space-right" end,
							},
							tag7 = {
									order = 7,
									name = L["Colors Text by Class."],
									type = 'input',
									width = 'full',
									get = function() return "mColor" end,
							},
							tag8 = {
									order = 8,
									name = L["Colors Text by Target Class."],
									type = 'input',
									width = 'full',
									get = function() return "mColor:target" end,
							},
							tag9 = {
									order = 9,
									name = L["Health changes between Max Health and Percent in fight."],
									type = 'input',
									width = 'full',
									get = function() return "mHealth" end,
							},
							tag10 = {
									order = 10,
									name = L["Health changes between Max Health and Percent in fight, without AFK."],
									type = 'input',
									width = 'full',
									get = function() return "mHealth:NoAFK" end,
							},
							tag11 = {
									order = 11,
									name = L["Health changes between Max Health and Current - Percent in fight."],
									type = 'input',
									width = 'full',
									get = function() return "mHealth:current-percent" end,
							},
							tag12 = {
									order = 12,
									name = L["Health changes between Max Health and Current - Percent in fight, without AFK."],
									type = 'input',
									width = 'full',
									get = function() return "mHealth:NoAFK-current-percent" end,
							},
							tag13 = {
									order = 13,
									name = L["mHealth wit Statustimer for Dead and AFK."],
									type = 'input',
									width = 'full',
									get = function() return "mHealth:timer" end,
							},
							tag14 = {
									order = 14,
									name = L["mHealth wit Statustimer for Dead, without AFK."],
									type = 'input',
									width = 'full',
									get = function() return "mHealth:NoAFK-timer" end,
							},
							tag15 = {
									order = 15,
									name = L["Coloured Statustext."],
									type = 'input',
									width = 'full',
									get = function() return "mStatus" end,
							},
							tag16 = {
									order = 16,
									name = L["Coloured Statustext, with timer for Dead and AFK."],
									type = 'input',
									width = 'full',
									get = function() return "mStatus:timer" end,
							},
							tag17 = {
									order = 17,
									name = L["Coloured AFK text."],
									type = 'input',
									width = 'full',
									get = function() return "mAFK" end,
							},
							tag18 = {
									order = 18,
									name = L["Tank and Heal Role written."],
									type = 'input',
									width = 'full',
									get = function() return "mRole" end,
							},
							tag19 = {
									order = 19,
									name = L["Level changes to resting in the City."],
									type = 'input',
									width = 'full',
									get = function() return "mLevel" end,
							},
							tag20 = {
									order = 20,
									name = L["Same as mLevel (hides Level if it is equal)."],
									type = 'input',
									width = 'full',
									get = function() return "mLevelSmart" end,
							},
							tag21 = {
									order = 21,
									name = L["Group number with full text (Group 3)."],
									type = 'input',
									width = 'full',
									get = function() return "mGroup" end,
							},
							tag22 = {
									order = 22,
									name = L["Group number with abbreviated text (Grp. 3)."],
									type = 'input',
									width = 'full',
									get = function() return "mGroup:short" end,
							},
							tag23 = {
									order = 23,
									name = L["PvP text with symbol left."],
									type = 'input',
									width = 'full',
									get = function() return "mPvP:left" end,
							},
							tag24 = {
									order = 24,
									name = L["PvP text with symbol right."],
									type = 'input',
									width = 'full',
									get = function() return "mPvP:right" end,
							},
							tag25 = {
									order = 25,
									name = L["Shows the faction icon when PvP is active."],
									type = 'input',
									width = 'full',
									get = function() return "mPvP:icon" end,
							},
						},
					},
				},
			},
			setting4 = {
				order = 4,
				type = "group",
				name = L['Chatbaground'],
				args = {
					chatdescription1 = {
							order = 1,
							type = "description",
							name = L["Chath backgrounds, copy the path from the input fields to the chat settings to use the backgrounds."],
					},
					chatdescription2 = {
							order = 2,
							type = "description",
							name = "\n\n\n",
					},
					chat1 = {
							order = 3,
							name = "mChat1.1",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat1.1.tga" end,
					},
					chat2 = {
							order = 4,
							name = "mChat1.2",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat1.2.tga" end,
					},
					chat3 = {
							order = 5,
							name = "mChat2.1",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat2.1.tga" end,
					},
					chat4 = {
							order = 6,
							name = "mChat2.2",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat2.2.tga" end,
					},
					chat5 = {
							order = 7,
							name = "mChat3.1",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat3.1.tga" end,
					},
					chat6 = {
							order = 8,
							name = "mChat3.2",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat3.2.tga" end,
					},
					chat7 = {
							order = 9,
							name = "mChat4.1",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat4.1.tga" end,
					},
					chat8 = {
							order = 10,
							name = "mChat4.2",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat4.2.tga" end,
					},
					chat9 = {
							order = 11,
							name = "mChat5.1",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat5.1.tga" end,
					},
					chat10 = {
							order = 12,
							name = "mChat5.2",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat5.2.tga" end,
					},
					chat11 = {
							order = 13,
							name = "mChat6.1",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat6.1.tga" end,
					},
					chat12 = {
							order = 14,
							name = "mChat6.2",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat6.2.tga" end,
					},
					chat13 = {
							order = 15,
							name = "mChat7.1",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat7.1.tga" end,
					},
					chat14 = {
							order = 16,
							name = "mChat7.2",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat7.2.tga" end,
					},
					chat15 = {
							order = 17,
							name = "mChat8",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat8.tga" end,
					},
					chat16 = {
							order = 18,
							name = "mChat9",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat9.tga" end,
					},
					chat17 = {
							order = 19,
							name = "mChat10",
							type = 'input',
							width = 'full',
							get = function() return "Interface\\Addons\\ElvUI_mMediaTag\\media\\textures\\Chat\\mChat10.tga" end,
					},
				},
			},
			setting4 = {
				order = 4,
				type = "group",
				name = L['MaUI v3 Support'],
				args = {
					header1 = {
						order = 1,
						type = "header",
						name = ns.mName,
					},
					description1 = {
					order = 2,
					type = "description",
					name = L["Here you can install addon profiles and more for my ElvUI profile MaUI v.3 and the edits."],
					},
					spacer1 = {
						order = 3,
						type = "description",
						name = "\n\n\n",
					},
					subsetting1 = {
						order = 1,
						type = "group",
						name = L["Addon Profile"],
						args = {
							description1 = {
								order = 1,
								type = "description",
								name = L["Here you can install profiles for the different supported addons."],
							},
							spacer1 = {
								order = 2,
								type = "description",
								name = "\n",
							},
							header1= {
								order = 3,
								type = "header",
								name = L["Supported Addons"],
							},
							spacer2 = {
								order = 4,
								type = "description",
								name = "\n",
							},
							description2 = {
								order = 5,
								type = "description",
								name = mMT:CheckAddons(),
							},
							spacer3 = {
								order = 6,
								type = "description",
								name = "\n",
							},
							header2 = {
								order = 7,
								type = "header",
								name = L["Install Addon Profiles"],
							},
							spacer4 = {
								order = 8,
								type = "description",
								name = "\n\n",
							},
							install = {
								order = 9,
								type = "execute",
								name = L["Install"],
								desc = L["Run the installation process."],
								func = function() mMT:mSetup() end,
							},
						},
					},
					subsetting2 = {
						order = 2,
						type = "group",
						name = L["MaUI v3 Profiles"],
						args = {
							description1 = {
								order = 1,
								type = "description",
								name = L["Here you can display the Profile Import texts for importing."],
							},
							spacer1 = {
								order = 2,
								type = "description",
								name = "\n\n",
							},
							description2 = {
								order = 3,
								type = "description",
								name = format("%s\n\n%s|CFF8E44ADMaUI|r |CFF2ECC71v|r|CFF3498DB3|r Profile: |CFF0000ffTank/DD|r\n%s|CFF8E44ADMaUI|r |CFF2ECC71v|r|CFF3498DB3|r Profile: |CFF03ea18Heal|r\n%s|CFF8E44ADMaUI|r |CFF2ECC71v|r|CFF3498DB3|r Profile: |CFFff3333Namplate Stylfilter|r", L["Last Update:"], ns.mDateTankDD, ns.mDateHeal, ns.mDateNameplate)
							},
							spacer2 = {
								order = 4,
								type = "description",
								name = "\n\n",
							},
							button1= {
								order = 6,
								type = "execute",
								name = "Tank/DD",
								func = function() 
									mMT:mProfileWindow(mMT:mTankDDProfile(), "|CFF8E44ADMaUI|r |CFF2ECC71v|r|CFF3498DB3|r Profile: |CFF0000ffTank/DD|r")
								end,
							},
							button2= {
								order = 7,
								type = "execute",
								name = "Heal",
								func = function() 
									mMT:mProfileWindow(mMT:mHealProfile(), "|CFF8E44ADMaUI|r |CFF2ECC71v|r|CFF3498DB3|r Profile: |CFF03ea18Heal|r")
								end,
							},
							button3= {
								order = 8,
								type = "execute",
								name = "Nameplate Stylfilter",
								func = function() 
									mMT:mProfileWindow(mMT:NamplateProfile(), "|CFF8E44ADMaUI|r |CFF2ECC71v|r|CFF3498DB3|r Profile: |CFFff3333Namplate Stylfilter|r")
								end,
							},
							spacer3 = {
								order = 9,
								type = "description",
								name = "\n\n",
							},
							header100 = {
								order = 100,
								type = "header",
								name = L["MaUI v3 Profiles on Git"],
							},
							spacer101 = {
								order = 101,
								type = "description",
								name = "\n",
							},
							description101 = {
								order = 102,
								type = "description",
								name = L["Here you can find the MaUI v3 Tank/DD/Heal profile on Git"],
							},
							spacer102 = {
								order = 103,
								type = "description",
								name = "\n\n",
							},
							button101= {
								order = 104,
								type = "execute",
								name = L["MaUI v3 Retail"],
								func = function() E:StaticPopup_Show('ELVUI_EDITBOX', nil, nil, 'https://git.tukui.org/Blinkii/elvui-blinkiis-profile/-/tree/master/WoW%209.0.1') end,
							},
						},
					},
					subsetting3 = {
						order = 3,
						type = "group",
						name = L["Sandys UI Profile"],
						args = {
							description1 = {
								order = 1,
								type = "description",
								name = L["Here you can display the Profile Import texts for importing."],
							},
							spacer1 = {
								order = 2,
								type = "description",
								name = "\n\n",
							},
							description2 = {
								order = 3,
								type = "description",
								name = format("%s\n\n%sProfile: Sandys UI (Tank/DD/Heal)", L["Last Update:"], ns.mDateSandysUI)
							},
							spacer2 = {
								order = 4,
								type = "description",
								name = "\n\n",
							},
							button1= {
								order = 6,
								type = "execute",
								name = "Tank/DD/Heal",
								func = function() 
									mMT:mProfileWindow(mMT:SandysUIProfile(), "Profile: Sandys UI (Tank/DD/Heal)")
								end,
							},
						},
					},
					subsetting3 = {
						order = 3,
						type = "group",
						name = L["Weakaura"],
						args = {
							description1 = {
								order = 1,
								type = "description",
								name = L["Here you can display the Weakaura Import texts for importing."],
							},
							spacer1 = {
								order = 2,
								type = "description",
								name = "\n\n",
							},
							description2 = {
								order = 3,
								type = "description",
								name = format("%s\n\n%sProfile: Sandys UI (Tank/DD/Heal)", L["Last Update:"], ns.mDateSandysUI)
							},
							spacer2 = {
								order = 4,
								type = "description",
								name = "\n\n",
							},
							button1= {
								order = 6,
								type = "execute",
								name = "Tank/DD/Heal",
								func = function() 
									mMT:mProfileWindow(mMT:SandysUIProfile(), "Profile: Sandys UI (Tank/DD/Heal)")
								end,
							},
						},
					},
				},
			},
			setting10 = {
				order = 10,
				type = "group",
				name = L["About"],
				args = {
					header1 = {
						order = 1,
						type = "header",
						name = ns.mName,
					},
					description1 = {
						order = 2,
						type = "description",
						name = ns.mName .. L[" is an addon for ElvUI with additional Statusbar textures, Tags, a game menu and professional menu for the datatext bars."],
					},
					spacer1 = {
						order = 3,
						type = "description",
						name = "\n\n",
					},
					header2 = {
						order = 4,
						type = "header",
						name = L["Contact & Git"],
					},
					spacer2 = {
						order = 5,
						type = "description",
						name = "\n\n",
					},
					button1 = {
						order = 6,
						type = "execute",
						name = L["Contact"],
						func = function() E:StaticPopup_Show('ELVUI_EDITBOX', nil, nil, 'mmediatag@gmx.de') end,
					},
					button2 = {
						order = 7,
						type = "execute",
						name = L["Git"],
						func = function() E:StaticPopup_Show('ELVUI_EDITBOX', nil, nil, 'https://git.tukui.org/Blinkii/mmediatag') end,
					},
					button3 = {
						order = 8,
						type = "execute",
						name = L["Changelog"],
						func = function() mMT:Changelog() end,
					},
				},
			},
		},
	}
end