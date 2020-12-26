local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);
local addon, ns = ...

function mMT:mProfileWindow(ProfileText, Text1)
	local Frame = E.Libs.AceGUI:Create('Frame')
	Frame:SetTitle(Text1)
	Frame:EnableResize(false)
	Frame:SetWidth(800)
	Frame:SetHeight(600)
	Frame.frame:SetFrameStrata('FULLSCREEN_DIALOG')
	Frame:SetLayout('flow')

	local Box = E.Libs.AceGUI:Create('MultiLineEditBox-ElvUI')
	Box:SetNumLines(30)
	Box:DisableButton(true)
	Box:SetWidth(800)
    Box:SetLabel("")
    Box:SetText(ProfileText)
    Box.editBox:HighlightText()
	Box:SetFocus()
	Frame:AddChild(Box)
	--Save original script so we can restore it later
	Box.editBox.OnTextChangedOrig = Box.editBox:GetScript('OnTextChanged')
	Box.editBox.OnCursorChangedOrig = Box.editBox:GetScript('OnCursorChanged')
	--Remove OnCursorChanged script as it causes weird behaviour with long text
	Box.editBox:SetScript('OnCursorChanged', nil)
	Box.scrollFrame:UpdateScrollChildRect()

	local Label1 = E.Libs.AceGUI:Create('Label')
	local font = GameFontHighlightSmall:GetFont()
	Label1:SetFont(font, 14)
	Label1:SetText(format("%s%s|r",ns.mColor1, L["Copy this text with for example CTRL + C and paste it into the Profile Import window of ElvUI."])) --Set temporary text so height is set correctly
	Label1:SetWidth(800)
	Frame:AddChild(Label1)
end