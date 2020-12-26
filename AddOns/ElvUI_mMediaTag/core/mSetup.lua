local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);
local EP = LibStub("LibElvUIPlugin-1.0")
local addon, ns = ...
local ReloadUI = ReloadUI
local mTextAddons = ""

local function InstallComplete()
	ReloadUI()
end

local InstallerData = {
	Title = format("%s - Version: %s", ns.mName, ns.mVersion),
	Name = ns.mName,
	tutorialImage = "Interface\\AddOns\\ElvUI_mMediaTag\\media\\textures\\logo.tga",
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText(L["Welcome to the installation for %s."], ns.mName)
			PluginInstallFrame.Desc1:SetText(L["Here you can install addon profiles for my ElvUI profile."])
			PluginInstallFrame.Desc2:SetText(L["Please press the continue button if you wish to go through the installation process, otherwise click the 'Skip Process' button."])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText(L["Skip Process"])
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText(L["Addon Layouts"])
			PluginInstallFrame.Desc1:SetText(L["Profiles are available for these Addons:"])
			
			-- AddOnSkins
			if IsAddOnLoaded('AddOnSkins') then
				mTextAddons = "> |cff1784d1AddOnSkins|r"
			end
			
			-- LocPlus
			if IsAddOnLoaded('ElvUI_LocPlus') then
				mTextAddons = mTextAddons .. "\n" .. "> |cff1784d1ElvUI|r Location Plus"
			end
			
			-- Deadly Boss Mods
			if IsAddOnLoaded('DBM-Core') then
				mTextAddons = mTextAddons .. "\n" .. "> |cffffd200Deadly Boss Mods|r" 
			end
			
			-- Skada
			if IsAddOnLoaded('Skada') then
				mTextAddons = mTextAddons .. "\n" .. "> Skada"
			end
			
			-- ProjectAzilroka
			if IsAddOnLoaded('ProjectAzilroka') then
				mTextAddons = mTextAddons .. "\n" .. "> |cFF16C3F2Project|r|cFFFFFFFFAzilroka|r"
			end
			
			-- Floating Combat Text
			if IsAddOnLoaded('ElvUI_FCT') then
				mTextAddons = mTextAddons .. "\n" .. "> |cff1784d1ElvUI|r |cFFdd2244Floating Combat Text|r"
			end
			
			-- Kaliel's Tracker
			if IsAddOnLoaded('!KalielsTracker') then
				mTextAddons = mTextAddons .. "\n" .. "> Kaliel's Tracker"
			end
			
			PluginInstallFrame.Desc2:SetText(mTextAddons)
			
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() mMT:SetupAddons() end)
			PluginInstallFrame.Option1:SetText(L["Install"])
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText(L["Installation Complete"])
			PluginInstallFrame.Desc1:SetText(L["You have completed the installation process."])
			PluginInstallFrame.Desc2:SetText(L["Please click the button below in order to finalize the process and automatically reload your UI."])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText(L["Finished"])
		end,
	},
	StepTitles = {
		[1] = L["Welcome"],
		[2] = L["Addon Layouts"],
		[3] = L["Installation Complete"],
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "RIGHT",
}

function mMT:mSetup()
	E:GetModule("PluginInstaller"):Queue(InstallerData)
	E:ToggleOptionsUI()
end
