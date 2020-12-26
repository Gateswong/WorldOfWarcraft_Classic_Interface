local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);
local LSM = E.Libs.LSM

--Lua functions
local _G = _G
local tinsert = tinsert
--WoW API / Variables
local CreateFrame = CreateFrame
local ToggleFrame = ToggleFrame
local GetCursorPosition = GetCursorPosition
local InCombatLockdown = InCombatLockdown
local UnitClass = UnitClass
local autoHideDelay = 2

local addon, ns = ...
local PADDING = 10
local BUTTON_HEIGHT = 16
local mFrame = {}

function mMT:TimerFeedback()
	mFrame:Hide()
end

local function OnClick(btn)
	btn.func()
	btn:GetParent():Hide()
	mMT:CancelAllTimers()
end

local function OnEnter(btn)
	btn.hoverTex:Show()
	mMT:CancelAllTimers()
end

local function OnLeave(btn)
	btn.hoverTex:Hide()
	mMT:ScheduleTimer("TimerFeedback", autoHideDelay)
end

function mDropDown(list, frame, pos, ButtonWidth, HideDelay, xOffset, yOffset)
	if HideDelay ~= nill then
		autoHideDelay = HideDelay
	end
	
	mMT:CancelAllTimers()
	
	local mBtText = ""
	local mBtText = ""
	
	if not frame.buttons then
		frame.buttons = {}
		frame:SetFrameStrata('DIALOG')
		frame:SetClampedToScreen(true)
		tinsert(_G.UISpecialFrames, frame:GetName())
		frame:Hide()
	end
	
	xOffset = xOffset or 0
	yOffset = yOffset or 0
	
	for i=1, #frame.buttons do
		frame.buttons[i]:Hide()
	end
	
	for i=1, #list do
		if not frame.buttons[i] then
			frame.buttons[i] = CreateFrame('Button', nil, frame)
			local texture = LSM:Fetch("statusbar", E.db[mPlugin].mHoverTexture)
			if texture == nil then
				texture = [[Interface\QuestFrame\UI-QuestTitleHighlight]]
			end
			
			if list[i].isTitle == true then
				frame.buttons[i].hoverTex = frame.buttons[i]:CreateTexture(nil, 'OVERLAY')
				frame.buttons[i].hoverTex:SetAllPoints()
				frame.buttons[i].hoverTex:SetTexture(nil)
				frame.buttons[i].hoverTex:SetBlendMode('ADD')
				frame.buttons[i].hoverTex:Hide()
			else
				frame.buttons[i].hoverTex = frame.buttons[i]:CreateTexture(nil, 'OVERLAY')
				frame.buttons[i].hoverTex:SetAllPoints()
				frame.buttons[i].hoverTex:SetTexture(texture)
				
				if E.db[mPlugin].mClassColorHover then
				
					local _, unitClass = UnitClass('player')
					local class = ElvUF.colors.class[unitClass]
					frame.buttons[i].hoverTex:SetVertexColor(class[1], class[2], class[3], 0.75)
				else
					frame.buttons[i].hoverTex:SetVertexColor(0.94, 0.76, 0.05, 0.50)
				end
				
				frame.buttons[i].hoverTex:SetBlendMode('ADD')
				frame.buttons[i].hoverTex:Hide()
			end
			
			frame.buttons[i].text = frame.buttons[i]:CreateFontString(nil, 'BORDER')
			frame.buttons[i].text:SetAllPoints()
			frame.buttons[i].text:FontTemplate(nil, nil, '')
			frame.buttons[i].text:SetJustifyH('LEFT')

			frame.buttons[i].text2 = frame.buttons[i]:CreateFontString(nil, 'BORDER')
			frame.buttons[i].text2:SetAllPoints()
			frame.buttons[i].text2:FontTemplate(nil, nil, '')
			frame.buttons[i].text2:SetJustifyH('RIGHT')
			
			frame.buttons[i]:SetScript('OnEnter', OnEnter)
			frame.buttons[i]:SetScript('OnLeave', OnLeave)
		end
		
		frame.buttons[i]:Show()
		frame.buttons[i]:Height(BUTTON_HEIGHT)
		frame.buttons[i]:Width(ButtonWidth)
	
		if list[i].color ~= nil then
			mBtText = format("%s%s|r", list[i].color, list[i].text)
		else
			mBtText = list[i].text
		end
		
		if list[i].icon ~= nil then
			mBtText = format("%s  %s", list[i].icon, mBtText)
		end

		if mBtText == nil then
			mBtText = ""
		end

		if list[i].color2 ~= nil then
			mBtText2 = format("%s%s|r", list[i].color2, list[i].text2)
		else
			mBtText2 = list[i].text2
		end

		if list[i].icon2 ~= nil then
			mBtText2 = format("%s  %s", list[i].icon2, mBtText2)
		end
	
		if mBtText2 == nil then
			mBtText2 = ""
		end
		
		frame.buttons[i].text:SetText(mBtText)
		frame.buttons[i].text2:SetText(mBtText2)

		frame.buttons[i].func = list[i].func
		frame.buttons[i]:SetScript('OnClick', OnClick)
		
		if i == 1 then
			frame.buttons[i]:Point('TOPLEFT', frame, 'TOPLEFT', PADDING, -PADDING)
		else
			frame.buttons[i]:Point('TOPLEFT', frame.buttons[i-1], 'BOTTOMLEFT')
		end
	end
	
	frame:Height((#list * BUTTON_HEIGHT) + PADDING * 2)
	frame:Width(ButtonWidth + PADDING * 2)
	
	local UIScale = _G.UIParent:GetScale()
	local x, y = GetCursorPosition()
	x = x/UIScale
	y = y/UIScale
	frame:ClearAllPoints()
	
	if pos == true then
		frame:Point('BOTTOMLEFT', _G.UIParent, 'BOTTOMLEFT', x + xOffset, y + yOffset)
	else
		frame:Point('TOPLEFT', _G.UIParent, 'BOTTOMLEFT', x + xOffset, y + yOffset)
	end
	
	mFrame = frame
	
	if InCombatLockdown() then
		_G.UIErrorsFrame:AddMessage(format("%s%2|r", ns.mColor5, _G.ERR_NOT_IN_COMBAT))
		print (format("%s%2|r", ns.mColor5, _G.ERR_NOT_IN_COMBAT))
	else
		mMT:ScheduleTimer("TimerFeedback", autoHideDelay)
		ToggleFrame(frame)
	end
end