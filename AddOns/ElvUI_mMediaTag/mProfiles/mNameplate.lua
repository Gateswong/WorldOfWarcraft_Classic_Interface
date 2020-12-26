local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin);
local addon, ns = ...

function mMT:NamplateProfile()
    return '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'
end