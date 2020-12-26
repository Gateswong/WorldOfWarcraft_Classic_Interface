local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);
local DT = E:GetModule("DataTexts");
local addon, ns = ...
local displayString = ""
local mText = L["Game Menu"]
local menuList = {}
local menuFrame = CreateFrame('Frame', 'mSystemMenu', E.UIParent, 'BackdropTemplate')
	  menuFrame:SetTemplate("Transparent", true)

local function mColor(color)
	local mSetting = E.db[mPlugin].mMenuColor 
	if mSetting then
		if color == 1 then
			return ns.mColor1
		elseif color == 2 then
			return ns.mColor2
		elseif color == 3 then
			return ns.mColor3
		elseif color == 4 then
			return ns.mColor4
		elseif color == 5 then
			return ns.mColor5
		elseif color == 6 then
			return ns.mColor6
		elseif color == 7 then
			return ns.mColor7
		end
	else
		return ns.mColor1
	end
end


local function OnEvent(self)
	if E.db[mPlugin].InstancInfoName then 
		local inInstance, _ = IsInInstance()
		if inInstance then
			if C_MythicPlus.IsMythicPlusActive()  and (C_ChallengeMode.GetActiveChallengeMapID() ~= nil) then
				self.text:SetText(format("%s%s|r +%s", mMT:DungeonInfo("color"), E:ShortenString(mMT:DungeonInfo("txt"), 20), mMT:MythicPlusDungeon("txt")))
			else
				self.text:SetText(format("%s%s|r", mMT:DungeonInfo("color"), E:ShortenString(mMT:DungeonInfo("txt"), 30)))
			end
		else
			self.text:SetFormattedText(displayString, mText)
		end
	else
		self.text:SetFormattedText(displayString, mText)
	end
end

local function OnClick(self, button)
	DT.tooltip:Hide()
	if button == "LeftButton" then
		menuList = {}
		menuList = {
			{text = CHARACTER_BUTTON, isTitle = false, color = mColor(2),
			func = function() ToggleCharacter("PaperDollFrame") end},
			{text = SPELLBOOK_ABILITIES_BUTTON, isTitle = false, color = mColor(2),
			func = function() if not SpellBookFrame:IsShown() then ShowUIPanel(SpellBookFrame) else HideUIPanel(SpellBookFrame) end end},
			{text = TALENTS_BUTTON, isTitle = false,  color = mColor(2),
			func = function()
				if not PlayerTalentFrame then
					TalentFrame_LoadUI()
				end

				if not PlayerTalentFrame:IsShown() then
					ShowUIPanel(PlayerTalentFrame)
				else
					HideUIPanel(PlayerTalentFrame)
				end
			end},
			{text = ACHIEVEMENT_BUTTON, isTitle = false, color = mColor(2),
			func = function() ToggleAchievementFrame() end},
			
			{text = "", isTitle = true, func = function() end},
			
			{text = GARRISON_LANDING_PAGE_TITLE, isTitle = false, color = mColor(7),
			func = function() GarrisonLandingPageMinimapButton_OnClick() end},
			{text = COLLECTIONS, isTitle = false, color = mColor(7),
			func = function()
				ToggleCollectionsJournal()
			end},
			
			{text = "", isTitle = true, func = function() end},
			
			{text = TIMEMANAGER_TITLE, isTitle = false, color = mColor(1),
			func = function() ToggleFrame(TimeManagerFrame) end},
			{text = L["Calendar"], isTitle = false, color = mColor(1),
			func = function() GameTimeFrame:Click() end},

			{text = "", isTitle = true, func = function() end},
			
			{text = SOCIAL_BUTTON, isTitle = false, color = mColor(6),
			func = function() ToggleFriendsFrame() end},
			{text = ACHIEVEMENTS_GUILD_TAB, isTitle = false, color = mColor(6),
			func = function() ToggleGuildFrame() end},
			
			{text = "", isTitle = true,  func = function() end},
			
			{text = LFG_TITLE, isTitle = false, color = mColor(7),
			func = function() ToggleLFDParentFrame(); end},
			{text = ENCOUNTER_JOURNAL, isTitle = false, color = mColor(7),
			func = function() if not IsAddOnLoaded("Blizzard_EncounterJournal") then EncounterJournal_LoadUI(); end ToggleFrame(EncounterJournal) end},
			
			{text = "", isTitle = true, func = function() end},
			
			
			{text = "ElvUI", isTitle = false, color = mColor(4),
			func = function() 
				if InCombatLockdown() then _G.UIErrorsFrame:AddMessage(E.InfoColor.._G.ERR_NOT_IN_COMBAT) return end
				E:ToggleOptionsUI()
			end},
			
			{text = "", isTitle = true, func = function() end},
			
			{text = MAINMENU_BUTTON, isTitle = false, color = mColor(1),
			func = function()
				if ( not GameMenuFrame:IsShown() ) then
					if ( VideoOptionsFrame:IsShown() ) then
						VideoOptionsFrameCancel:Click();
					elseif ( AudioOptionsFrame:IsShown() ) then
						AudioOptionsFrameCancel:Click();
					elseif ( InterfaceOptionsFrame:IsShown() ) then
						InterfaceOptionsFrameCancel:Click();
					end
					CloseMenus();
					CloseAllWindows()
					ShowUIPanel(GameMenuFrame);
				else
					HideUIPanel(GameMenuFrame);
					MainMenuMicroButton_SetNormal();
				end
			end},
			
			{text = "", isTitle = true, func = function() end},
			
			{text = BLIZZARD_STORE, isTitle = false,  color = mColor(5), func = function() StoreMicroButton:Click() end},
			{text = HELP_BUTTON, isTitle = false,  color = mColor(5), func = function() ToggleHelpFrame() end}
		}
		mDropDown(menuList, menuFrame, E.db[mPlugin].mMenuUp, 160)
	else
		ToggleLFDParentFrame()
	end
end

local function OnEnter(self)
	DT:SetupTooltip(self)
	DT.tooltip:AddLine(mText)
	DT.tooltip:AddLine("   ")
	if E.db[mPlugin].InstancInfoToolTip then
		local inInstance, _ = IsInInstance()
		
		DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, L["Instancoptions"]))
		DT.tooltip:AddLine(mMT:InstancOptions("dungeon"))
		DT.tooltip:AddLine(mMT:InstancOptions("raid"))
		
		if inInstance then
			DT.tooltip:AddLine(" ")
			DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, L["Instance"]))
			DT.tooltip:AddLine(mMT:DungeonInfo("name"))
			DT.tooltip:AddLine(mMT:DungeonInfo("difficulty"))
		end
			
		if C_MythicPlus.IsMythicPlusActive() and (C_ChallengeMode.GetActiveChallengeMapID() ~= nil) then
			DT.tooltip:AddLine(" ")
			DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, L["Mythic Plus"]))
			DT.tooltip:AddLine(mMT:MythicPlusDungeon("key"))
		end
		
		if E.db[mPlugin].SAchievement0 then
			DT.tooltip:AddLine("   ")
			local mAI0 = mMT:mAchievementInfo(14418)
			if E.db[mPlugin].mAchievementIcon then 
				DT.tooltip:AddDoubleLine(format("%s%s|r", ns.mColor2, mAI0.name), mAI0.icon)
			else
				DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, mAI0.name))
			end
			mMT:Achievement(0)
		end

		if E.db[mPlugin].SAchievement10 then
			DT.tooltip:AddLine("   ")
			local mAI10 = mMT:mAchievementInfo(14531)
			if E.db[mPlugin].mAchievementIcon then 
				DT.tooltip:AddDoubleLine(format("%s%s|r", ns.mColor2, mAI10.name), mAI10.icon)
			else
				DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, mAI10.name))
			end
			mMT:Achievement(10)
		end
		
		if E.db[mPlugin].SAchievement15 then
			DT.tooltip:AddLine("   ")
			local mAI15 = mMT:mAchievementInfo(14532)
			if E.db[mPlugin].mAchievementIcon then 
				DT.tooltip:AddDoubleLine(format("%s%s|r", ns.mColor2, mAI15.name), mAI15.icon)
			else
				DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, mAI15.name))
			end
			mMT:Achievement(15)
		end
		
		if E.db[mPlugin].SAffix then
			DT.tooltip:AddLine("   ")
			DT.tooltip:AddLine(format("%s%s|r", ns.mColor2,  L["This Week Affix"]))
			DT.tooltip:AddLine(format("%s%s|r", ns.mColor1, mMT:AffixInfo()))
		end
		
		if E.db[mPlugin].SKeystone then
			if C_MythicPlus.GetOwnedKeystoneLevel() ~= nil then
				DT.tooltip:AddLine(" ")
				DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, L["Mythic Plus Keystone"]))
				DT.tooltip:AddLine(mMT:MythicPlusKey())
			end
		end
		
		DT.tooltip:AddLine("   ")
	end
	DT.tooltip:AddDoubleLine(ns.mName, "Ver. " .. ns.mVersion)
	DT.tooltip:AddLine("   ")
	DT.tooltip:AddLine(format(L["%sright click to open LFD Tool|r"], ns.mColor8))
	DT.tooltip:AddLine(format(L["%sleft click to open the menu.|r"], ns.mColor8))
	DT.tooltip:Show()
end

local function OnLeave(self)
	DT.tooltip:Hide()
end

local function ValueColorUpdate(hex)
	displayString = strjoin("", hex, "%s|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel, "ELVUI_COLOR_UPDATE")
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Game Menu", nil, {"CHALLENGE_MODE_START", "CHALLENGE_MODE_COMPLETED", "PLAYER_ENTERING_WORLD", "UPDATE_INSTANCE_INFO"}, OnEvent, nil, OnClick, OnEnter, OnLeave, mText)