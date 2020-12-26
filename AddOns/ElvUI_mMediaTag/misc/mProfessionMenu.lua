local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local DT = E:GetModule("DataTexts");
local addon, ns = ...
local displayString = ""
local mText = L["Professions"]

local menuFrame = CreateFrame('Frame', 'mProfessionMenu', E.UIParent, 'BackdropTemplate')
	  menuFrame:SetTemplate("Transparent", true)

local prof1, prof2, archaeology, fishing, cooking, firstAid = nil
local name, icon, skillLevel, maxSkillLevel, spelloffset, skillLine, skillModifier, specializationIndex, specializationOffset = nil
local mI = 0
local menuList = {}
local NoProf = false


local function getProfName(index)
	name, _, _, _, _, _, _, _, _, _ = GetProfessionInfo(index)

	return name
end

local function getProfIcon(index)
	_, icon, _, _, _, _, _, _, _, _ = GetProfessionInfo(index)
	return format ("|T%s:0|t", icon)
end

 local function getProfSkill(index)
	local mskillModifier = 0
	_, _, skillLevel, maxSkillLevel, _, _, _, skillModifier, _, _ = GetProfessionInfo(index)
	
	if skillModifier ~= 0 then 
		mskillModifier = format(" +%s", skillModifier)
	else 
		mskillModifier = "" 
	end
	
	if (skillLevel == maxSkillLevel) then
		return format("(%s%s%s|r)",ns.mColor6, skillLevel, mskillModifier)
	else
		return format("(%s%s|r%s%s|r%s/|r%s%s|r)", ns.mColor2, skillLevel, ns.mColor6, mskillModifier, ns.mColor1, ns.mColor7, maxSkillLevel)
	end
end
 
local function castProf(index)
	_, _, _, _, _, spelloffset, _, _, _, _  = GetProfessionInfo(index)

	CastSpell(spelloffset + 1, "Spell")
end

local function setupList(index, text, color, icon, skill, title, spell)
	if not E.db[mPlugin].mProfIcon then
		micon = nil
	else
		micon = icon
	end
	
	if spell == nil then
		tinsert(menuList, index, {text = text, text2 = skill, color = color, icon = micon, isTitle = title, func = function() end})
	else
		tinsert(menuList, index, {text = text, text2 = skill, color = color, icon = micon, isTitle = title, func = function() castProf(spell) end})
	end
end

local function setupProf()
	prof1, prof2, archaeology, fishing, cooking, firstAid = GetProfessions()
	mI = 1
	menuList = {}
	
	if (archaeology == nil) and (cooking == nil) and (fishing == nil) and (prof1 == nil) and (prof2 == nil) then
		NoProf = true
	else
		if (prof1 == nil) and (prof2 == nil) then
			setupList(mI, L["No Main Professions"], ns.mColor5, nil,  nil, true, nil)
			mI = mI + 1
		else
			setupList(mI, L["Main Professions"], ns.mColor2, nil,  nil, true, nil)
			mI = mI + 1
			
			if prof1 ~= nil then
				setupList(mI, getProfName(prof1), ns.mColor1, getProfIcon(prof1), getProfSkill(prof1), false, prof1)
				mI = mI + 1
			end
		
			if prof2 ~= nil then
				setupList(mI, getProfName(prof2), ns.mColor1, getProfIcon(prof2), getProfSkill(prof2), false, prof2)
				mI = mI + 1
			end
		end
		
		setupList(mI,"", nil, nil, nil, true, nil)
		mI = mI + 1
		
		if  (archaeology == nil) and (cooking == nil) and (firstAid == nil) and (fishing == nil)  then
			setupList(mI, L["No Secondary Professions"], ns.mColor5, nil, nil, true, nil)
			mI = mI + 1
		else
			setupList(mI, L["Secondary Professions"], ns.mColor2, nil, nil, true, nil)
			mI = mI + 1
			
			if archaeology ~= nil then
				setupList(mI, getProfName(archaeology), ns.mColor1, getProfIcon(archaeology), getProfSkill(archaeology), false, archaeology)
				mI = mI + 1
			end
			
			if cooking ~= nil then
				setupList(mI, getProfName(cooking), ns.mColor1, getProfIcon(cooking), getProfSkill(cooking), false, cooking)
				mI = mI + 1
			end
			
	--[[ 		if firstAid ~= nil then
				setupList(mI, getProfName(firstAid), ns.mColor1, getProfIcon(firstAid), getProfSkill(firstAid), false, firstAid)
				mI = mI + 1
			end ]]
			
			if fishing ~= nil then
				setupList(mI, getProfName(fishing), ns.mColor1, getProfIcon(fishing), getProfSkill(fishing), false, fishing)
				mI = mI + 1
			end
		end
		NoProf = false
	end
end

local function mSetupTooltip ()
	DT.tooltip:AddLine(mText)
	DT.tooltip:AddLine(L["   "])
	local mProfI= 0
	mProfI = (mI + 2) - mI
	
	setupProf()
	
	if (archaeology == nil) and (cooking == nil) and (fishing == nil) and (prof1 == nil) and (prof2 == nil) then
		DT.tooltip:AddLine(format(L["%sNo Professions|r"], ns.mColor5))
	else
		if prof1 ~= nil then
			DT.tooltip:AddDoubleLine(menuList[mProfI].text, menuList[mProfI].text2, 1, 1, 1, 1, 1, 0)
			mProfI = mProfI + 1
		end
		if prof2 ~= nil then
			DT.tooltip:AddDoubleLine(menuList[mProfI].text, menuList[mProfI].text2, 1, 1, 1, 1, 1, 0)
			mProfI = mProfI + 3
		end
		if archaeology ~= nil then
			DT.tooltip:AddDoubleLine(menuList[mProfI].text, menuList[mProfI].text2, 1, 1, 1, 1, 1, 0)
			mProfI = mProfI + 1
		end
		if cooking ~= nil then
			DT.tooltip:AddDoubleLine(menuList[mProfI].text, menuList[mProfI].text2, 1, 1, 1, 1, 1, 0)
			mProfI = mProfI + 1
		end
	--[[ 	if firstAid ~= nil then
			DT.tooltip:AddDoubleLine(menuList[8].text, menuList[8].text2, 1, 1, 1, 1, 1, 0)
			mProfI = mProfI + 1
		end ]]
		if fishing ~= nil then
			DT.tooltip:AddDoubleLine(menuList[mProfI].text, menuList[mProfI].text2, 1, 1, 1, 1, 1, 0)
			mProfI = mProfI + 1
		end
	end
	
	DT.tooltip:AddLine(L["   "])
	DT.tooltip:AddLine(format(L["%sright click to open the profession window|r"], ns.mColor8))
	DT.tooltip:AddLine(format(L["%sleft click to open the menu.|r"], ns.mColor8))
end

local function OnClick(self, button)
	DT.tooltip:Hide()
	if button == "LeftButton" then
		if NoProf then
			_G.UIErrorsFrame:AddMessage(format(L["%s: %sNo professions available!|r"], ns.mName ,ns.mColor5))
			print (format(L["%s: %sNo professions available!|r"], ns.mName ,ns.mColor5))
		else
			local mProfSetting = E.db[mPlugin].mProfUp
			setupProf()
			mDropDown(menuList, menuFrame, mProfSetting, 200, 2)
		end
	else
		ToggleSpellBook(BOOKTYPE_PROFESSION)
	end
end
	
local function OnEnter(self)
	DT:SetupTooltip(self)
	mSetupTooltip()
	DT.tooltip:Show()
end

local function OnEvent(self, event, unit)
	self.text:SetFormattedText(displayString, mText)
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

DT:RegisterDatatext("Professions",nil,  nil, OnEvent, nil, OnClick, OnEnter, OnLeave, mText)