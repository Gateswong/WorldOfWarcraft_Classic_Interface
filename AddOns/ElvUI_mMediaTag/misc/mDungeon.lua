local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);
local DT = E:GetModule("DataTexts");
local addon, ns = ...
local displayString = ""
local mText = L["Dungeon"]
local int = 2

function mMT:InstancOptions(option)
	local DDid = GetDungeonDifficultyID()
	local RDid = GetRaidDifficultyID()
	local DungeonName, _, _, _, _, _, _ = GetDifficultyInfo(DDid)
	local RaidName, _, _, _, _, _, _ = GetDifficultyInfo(RDid)
	
	if option == "dungeon" then
		if DDid == 1 then
			return format("%s%s:|r %s%s|r", ns.mColor1, DUNGEON_DIFFICULTY, ns.normal, DungeonName)
		elseif DDid == 2 then
			return format("%s%s:|r %s%s|r", ns.mColor1, DUNGEON_DIFFICULTY, ns.Heroic, DungeonName)
		elseif DDid == 23 then
			return format("%s%s:|r %s%s|r", ns.mColor1, DUNGEON_DIFFICULTY, ns.Mythic, DungeonName)
		else
			return format("%s%s:|r %s%s|r", ns.mColor1, DUNGEON_DIFFICULTY, ns.mColor1, DungeonName) 
		end
	elseif option == "raid" then
		if RDid == 14 then
			return format("%s%s:|r %s%s|r", ns.mColor1, RAID_DIFFICULTY, ns.normal, RaidName)
		elseif RDid == 15 then
			return format("%s%s:|r %s%s|r", ns.mColor1, RAID_DIFFICULTY, ns.Heroic, RaidName)
		elseif RDid == 16 then
			return format("%s%s:|r %s%s|r", ns.mColor1, RAID_DIFFICULTY, ns.Mythic, RaidName)
		else
			return format("%s%s:|r %s%s|r", ns.mColor1, RAID_DIFFICULTY, ns.mColor1, RaidName) 
		end
	end
end

function mMT:Achievement(option)
	local seasonID = C_MythicPlus.GetCurrentSeason()
	if seasonID >= 1 then
		if option == 15 then 
			for crit=1,8 do 
				local a,_,c = GetAchievementCriteriaInfo(14532, crit~=9 and crit or 10)
				DT.tooltip:AddDoubleLine(format("%s%s|r",ns.mColor1, a),string.format("[%s]", c and format("%s%s|r",ns.mColor6, L["True"])or format("%s%s|r",ns.mColor5, L["False"])))
			end
		elseif option == 10 then
			for crit=1,8 do
				local a,_,c = GetAchievementCriteriaInfo(14532, crit~=9 and crit or 10)
				DT.tooltip:AddDoubleLine(format("%s%s|r",ns.mColor1, a),string.format("[%s]", c and format("%s%s|r",ns.mColor6, L["True"])or format("%s%s|r",ns.mColor5, L["False"])))
			end
		elseif option == 0 then
			for crit=1,8 do
				local a,_,c = GetAchievementCriteriaInfo(14418, crit~=9 and crit or 10)
				DT.tooltip:AddDoubleLine(format("%s%s|r",ns.mColor1, a),string.format("[%s]", c and format("%s%s|r",ns.mColor6, L["True"])or format("%s%s|r",ns.mColor5, L["False"])))
			end
		end
	else
		if option == 0 then
			for crit=1,8 do
				local a,_,c = GetAchievementCriteriaInfo(14418, crit~=9 and crit or 10)
				DT.tooltip:AddDoubleLine(format("%s%s|r",ns.mColor1, a),string.format("[%s]", c and format("%s%s|r",ns.mColor6, L["True"])or format("%s%s|r",ns.mColor5, L["False"])))
			end
		else
			DT.tooltip:AddLine(format("%s%s|r",ns.mColor5, L["Saisson has not started yet."]))
		end
	end
end

function mMT:MythicPlusKey()
	local keyStoneLevel = C_MythicPlus.GetOwnedKeystoneLevel()
	local challengeMapID = C_MythicPlus.GetOwnedKeystoneChallengeMapID()
	local name, id, timeLimit, texture, backgroundTexture = C_ChallengeMode.GetMapUIInfo(challengeMapID)

	if keyStoneLevel <= 10 then 
		return format("%s%s: |r %s%s|r%s +%s|r", ns.mColor1, L["Keystone"], ns.Mythic, name, ns.normal, keyStoneLevel)
	elseif keyStoneLevel <= 15 then
		return format("%s%s: |r %s%s|r%s +%s|r", ns.mColor1, L["Keystone"], ns.Mythic, name, ns.mColor7, keyStoneLevel)
	elseif keyStoneLevel >= 20 then
		return format("%s%s: |r %s%s|r%s +%s|r", ns.mColor1, L["Keystone"], ns.Mythic, name, ns.mColor5, keyStoneLevel)
	end
end

function mMT:AffixInfo()
	local seasonID = C_MythicPlus.GetCurrentSeason()
	if seasonID >= 1 then
		local AffixText = nil
		local affixes = C_MythicPlus.GetCurrentAffixes();
		if (affixes) then
			for i, affix in ipairs(affixes) do
				local name, _, _ = C_ChallengeMode.GetAffixInfo(affix.id)
				if AffixText == nil then
					AffixText = name
				else
					AffixText = format("%s, %s", AffixText, name)
				end
			end
		end
		
		if AffixText ~= nil then
			return AffixText
		else
			return format(L["%sERROR! Please open the Mytisch+ window around LFG Tool or Reload UI!|r"], ns.mColor5)
		end
	else
		return format("%s%s|r",ns.mColor5, L["Saisson has not started yet."])
	end
end

function mMT:MythicPlusDungeon(option)
	local keyStoneLevel, _ = C_ChallengeMode.GetActiveKeystoneInfo()
	
	if keyStoneLevel == nil then
		return format("%sERROR|r", ns.mColor5)
	end
	
	if option == "key" then
		if keyStoneLevel <= 10 then 
			return format("%s%s: +|r%s%s|r", ns.mColor1, L["Level"], ns.mColor6, keyStoneLevel)
		elseif (keyStoneLevel >= 10) and (keyStoneLevel >= 15) then
			return format("%s%s: +|r%s%s|r", ns.mColor1, L["Level"], ns.mColor7, keyStoneLevel)
		elseif keyStoneLevel >= 20 then
			return format("%s%s: +|r%s%s|r", ns.mColor1, L["Level"], ns.mColor5, keyStoneLevel)
		else 
			return keyStoneLevel
		end
	elseif option == "txt" then
		if keyStoneLevel <= 10 then 
			return format("%s%s|r", ns.mColor6, keyStoneLevel)
		elseif (keyStoneLevel >= 10) and (keyStoneLevel >= 15) then
			return format("%s%s|r", ns.mColor7, keyStoneLevel)
		elseif keyStoneLevel >= 20 then
			return format("%s%s|r", ns.mColor5, keyStoneLevel)
		else
			return keyStoneLevel
		end
	end
end

function mMT:DungeonInfo(option)
	local name, instanceType, instanceDifficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamicInstance = GetInstanceInfo()
	
	if instanceDifficultyID == 0 then
	
	end
	
	if option == "name" then
		return format("%s%s:|r %s%s|r", ns.mColor1, L["Name"], ns.mColor6, name)
	elseif option == "difficulty" then
		if instanceDifficultyID == 1 or instanceDifficultyID == 3 or instanceDifficultyID == 4 or instanceDifficultyID == 14 then
			return format("%s%s:|r %s%s|r (%s)", ns.mColor1, L["Difficulty"], ns.normal, difficultyName, maxPlayers)
		elseif instanceDifficultyID == 2 or instanceDifficultyID == 5 or instanceDifficultyID == 6 or instanceDifficultyID == 15 or instanceDifficultyID == 39 or instanceDifficultyID == 149 then
			return format("%s%s:|r %s%s|r (%s)", ns.mColor1, L["Difficulty"], ns.Heroic, difficultyName, maxPlayers)
		elseif instanceDifficultyID == 23 or instanceDifficultyID == 16 or instanceDifficultyID == 40 then
			return format("%s%s:|r %s%s|r (%s)", ns.mColor1, L["Difficulty"], ns.Mythic, difficultyName, maxPlayers)
		elseif instanceDifficultyID == 8 then
			return format("%s%s:|r %s%s|r (%s)", ns.mColor1, L["Difficulty"], ns.mColor5, difficultyName, maxPlayers)
		else
			return format("%s%s:|r %s%s|r (%s)", ns.mColor1, L["Difficulty"], ns.normal, difficultyName, maxPlayers)
		end
	elseif option == "txt" then
		return name
	elseif option == "color" then
		if instanceDifficultyID == 1 or instanceDifficultyID == 3 or instanceDifficultyID == 4 or instanceDifficultyID == 14 then
			return ns.normal
		elseif instanceDifficultyID == 2 or instanceDifficultyID == 5 or instanceDifficultyID == 6 or instanceDifficultyID == 15 or instanceDifficultyID == 39 or instanceDifficultyID == 149 then
			return ns.Heroic
		elseif instanceDifficultyID == 23 or instanceDifficultyID == 16 or instanceDifficultyID == 40 then
			return ns.Mythic
		elseif instanceDifficultyID == 8 then
			return ns.mColor5
		else
			return ns.normal
		end
	end
end


local function mSetup(self)
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
		self.text:SetText(format("%s%s|r +%s", mMT:DungeonInfo("color"), E:ShortenString(mMT:DungeonInfo("txt"), 20), mMT:MythicPlusDungeon("txt")))
	end

	if E.db[mPlugin].Drchievement0 then
		DT.tooltip:AddLine("   ")
		local mAI0 = mMT:mAchievementInfo(14418)
		if E.db[mPlugin].mAchievementIcon then 
			DT.tooltip:AddDoubleLine(format("%s%s|r", ns.mColor2, mAI0.name), mAI0.icon)
		else
			DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, mAI0.name))
		end
		mMT:Achievement(0)
	end
	
	if E.db[mPlugin].DAchievement10 then
		DT.tooltip:AddLine("   ")
		local mAI10 = mMT:mAchievementInfo(14531)
		if E.db[mPlugin].mAchievementIcon then 
			DT.tooltip:AddDoubleLine(format("%s%s|r", ns.mColor2, mAI10.name), mAI10.icon)
		else
			DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, mAI10.name))
		end
		mMT:Achievement(10)
	end
		
	if E.db[mPlugin].DAchievement15 then
		DT.tooltip:AddLine("   ")
		local mAI15 = mMT:mAchievementInfo(14532)
		if E.db[mPlugin].mAchievementIcon then 
			DT.tooltip:AddDoubleLine(format("%s%s|r", ns.mColor2, mAI15.name), mAI15.icon)
		else
			DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, mAI15.name))
		end
		mMT:Achievement(15)
	end
	
	if E.db[mPlugin].DAffix then
			DT.tooltip:AddLine("   ")
			DT.tooltip:AddLine(format("%s%s|r", ns.mColor2,  L["This Week Affix"]))
			DT.tooltip:AddLine(format("%s%s|r", ns.mColor1, mMT:AffixInfo()))
		end
	
	if E.db[mPlugin].DKeystone then
		if C_MythicPlus.GetOwnedKeystoneLevel() ~= nil then
			DT.tooltip:AddLine(" ")
			DT.tooltip:AddLine(format("%s%s|r", ns.mColor2, L["Mythic Plus Keystone"]))
			DT.tooltip:AddLine(mMT:MythicPlusKey())
		end
	end
end

local function OnClick(self, button)
	DT.tooltip:Hide()
	ToggleLFDParentFrame()
end
	
local function OnEnter(self)
	DT:SetupTooltip(self)
	mSetup(self)
	DT.tooltip:Show()
end

local function OnEvent(self, event, unit)
	if E.db[mPlugin].DInstancInfoName then 
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

DT:RegisterDatatext("Dungeon", nil, {"CHALLENGE_MODE_START", "CHALLENGE_MODE_COMPLETED", "PLAYER_ENTERING_WORLD", "UPDATE_INSTANCE_INFO"}, OnEvent, nil, OnClick, OnEnter, OnLeave, mText)