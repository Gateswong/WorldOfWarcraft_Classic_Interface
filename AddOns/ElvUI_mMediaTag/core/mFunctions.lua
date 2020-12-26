local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);
local addon, ns = ...

local function mWoWCheck()
	if _G.WOW_PROJECT_ID == _G.WOW_PROJECT_CLASSIC then
		--Classic
		return false
	else
		--Retail
		return true
	end
end

function mMT:mVersionCheck()
	local mElvVer = tonumber(E.version)
	local mMinVer = 12.00
	
	if not  mWoWCheck() then
		local mErrorText = format(L["%sIt seems you are using|r %s Retail %sunder WoW Classic!|r|n|nPlease use %s under WoW Classic to avoid problems."],ns.mColor5, ns.mName, ns.mColor5, ns.mNameClassic)
		print (mErrorText)
		
		StaticPopupDialogs["mERROR"] = {
		text = mErrorText,
		button1 = "OK",
		timeout = 120,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,
		}

		StaticPopup_Show ("mERROR")
	end
	
	if mElvVer ~= nil then
		if mElvVer < mMinVer then
			local mErrorText = format(L["%sYour ElvUI (Ver. %s) version is no longer up to date, please update it to Ver.|r %s%s|r, %sto avoid problems with|r %s|r%s.|r"],ns.mColor5, mElvVer, ns.mColor6, mMinVer, ns.mColor5, ns.mName, ns.mColor5)
			print (mErrorText)
			
			StaticPopupDialogs["mERROR"] = {
			text = mErrorText,
			button1 = "OK",
			timeout = 120,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3,
			}

			StaticPopup_Show ("mERROR")
		end
	else
		local mErrorText = format(L["%sERROR! Versioncheck Faild!|r"],ns.mColor5)
		print (mErrorText)
				
		StaticPopupDialogs["mERROR"] = {
		text = mErrorText,
		button1 = "OK",
		timeout = 120,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,
		}

		StaticPopup_Show ("mERROR")
	end
end

function mMT:mMisc()
	if E.db[mPlugin].mMsg then
		print (format(L["Welcome to %s version |CFF8E44AD%q|r, for |cff1784d1ElvUI|r!"],ns.mName, ns.mVersion))
	end
	
	if E.db[mPlugin].mPluginVersion ~= ns.mVersion then
		mMT:Changelog()
	end

	if E.db[mPlugin].mClassNameplate == true then
		mMT:mNamePlateBorderColor()
	end
end

function mMT:mBackupNameplateSettings()
	if not E.db[mPlugin].mBackup then
		E.db[mPlugin].mBackupHover.cb = E.db["nameplates"]["colors"]["glowColor"]["b"]
		E.db[mPlugin].mBackupHover.cg = E.db["nameplates"]["colors"]["glowColor"]["r"]
		E.db[mPlugin].mBackupHover.cr = E.db["nameplates"]["colors"]["glowColor"]["g"]
		E.db[mPlugin].mBackupHover.bb = E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["b"]
		E.db[mPlugin].mBackupHover.bg = E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["g"]
		E.db[mPlugin].mBackupHover.br = E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["r"]
		E.db[mPlugin].mBackupHoverBorder = E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["border"]
		E.db[mPlugin].mBackup = true
	end
end

function mMT:mRestoreNameplateSettings()
	if E.db[mPlugin].mBackup then
		E.db["nameplates"]["colors"]["glowColor"]["b"] = E.db[mPlugin].mBackupHover.cb
		E.db["nameplates"]["colors"]["glowColor"]["r"] = E.db[mPlugin].mBackupHover.cg
		E.db["nameplates"]["colors"]["glowColor"]["g"] = E.db[mPlugin].mBackupHover.cr
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["b"] = E.db[mPlugin].mBackupHover.bb
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["g"] = E.db[mPlugin].mBackupHover.bg
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["r"] = E.db[mPlugin].mBackupHover.br
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["border"] = E.db[mPlugin].mBackupHoverBorder
	end
end

function mMT:mNamePlateBorderColor()
	local classColor
	classColor = E:ClassColor(E.myclass, true)
	
	if E.global["nameplate"]["filters"]["ElvUI_Target"] then
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["b"] = classColor.b
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["g"] = classColor.g
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["r"] = classColor.r
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["border"] = true
	end

	E.db["nameplates"]["colors"]["glowColor"]["b"] = classColor.b
	E.db["nameplates"]["colors"]["glowColor"]["r"] = classColor.r
	E.db["nameplates"]["colors"]["glowColor"]["g"] = classColor.g
end

function mMT:mAchievementInfo(mID)
	local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(mID)
	local mAI = {name = name, icon = mMT:mIcon(icon)}
	return mAI
end

function mMT:mIcon(icon) 
	return format ("|T%s:0|t", icon)
end
