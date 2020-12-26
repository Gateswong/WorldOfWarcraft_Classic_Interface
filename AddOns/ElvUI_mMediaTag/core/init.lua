local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:NewModule(mPlugin, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");
local EP = LibStub("LibElvUIPlugin-1.0")
local addon, ns = ...
local Version = GetAddOnMetadata(addon, "Version")

local _G = _G
local ReloadUI = ReloadUI

ns.mName 			= "|CFF8E44ADm|r|CFF2ECC71Media|r|CFF3498DBTag|r"
ns.mNameClassic 	= "|CFF8E44ADm|r|CFF2ECC71Media|r|CFF3498DBTag|r |cffff0066Classic|r"
ns.mVersion 		= Version
ns.mDateTankDD		= "17.10.2020 - "
ns.mDateHeal		= "24.10.2020 - "
ns.mDateNameplate	= "17.10.2020 - "
ns.mDateSandysUI	= "22.11.2020 - "
ns.mColor1 			= "|CFFFFFFFF"	-- white
ns.mColor2 			= "|CFFF7DC6F" 	-- yellow
ns.mColor3 			= "|CFF8E44AD"	-- purple
ns.mColor4 			= "|CFFFE7B2C" 	-- orange
ns.mColor5 			= "|CFFE74C3C" 	-- red
ns.mColor6 			= "|CFF58D68D" 	-- green
ns.mColor7 			= "|CFF3498DB" 	-- blue
ns.mColor8 			= "|CFFB2BABB" 	-- gray
ns.normal			= "|CFF82E0AA"	-- nomral
ns.Heroic			= "|CFF85C1E9 "	-- HC
ns.Mythic 			= "|CFFBB8FCE"	-- Mythic

function mMT:StartTimer(mTime)
  self:ScheduleTimer("TimerFeedback", mTime)
end

function mMT:TimerFeedback()
  print("5 seconds passed")
end

function mMT:Initialize()
	mMT:mVersionCheck()
	
	mMT:mMisc()
	
	EP:RegisterPlugin(addon, mMT.InsertOptions)
end

E:RegisterModule(mMT:GetName())