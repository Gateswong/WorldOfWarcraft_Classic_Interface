local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);

function mMT:LoadLocPlusProfile()
	E.db["LocationMover"] = "TOP,ElvUIParent,TOP,0,-4"
	E.db["ttreczones"] = false
	E.db["ttrecinst"] = false
	E.db["ht"] = true
	E.db["dtwidth"] = 80
	E.db["dig"] = false
	E.db["dtheight"] = 20
	E.db["customCoordsColor"] = 2
	E.db["fish"] = false
	E.db["lpwidth"] = 220
	E.db["both"] = false
	E.db["displayOther"] = "NONE"
	E.db["prof"] = false
	E.db["LoginMsg"] = false
	E.db["petlevel"] = false
	E.db["ttlvl"] = false
end