local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);
local mSkin = E:GetModule("Skins")
local addon, ns = ...

local ChangelogDate = "09.11.2020"
local ChangelogText = format("## %s[ver. 2.10] - 09.12.2020|r\n### %sAdded|r\n- DoubleLine for Menu\n- Achievement Names\n- Achievement Icon\n### %sUpdate|r\n- Localization\n- Fix Mytic Plus Archivment\n\n## %s[ver. 2.00]|r - 29.11.2020\n### %sAdded|r\n- Profile Import Strings\n- Dungeon Achievement\n- Weakauro Profile (Comming Soon)\n### %sUpdate|r\n- New Changelog Window\n- Settings Menu Update\n- Mythic + Achievement", ns.mColor2, ns.mColor6, ns.mColor6, ns.mColor2, ns.mColor6, ns.mColor6)

local function mChangelogWindow()
	local Frame = CreateFrame("Frame", "mMediaTagChangelog", E.UIParent, 'BackdropTemplate')
	Frame:Point("CENTER")
	Frame:Size(400, 500)
	Frame:CreateBackdrop("Transparent")
	Frame:SetMovable(true)
	Frame:EnableMouse(true)
	Frame:RegisterForDrag("LeftButton")
	Frame:SetScript("OnDragStart", Frame.StartMoving)
	Frame:SetScript("OnDragStop", Frame.StopMovingOrSizing)
	Frame:SetClampedToScreen(true)
	Frame.mLogo = Frame:CreateTexture(nil, "ARTWORK")
	Frame.mLogo:Point("TOPLEFT", 72, -2)
	Frame.mLogo:Point("BOTTOMRIGHT", -72, 434)
	Frame.mLogo:SetTexture("Interface\\AddOns\\ElvUI_mMediaTag\\media\\textures\\logo.tga")

	local Label1 = Frame:CreateFontString(Frame, "OVERLAY", "GameTooltipText")
	local Font = GameFontHighlightSmall:GetFont()
	Label1:SetFont(Font, 18)
	Label1:SetPoint("TOPRIGHT", -20, -70)
	Label1:SetText(ChangelogDate)

	local Label2 = Frame:CreateFontString(Frame, "OVERLAY", "GameTooltipText")
	local Font = GameFontHighlightSmall:GetFont()
	Label2:SetFont(Font, 18)
	Label2:SetPoint("TOPLEFT", 20, -70)
	Label2:SetText(format("%s%s|r", ns.mColor6, L["Changelog:"]))

	local Label3 = Frame:CreateFontString(Frame, "OVERLAY", "GameTooltipText")
	local Font = GameFontHighlightSmall:GetFont()
	Label3:SetFont(Font, 14)
	Label3:SetPoint("TOPLEFT", 20, -100)
	Label3:SetWidth(400)
	Label3:SetText(ChangelogText)

	local Close = CreateFrame("Button", "CloseButton", Frame, "OptionsButtonTemplate, BackdropTemplate")
	Close:Point("BOTTOM", Frame, "BOTTOM", 0, 10)
	Close:SetText(CLOSE)
	Close:Size(80, 20)
	Close:SetScript("OnClick", function()
		E.db[mPlugin].mPluginVersion = ns.mVersion
		Frame:Hide()
	end)

	mSkin:HandleButton(Close)
end

function mMT:Changelog()
	mChangelogWindow()
end