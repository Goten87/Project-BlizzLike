-------------------------------------------------------------------
-- This script is created by zdroid9770; please do not edit this --
-- script and claim it as your own, as of All rights are claimed --
-- by me.                                                        --
--                     Copyright© zdroid9770					 --
-------------------------------------------------------------------

SHADOW = {}

function SHADOW.fiend(event, pPlayer, SpellId, pSpellObject)
	if(SpellId == 34433) then
		local unit = pPlayer:GetClosestFriend()
		local faction = pPlayer:GetFaction()
		unit:SetFaction(faction)
	end
end

RegisterServerHook(10, "SHADOW.fiend")
	

	
	
	

