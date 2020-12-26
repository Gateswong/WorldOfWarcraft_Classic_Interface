local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local addon, ns = ...

-- Cache global variables
local format, len = string.format, string.len
-- WoW API / Variables
local UnitClass = UnitClass
local UnitHealth, UnitHealthMax = UnitHealth, UnitHealthMax
local UnitName = UnitName
local UnitIsPVP = UnitIsPVP
local UnitFactionGroup = UnitFactionGroup

ElvUF.Tags.Events["mClass"] = "UNIT_CLASSIFICATION_CHANGED"
ElvUF.Tags.Methods["mClass"] = function(unit)
	local c = UnitClassification(unit)

	if(c == "rare") then
		return format("%sRare|r", E.db[mPlugin].cClassRare.color)
	elseif(c == "rareelite") then
		return format("%sRare Elite|r", E.db[mPlugin].cClassRareElite.color)
	elseif(c == "elite") then
		return format("%sElite|r", E.db[mPlugin].cClassElite.color)
	elseif(c == "worldboss") then
		return format("%sBoss|r", E.db[mPlugin].cClassBoss.color)
	end
end

ElvUF.Tags.Events["mClass:space-left"] = "UNIT_CLASSIFICATION_CHANGED"
ElvUF.Tags.Methods["mClass:space-left"] = function(unit)
	local c = UnitClassification(unit)

	if(c == "rare") then
		return format(" %sRare|r", E.db[mPlugin].cClassRare.color)
	elseif(c == "rareelite") then
		return format(" %sRare Elite|r", E.db[mPlugin].cClassRareElite.color)
	elseif(c == "elite") then
		return format(" %sElite|r", E.db[mPlugin].cClassElite.color)
	elseif(c == "worldboss") then
		return format(" %sBoss|r", E.db[mPlugin].cClassBoss.color)
	end
end

ElvUF.Tags.Events["mClass:space-right"] = "UNIT_CLASSIFICATION_CHANGED"
ElvUF.Tags.Methods["mClass:space-right"] = function(unit)
	local c = UnitClassification(unit)

	if(c == "rare") then
		return format("%sRare|r ", E.db[mPlugin].cClassRare.color)
	elseif(c == "rareelite") then
		return format("%sRare Elite|r ", E.db[mPlugin].cClassRareElite.color)
	elseif(c == "elite") then
		return format("%sElite|r ", E.db[mPlugin].cClassElite.color)
	elseif(c == "worldboss") then
		return format("%sBoss|r ", E.db[mPlugin].cClassBoss.color)
	end
end

ElvUF.Tags.Events["mClass:short"] = "UNIT_CLASSIFICATION_CHANGED"
ElvUF.Tags.Methods["mClass:short"] = function(unit)
	local c = UnitClassification(unit)

	if(c == "rare") then
		return format("%sR|r", E.db[mPlugin].cClassRare.color)
	elseif(c == "rareelite") then
		return format("%sR+|r", E.db[mPlugin].cClassRareElite.color)
	elseif(c == "elite") then
		return format("%s+|r", E.db[mPlugin].cClassElite.color)
	elseif(c == "worldboss") then
		return format("%sB|r", E.db[mPlugin].cClassBoss.color)
	end
end

ElvUF.Tags.Events["mClass:short-space-left"] = "UNIT_CLASSIFICATION_CHANGED"
ElvUF.Tags.Methods["mClass:short-space-left"] = function(unit)
	local c = UnitClassification(unit)

	if(c == "rare") then
		return format(" %sR|r", E.db[mPlugin].cClassRare.color)
	elseif(c == "rareelite") then
		return format(" %sR+|r", E.db[mPlugin].cClassRareElite.color)
	elseif(c == "elite") then
		return format(" %s+|r", E.db[mPlugin].cClassElite.color)
	elseif(c == "worldboss") then
		return format(" %sB|r", E.db[mPlugin].cClassBoss.color)
	end
end

ElvUF.Tags.Events["mClass:short-space-right"] = "UNIT_CLASSIFICATION_CHANGED"
ElvUF.Tags.Methods["mClass:short-space-right"] = function(unit)
	local c = UnitClassification(unit)

	if(c == "rare") then
		return format("%sR|r ", E.db[mPlugin].cClassRare.color)
	elseif(c == "rareelite") then
		return format("%sR+|r ", E.db[mPlugin].cClassRareElite.color)
	elseif(c == "elite") then
		return format("%s+|r ", E.db[mPlugin].cClassElite.color)
	elseif(c == "worldboss") then
		return format("%sB|r ", E.db[mPlugin].cClassBoss.color)
	end
end

ElvUF.Tags.Events["mColor"] = "UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT UNIT_CLASSIFICATION_CHANGED"
ElvUF.Tags.Methods["mColor"] = function(unit)
	local c = UnitClassification(unit)
	local unitReaction = UnitReaction(unit, 'player')
	local unitPlayer = UnitIsPlayer(unit)
	
	if (unitPlayer) then
		local _, unitClass = UnitClass(unit)
		local class = ElvUF.colors.class[unitClass]
		if not class then return "" end
		return Hex(class[1], class[2], class[3])
	elseif (unitReaction) then
		if (unitReaction > 3) then
			local reaction = ElvUF.colors.reaction[unitReaction]
			return Hex(reaction[1], reaction[2], reaction[3])
		else
			if(c == "rare") then
				return E.db[mPlugin].cClassRare.color
			elseif(c == "rareelite") then
				return E.db[mPlugin].cClassRareElite.color
			elseif(c == "elite") then
				return E.db[mPlugin].cClassElite.color
			elseif(c == "worldboss") then
				return E.db[mPlugin].cClassBoss.color
			end
		end
	end
end

ElvUF.Tags.Events["mColor:target"] = "UNIT_TARGET"
ElvUF.Tags.Methods["mColor:target"] = function(unit)
	local target = unit.."target"
	local c = UnitClassification(target)
	local unitReaction = UnitReaction(target, 'player')
	local unitPlayer = UnitIsPlayer(target)
	
	if (unitPlayer) then
		local _, unitClass = UnitClass(target)
		local class = ElvUF.colors.class[unitClass]
		if not class then return "" end
		return Hex(class[1], class[2], class[3])
	elseif (unitReaction) then
		if (unitReaction > 3) then
			local reaction = ElvUF.colors.reaction[unitReaction]
			return Hex(reaction[1], reaction[2], reaction[3])
		else
			if(c == "rare") then
				return E.db[mPlugin].cClassRare.color
			elseif(c == "rareelite") then
				return E.db[mPlugin].cClassRareElite.color
			elseif(c == "elite") then
				return E.db[mPlugin].cClassElite.color
			elseif(c == "worldboss") then
				return E.db[mPlugin].cClassBoss.color
			end
		end
	end
end


ElvUF.Tags.Events["mHealth"] = "UNIT_HEALTH UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED PLAYER_UPDATE_RESTING"
ElvUF.Tags.Methods["mHealth"] = function(unit)
	local isAFK = UnitIsAFK(unit)
	
	if isAFK then
		return _TAGS.mAFK(unit)
	else
		if(UnitIsDead(unit)) or (UnitIsGhost(unit)) or (not UnitIsConnected(unit))then
			return _TAGS.mStatus(unit)
		else
			local currentHealth = UnitHealth(unit)
			local deficit = UnitHealthMax(unit) - currentHealth

			if (deficit > 0 and currentHealth > 0) then
				return E:GetFormattedText("PERCENT", UnitHealth(unit), UnitHealthMax(unit))
			else
				return E:GetFormattedText("CURRENT", UnitHealth(unit), UnitHealthMax(unit))
			end
		end
	end
end

ElvUF.Tags.Events["mStatus"] = "UNIT_HEALTH PLAYER_UPDATE_RESTING UNIT_CONNECTION PLAYER_FLAGS_CHANGED"
ElvUF.Tags.Methods["mStatus"] = function(unit)
	local isAFK = UnitIsAFK(unit)
	
	if isAFK then
		return _TAGS.mAFK(unit)
	else
		if(UnitIsDead(unit)) then
			return L["Dead"]
		elseif(UnitIsGhost(unit)) then
			return L["Ghost"]
		elseif(not UnitIsConnected(unit)) then
			return L["Offline"]
		end
	end
end

ElvUF.Tags.OnUpdateThrottle["mStatus:timer"] = 1
ElvUF.Tags.Methods["mStatus:timer"] = function(unit)
	local isAFK = UnitIsAFK(unit)
	
	if isAFK then
		return _TAGS.mAFK(unit)
	else
		if(UnitIsDead(unit)) then
			return _TAGS.statustimer(unit)
		elseif(UnitIsGhost(unit)) then
			return L["Ghost"]
		elseif(not UnitIsConnected(unit)) then
			return _TAGS.statustimer(unit)
		end
	end
end

ElvUF.Tags.Events["mAFK"] = "PLAYER_FLAGS_CHANGED"
ElvUF.Tags.Methods["mAFK"] = function(unit)
	local isAFK = UnitIsAFK(unit)
	
	if isAFK then
		return format("[%sAFK|r]", E.db[mPlugin].cGeneralAFK.color)
	end
end

ElvUF.Tags.Events["mHealth:current-percent"] = "UNIT_HEALTH UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED PLAYER_UPDATE_RESTING"
ElvUF.Tags.Methods["mHealth:current-percent"] = function(unit)
	local isAFK = UnitIsAFK(unit)
	
	if isAFK then
		return _TAGS.mAFK(unit)
	else
		if(UnitIsDead(unit)) or (UnitIsGhost(unit)) or (not UnitIsConnected(unit))then
			return _TAGS.mStatus(unit)
		else
			local currentHealth = UnitHealth(unit)
			local deficit = UnitHealthMax(unit) - currentHealth

			if (deficit > 0 and currentHealth > 0) then
				return format("%s | %s", E:GetFormattedText("CURRENT", UnitHealth(unit), UnitHealthMax(unit)), E:GetFormattedText("PERCENT", UnitHealth(unit), UnitHealthMax(unit)))
			else
				return E:GetFormattedText("CURRENT", UnitHealth(unit), UnitHealthMax(unit))
			end
		end
	end
end

ElvUF.Tags.OnUpdateThrottle["mHealth:timer"] = 1
ElvUF.Tags.Methods["mHealth:timer"] = function(unit)
	local isAFK = UnitIsAFK(unit)
	
	if isAFK then
		return _TAGS.mAFK(unit)
	else
		if(UnitIsDead(unit)) or (UnitIsGhost(unit)) or (not UnitIsConnected(unit))then
			return _TAGS.mStatus(unit)
		else
			local currentHealth = UnitHealth(unit)
			local deficit = UnitHealthMax(unit) - currentHealth

			if (deficit > 0 and currentHealth > 0) then
				return E:GetFormattedText("PERCENT", UnitHealth(unit), UnitHealthMax(unit))
			else
				return E:GetFormattedText("CURRENT", UnitHealth(unit), UnitHealthMax(unit))
			end
		end
	end
end

ElvUF.Tags.Events["mHealth:NoAFK"] = "UNIT_HEALTH UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED PLAYER_UPDATE_RESTING"
ElvUF.Tags.Methods["mHealth:NoAFK"] = function(unit)
	if(UnitIsDead(unit)) or (UnitIsGhost(unit)) or (not UnitIsConnected(unit))then
		return _TAGS.mStatus(unit)
	else
		local currentHealth = UnitHealth(unit)
		local deficit = UnitHealthMax(unit) - currentHealth

		if (deficit > 0 and currentHealth > 0) then
			return E:GetFormattedText("PERCENT", UnitHealth(unit), UnitHealthMax(unit))
		else
			return E:GetFormattedText("CURRENT", UnitHealth(unit), UnitHealthMax(unit))
		end
	end
end

ElvUF.Tags.Events["mHealth:NoAFK-current-percent"] = "UNIT_HEALTH UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED PLAYER_UPDATE_RESTING"
ElvUF.Tags.Methods["mHealth:NoAFK-current-percent"] = function(unit)
	if(UnitIsDead(unit)) or (UnitIsGhost(unit)) or (not UnitIsConnected(unit))then
		return _TAGS.mStatus(unit)
	else
		local currentHealth = UnitHealth(unit)
		local deficit = UnitHealthMax(unit) - currentHealth

		if (deficit > 0 and currentHealth > 0) then
			return format("%s | %s", E:GetFormattedText("CURRENT", UnitHealth(unit), UnitHealthMax(unit)), E:GetFormattedText("PERCENT", UnitHealth(unit), UnitHealthMax(unit)))
		else
			return E:GetFormattedText("CURRENT", UnitHealth(unit), UnitHealthMax(unit))
		end
	end
end

ElvUF.Tags.OnUpdateThrottle["mHealth:NoAFK-timer"] = 1
ElvUF.Tags.Methods["mHealth:NoAFK-timer"] = function(unit)
	if(UnitIsDead(unit)) then
		return _TAGS.statustimer(unit)
	elseif(UnitIsGhost(unit)) then
		return L["Ghost"]
	elseif(not UnitIsConnected(unit)) then
		return _TAGS.statustimer(unit)
	else
		local currentHealth = UnitHealth(unit)
		local deficit = UnitHealthMax(unit) - currentHealth

		if (deficit > 0 and currentHealth > 0) then
			return E:GetFormattedText("PERCENT", UnitHealth(unit), UnitHealthMax(unit))
		else
			return E:GetFormattedText("CURRENT", UnitHealth(unit), UnitHealthMax(unit))
		end
	end
end

ElvUF.Tags.Events["mRole"] = "PLAYER_ROLES_ASSIGNED GROUP_ROSTER_UPDATE"
ElvUF.Tags.Methods["mRole"] = function(unit)
	local Role = UnitGroupRolesAssigned(unit)

	if Role == "TANK" then
		return format("%s%s|r", E.db[mPlugin].cGeneralTank.color, TANK)
	elseif Role == "HEALER" then
		return format("%s%s|r", E.db[mPlugin].cGeneralTank.color, HEALER)
	end
end

ElvUF.Tags.Events["mLevel"] = "UNIT_LEVEL PLAYER_LEVEL_UP PLAYER_UPDATE_RESTING"
ElvUF.Tags.Methods["mLevel"] = function(unit)
	if(unit == "player" and IsResting()) then
		return format("%sZzz|r", E.db[mPlugin].cGeneralZzz.color)
	else
		local level = UnitLevel(unit)
		if ( UnitIsWildBattlePet(unit) or UnitIsBattlePetCompanion(unit) ) then
			return UnitBattlePetLevel(unit);
		elseif(level > 0) then
			return level
		else
			return format("%s??|r", E.db[mPlugin].cGeneralLevel.color)
		end
	end
end

ElvUF.Tags.Events["mLevelSmart"] = "UNIT_LEVEL PLAYER_LEVEL_UP PLAYER_UPDATE_RESTING"
ElvUF.Tags.Methods["mLevelSmart"] = function(unit)
	if(unit == "player" and IsResting()) then
		return format("%sZzz|r", E.db[mPlugin].cGeneralZzz.color)
	else
		local level = UnitLevel(unit)
		if ( UnitIsWildBattlePet(unit) or UnitIsBattlePetCompanion(unit) ) then
			return UnitBattlePetLevel(unit);
		elseif level == UnitLevel("player") then
			return ""
		elseif(level > 0) then
			return level
		else
			return format("%s??|r", E.db[mPlugin].cGeneralLevel.color)
		end
	end
end

ElvUF.Tags.Events["mGroup"] = "GROUP_ROSTER_UPDATE"
ElvUF.Tags.Methods["mGroup"] = function(unit)
	local name, server = UnitName(unit)
	if(server and server ~= '') then
		name = string.format('%s-%s', name, server)
	end

	for i=1, GetNumGroupMembers() do
		local raidName, _, group = GetRaidRosterInfo(i)
		if( raidName == name ) then
		return L["Group "] .. group
		end
	end
end

ElvUF.Tags.Events["mGroup:short"] = "GROUP_ROSTER_UPDATE"
ElvUF.Tags.Methods["mGroup:short"] = function(unit)
	local name, server = UnitName(unit)
	if(server and server ~= '') then
		name = string.format('%s-%s', name, server)
	end

	for i=1, GetNumGroupMembers() do
		local raidName, _, group = GetRaidRosterInfo(i)
		if( raidName == name ) then
		return L["Grp. "] .. group
		end
	end
end

ElvUF.Tags.Events["mPvP:left"] = "UNIT_FACTION"
ElvUF.Tags.Methods["mPvP:left"] = function(unit)
	local factionGroup = UnitFactionGroup(unit)
	if(UnitIsPVP(unit)) then
		if (factionGroup == 'Horde' or factionGroup == 'Alliance') then
			return CreateTextureMarkup("Interface\\FriendsFrame\\PlusManz-"..factionGroup, 16, 16, 16, 16, 0, 1, 0, 1, 0, 0) .. ' PvP'
		else
			return 'PvP'
		end
	end
end

ElvUF.Tags.Events["mPvP:right"] = "UNIT_FACTION"
ElvUF.Tags.Methods["mPvP:right"] = function(unit)
	local factionGroup = UnitFactionGroup(unit)
	if(UnitIsPVP(unit)) then
		if (factionGroup == 'Horde' or factionGroup == 'Alliance') then
			return 'PvP ' .. CreateTextureMarkup("Interface\\FriendsFrame\\PlusManz-"..factionGroup, 16, 16, 16, 16, 0, 1, 0, 1, 0, 0)
		else
			return 'PvP'
		end
	end
end

ElvUF.Tags.Events["mPvP:icon"] = "UNIT_FACTION"
ElvUF.Tags.Methods["mPvP:icon"] = function(unit)
	local factionGroup = UnitFactionGroup(unit)
	if(UnitIsPVP(unit)) and (factionGroup == 'Horde' or factionGroup == 'Alliance') then
		return CreateTextureMarkup("Interface\\FriendsFrame\\PlusManz-"..factionGroup, 16, 16, 16, 16, 0, 1, 0, 1, 0, 0)
	end
end

E:AddTagInfo("mClass", ns.mName, L["Classes are fully written."], 1)
E:AddTagInfo("mClass:space-left", ns.mName, L["Classes are fully written with spac on left side."], 2)
E:AddTagInfo("mClass:space-right", ns.mName, L["Classes are fully written with spac on right side."], 3)
E:AddTagInfo("mClass:short", ns.mName, L["Classes are short written."], 4)
E:AddTagInfo("mClass:short-space-left", ns.mName, L["Classes are short written with spac on left side."], 5)
E:AddTagInfo("mClass:short-space-right", ns.mName, L["Classes are short written with spac on right side."], 6)

E:AddTagInfo("mColor", ns.mName, L["Colors Text by Class."], 7)
E:AddTagInfo("mColor:target", ns.mName, L["Colors Text by Target Class."], 8)

E:AddTagInfo("mHealth", ns.mName, L["Health changes between Max Health and Percent in fight."], 9)
E:AddTagInfo("mHealth:NoAFK", ns.mName, L["Health changes between Max Health and Percent in fight, without AFK."], 10)
E:AddTagInfo("mHealth:current-percent", ns.mName, L["Health changes between Max Health and Current - Percent in fight."], 11)
E:AddTagInfo("mHealth:NoAFK-current-percent", ns.mName, L["Health changes between Max Health and Current - Percent in fight, without AFK."], 12)
E:AddTagInfo("mHealth:timer", ns.mName, L["mHealth wit Statustimer for Dead and AFK."], 13)
E:AddTagInfo("mHealth:NoAFK-timer", ns.mName, L["mHealth wit Statustimer for Dead, without AFK."], 14)

E:AddTagInfo("mStatus", ns.mName, L["Coloured Statustext."], 15)
E:AddTagInfo("mStatus:timer", ns.mName, L["Coloured Statustext, with timer for Dead and AFK."], 16)
E:AddTagInfo("mAFK", ns.mName, L["Coloured AFK text."], 17)

E:AddTagInfo("mRole", ns.mName, L["Tank and Heal Role written."], 18)

E:AddTagInfo("mLevel", ns.mName, L["Level changes to resting in the City."], 19)
E:AddTagInfo("mLevelSmart", ns.mName, L["Same as mLevel (hides Level if it is equal)."], 22)

E:AddTagInfo("mGroup", ns.mName, L["Group number with full text (Group 3)."], 21)
E:AddTagInfo("mGroup:short", ns.mName, L["Group number with abbreviated text (Grp. 3)."], 22)

E:AddTagInfo("mPvP:left", ns.mName, L["PvP text with symbol left."], 23)
E:AddTagInfo("mPvP:right", ns.mName, L["PvP text with symbol right."], 24)
E:AddTagInfo("mPvP:icon", ns.mName, L["Shows the faction icon when PvP is active."], 25)