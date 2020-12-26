local E, L, V, P, G = unpack(ElvUI);
local mPlugin = "mMediaTag"
local addon, ns = ...

local function AddTooltipIcon(self, icon)
	if icon and E.db[mPlugin].mTIcon then
		local title = _G[self:GetName() .. "TextLeft1"]
		if title and not title:GetText():find("|T" .. icon) then
			title:SetFormattedText("|T%s:%d|t %s", icon, E.db[mPlugin].mTIconSize, title:GetText())
			title:Show()
		end
	end
end

local function hookItem(tip)
if tip then
	tip:HookScript("OnTooltipSetItem", function(self, ...)
		local name, link = self:GetItem()
		local icon = link and GetItemIcon(link)
		AddTooltipIcon(self, icon)
	end)
end
end

hookItem(_G["GameTooltip"])
hookItem(_G["ItemRefTooltip"])	
hookItem(_G["ShoppingTooltip1"])
hookItem(_G["ShoppingTooltip2"])	
hookItem(_G["ShoppingTooltip3"])
hookItem(_G["ItemRefShoppingTooltip1"])
hookItem(_G["ItemRefShoppingTooltip2"])	
hookItem(_G["ItemRefShoppingTooltip3"])


local function hookSpell(tip)
if tip then
	tip:HookScript("OnTooltipSetSpell", function(self, ...)
		if self:GetSpell() then
			local name, rank, icon = GetSpellInfo(self:GetSpell())
			AddTooltipIcon(self, icon)
		end
	end)
end
end

hookSpell(_G["GameTooltip"])
hookSpell(_G["ItemRefTooltip"])
hookSpell(_G["ShoppingTooltip1"])
hookSpell(_G["ShoppingTooltip2"])	
hookSpell(_G["ShoppingTooltip3"])
hookSpell(_G["ItemRefShoppingTooltip1"])
hookSpell(_G["ItemRefShoppingTooltip2"])	
hookSpell(_G["ItemRefShoppingTooltip3"])