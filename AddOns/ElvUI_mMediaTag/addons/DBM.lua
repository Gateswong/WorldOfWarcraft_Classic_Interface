local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);

function mMT:LoadDBMProfile()

DBM_AllSavedOptions = {
	["Default"] = {
		["DontShowFarWarnings"] = true,
		["ChosenVoicePack"] = "None",
		["DontShowHudMap2"] = false,
		["AlwaysPlayVoice"] = false,
		["ShowSWarningsInChat"] = true,
		["DontShowNameplateLines"] = false,
		["RangeFrameRadarY"] = -135.0001068115234,
		["DontRestoreIcons"] = false,
		["DontShowNameplateIcons"] = false,
		["CoreSavedRevision"] = 20200419142434,
		["RangeFrameX"] = 369.760498046875,
		["RangeFrameY"] = -218.0002899169922,
		["FilterInterruptNoteName"] = false,
		["EnableModels"] = true,
		["SpecialWarningFlashAlph3"] = 0.4,
		["ArrowPoint"] = "TOP",
		["SWarnNameInNote"] = true,
		["FakeBWVersion"] = false,
		["InfoFramePoint"] = "LEFT",
		["EventSoundMusicCombined"] = false,
		["SpecialWarningFlashCol2"] = {
			1, -- [1]
			0.5, -- [2]
			0, -- [3]
		},
		["WarningAlphabetical"] = true,
		["WarningFont"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\PTSansNarrow.ttf",
		["CheckGear"] = true,
		["SpecialWarningX"] = 0,
		["WorldBossAlert"] = false,
		["DontShowPT2"] = false,
		["DontShowSpecialWarnings"] = false,
		["MoviesSeen"] = {
		},
		["ShowQueuePop"] = true,
		["ShowAllVersions"] = true,
		["ForumsMessageShown"] = false,
		["DontShowTargetAnnouncements"] = true,
		["ShowWarningsInChat"] = true,
		["SpecialWarningFontCol"] = {
			1, -- [1]
			0.7, -- [2]
			0, -- [3]
		},
		["WarningFontStyle"] = "None",
		["EventSoundEngage2"] = "None",
		["InfoFrameY"] = -131.0001373291016,
		["ChatFrame"] = "DEFAULT_CHAT_FRAME",
		["WarningIconRight"] = true,
		["UseSoundChannel"] = "Master",
		["RangeFrameRadarX"] = 243.0003051757813,
		["ShowRespawn"] = true,
		["EventSoundWipe"] = "None",
		["AlwaysShowSpeedKillTimer2"] = false,
		["FilterDispel"] = true,
		["DebugLevel"] = 1,
		["LFDEnhance"] = true,
		["SpecialWarningFlashDura1"] = 0.4,
		["DontShowPTNoID"] = false,
		["HideGarrisonToasts"] = true,
		["RangeFramePoint"] = "LEFT",
		["SpecialWarningFontShadow"] = false,
		["EventMusicMythicFilter"] = true,
		["HideBossEmoteFrame2"] = true,
		["HideObjectivesFrame"] = true,
		["SpecialWarningShortText"] = true,
		["DontShowPTText"] = false,
		["SpecialWarningFontSize2"] = 35,
		["SpecialWarningFlashCol5"] = {
			0.2, -- [1]
			1, -- [2]
			1, -- [3]
		},
		["SpecialWarningFlashAlph4"] = 0.4,
		["PTCountThreshold2"] = 5,
		["SpecialWarningFlashCount2"] = 1,
		["EventSoundDungeonBGM"] = "None",
		["CountdownVoice2"] = "Kolt",
		["AutoAcceptGuildInvite"] = false,
		["ArrowPosX"] = 0,
		["AITimer"] = true,
		["SpecialWarningFlashDura3"] = 1,
		["WarningShortText"] = true,
		["SpecialWarningSound4"] = 9278,
		["DisableSFX"] = false,
		["AutologBosses"] = false,
		["SpecialWarningFlashDura4"] = 0.7,
		["SpecialWarningFlashCol3"] = {
			1, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["WarningColors"] = {
			{
				["r"] = 0.4117647058823529,
				["g"] = 0.8,
				["b"] = 0.9411764705882353,
			}, -- [1]
			{
				["r"] = 0.9490196078431372,
				["g"] = 0.9490196078431372,
				["b"] = 0,
			}, -- [2]
			{
				["r"] = 1,
				["g"] = 0.5019607843137255,
				["b"] = 0,
			}, -- [3]
			{
				["r"] = 1,
				["g"] = 0.1019607843137255,
				["b"] = 0.1019607843137255,
			}, -- [4]
		},
		["SWarningAlphabetical"] = true,
		["ShowGuildMessagesPlus"] = false,
		["BlockNoteShare"] = false,
		["DebugMode"] = false,
		["DisableGuildStatus"] = false,
		["LatencyThreshold"] = 250,
		["ModelSoundValue"] = "Short",
		["SpecialWarningSound"] = 8174,
		["SpecialWarningSound3"] = "Interface\\AddOns\\DBM-Core\\sounds\\AirHorn.ogg",
		["DontShowInfoFrame"] = false,
		["RangeFrameRadarPoint"] = "LEFT",
		["SpecialWarningY"] = 75,
		["StripServerName"] = true,
		["ShowGuildMessages"] = true,
		["RangeFrameUpdates"] = "Average",
		["MovieFilter2"] = "OnlyFight",
		["DontRestoreRange"] = false,
		["RaidWarningSound"] = 11742,
		["CustomSounds"] = 0,
		["ShortTimerText"] = true,
		["SpecialWarningFlashCount3"] = 3,
		["RoleSpecAlert"] = true,
		["WhisperStats"] = false,
		["VoiceOverSpecW2"] = "DefaultOnly",
		["LogOnlyNonTrivial"] = true,
		["DontPlayPTCountdown"] = false,
		["SpecialWarningFlashAlph5"] = 0.5,
		["SpecialWarningDuration2"] = 1.5,
		["SpecialWarningFlashCount5"] = 3,
		["RangeFrameSound1"] = "none",
		["WarningIconLeft"] = true,
		["RangeFrameLocked"] = false,
		["SpecialWarningSound2"] = 15391,
		["WarningFontSize"] = 20,
		["EventSoundVictory2"] = "None",
		["SpecialWarningFlashDura2"] = 0.4,
		["LastRevision"] = 0,
		["DontShowReminders"] = false,
		["SettingsMessageShown"] = true,
		["InfoFrameX"] = 371.7606811523438,
		["ArrowPosY"] = -150,
		["SpecialWarningFlashCount4"] = 2,
		["RangeFrameSound2"] = "none",
		["DontSetIcons"] = false,
		["BigBrotherAnnounceToRaid"] = false,
		["SpecialWarningFlash2"] = true,
		["CountdownVoice"] = "Corsica",
		["RecordOnlyBosses"] = false,
		["CountdownVoice3"] = "Smooth",
		["DontShowUserTimers"] = false,
		["SpecialWarningPoint"] = "CENTER",
		["AutoRespond"] = true,
		["DisableStatusWhisper"] = false,
		["EventDungMusicMythicFilter"] = true,
		["SpecialWarningFlash4"] = true,
		["RangeFrameFrames"] = "radar",
		["DontPlayCountdowns"] = false,
		["ShowBigBrotherOnCombatStart"] = false,
		["SpecialWarningIcon"] = true,
		["DontShowRangeFrame"] = false,
		["SpecialWarningFlashAlph1"] = 0.3,
		["ShowDefeatMessage"] = true,
		["FilterTankSpec"] = true,
		["WarningDuration2"] = 1.5,
		["SpecialWarningFont"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\PTSansNarrow.ttf",
		["InfoFrameShowSelf"] = false,
		["WarningFontShadow"] = true,
		["SpecialWarningFlash1"] = true,
		["DontShowBossAnnounces"] = false,
		["DontShowBossTimers"] = false,
		["SpecialWarningFontStyle"] = "THICKOUTLINE",
		["WarningX"] = 0,
		["SpecialWarningFlashAlph2"] = 0.3,
		["SpecialWarningFlashDura5"] = 1,
		["WorldBossNearAlert"] = false,
		["InfoFrameLines"] = 0,
		["SpecialWarningFlashCol4"] = {
			1, -- [1]
			0, -- [2]
			1, -- [3]
		},
		["SpecialWarningFlashCol1"] = {
			1, -- [1]
			1, -- [2]
			0, -- [3]
		},
		["AutoAcceptFriendInvite"] = false,
		["WarningIconChat"] = true,
		["SpecialWarningFlashCount1"] = 1,
		["HideGuildChallengeUpdates"] = true,
		["SpecialWarningSound5"] = 128466,
		["DontSendYells"] = false,
		["ShowPizzaMessage"] = true,
		["AdvancedAutologBosses"] = false,
		["HideTooltips"] = false,
		["SpecialWarningFlash3"] = true,
		["SWarnClassColor"] = true,
		["Enabled"] = true,
		["DontShowSpecialWarningText"] = false,
		["WarningPoint"] = "CENTER",
		["FilterVoidFormSay"] = true,
		["ShowEngageMessage"] = true,
		["SpecialWarningFlash5"] = true,
		["WarningY"] = 260,
		["HideQuestTooltips"] = true,
		["EventSoundMusic"] = "None",
		["AutoReplySound"] = true,
		["RLReadyCheckSound"] = true,
		["FilterTrashWarnings2"] = true,
		["FilterInterrupt2"] = "TandFandBossCooldown",
		["AFKHealthWarning"] = false,
		["DontShowPTCountdownText"] = false,
		["HelpMessageVersion"] = 3,
	},
}
DBM_MinimapIcon = {
		["hide"] = true,
}
end