local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);

function mMT:SetupAddons()
 	-- AddOnSkins
	if IsAddOnLoaded('AddOnSkins') then
		mMT:LoadASProfile()
		E:Print(format(L["%s profile has been set."], "> |cff1784d1AddOnSkins|r"))
	end
	
	-- LocPlus
	if IsAddOnLoaded('ElvUI_LocPlus') then
		mMT:LoadLocPlusProfile()
		E:Print(format(L["%s profile has been set."], "> |cff1784d1ElvUI|r Location Plus"))
	end
	
	-- Deadly Boss Mods
	if IsAddOnLoaded('DBM-Core') then
		mMT:LoadDBMProfile()
		E:Print(format(L["%s profile has been set."], "> |cffffd200Deadly Boss Mods|r"))
	end
	
	-- Skada
	if IsAddOnLoaded('Skada') then
		mMT:LoadSkadaProfile()
		E:Print(format(L["%s profile has been set."], "> Skada"))
	end
	
	-- ProjectAzilroka
	if IsAddOnLoaded('ProjectAzilroka') then
		mMT:LoadPAProfile()
		E:Print(format(L["%s profile has been set."], "> |cFF16C3F2Project|r|cFFFFFFFFAzilroka|r"))
	end
	
	-- Floating Combat Text
	if IsAddOnLoaded('ElvUI_FCT') then
		mMT:LoadElvUIFCTProfile()
		E:Print(format(L["%s profile has been set."], "> |cff1784d1ElvUI|r |cFFdd2244Floating Combat Text|r"))
	end
	
	-- Kaliel's Tracker
	if IsAddOnLoaded('!KalielsTracker') then
		mMT:LoadKalielsTrackerProfile()
		E:Print(format(L["%s profile has been set."], "> Kaliel's Tracker"))
	end
end

function mMT:CheckAddons()
	local AddonString = ""
	-- AddOnSkins
   if IsAddOnLoaded('AddOnSkins') then
		AddonString = format("> |cff0cfa00%s|r >>> |cff1784d1AddOnSkins|r\n", L["is Installt"])
   else
		AddonString = format("> |cfffa2100%s|r >>> |cff1784d1AddOnSkins|r\n", L["is not Installt"])
   end
   
   -- LocPlus
   if IsAddOnLoaded('ElvUI_LocPlus') then
		AddonString = AddonString .. format("> |cff0cfa00%s|r >>> |cff1784d1ElvUI|r Location Plus\n", L["is Installt"])
   else
		AddonString = AddonString .. format("> |cfffa2100%s|r >>> |cff1784d1ElvUI|r Location Plus\n", L["is not Installt"])
   end
   
   -- Deadly Boss Mods
   if IsAddOnLoaded('DBM-Core') then
		AddonString = AddonString .. format("> |cff0cfa00%s|r >>> |cffffd200Deadly Boss Mods|r\n", L["is Installt"])
   else
		AddonString = AddonString .. format("> |cfffa2100%s|r >>> |cffffd200Deadly Boss Mods|r\n", L["is not Installt"])
   end
   
   -- Skada
   if IsAddOnLoaded('Skada') then
		AddonString = AddonString .. format("> |cff0cfa00%s|r >>> Skada\n", L["is Installt"])
   else
		AddonString = AddonString .. format("> |cfffa2100%s|r >>> Skada\n", L["is not Installt"])
   end
   
   -- ProjectAzilroka
   if IsAddOnLoaded('ProjectAzilroka') then
		AddonString = AddonString .. format("> |cff0cfa00%s|r >>> |cFF16C3F2Project|r|cFFFFFFFFAzilroka|r\n", L["is Installt"])
   else
		AddonString = AddonString .. format("> |cfffa2100%s|r >>> |cFF16C3F2Project|r|cFFFFFFFFAzilroka|r\n", L["is not Installt"])
   end
   
   -- Floating Combat Text
   if IsAddOnLoaded('ElvUI_FCT') then
		AddonString = AddonString .. format("> |cff0cfa00%s|r >>> |cff1784d1ElvUI|r |cFFdd2244Floating Combat Text|r\n", L["is Installt"])
   else
		AddonString = AddonString .. format("> |cff1784d1ElvUI|r |cFFdd2244Floating Combat Text|r\n", L["is not Installt"])
   end
   
   -- Kaliel's Tracker
   if IsAddOnLoaded('!KalielsTracker') then
		AddonString = AddonString .. format("> |cff0cfa00%s|r >>> Kaliel's Tracker\n", L["is Installt"])
   else
		AddonString = AddonString .. format("> |cfffa2100%s|r >>> Kaliel's Tracker\n", L["is not Installt"])
   end

   if AddonString == "" then
		AddonString = L["No supported Addons found!"]
   end

   return AddonString
end