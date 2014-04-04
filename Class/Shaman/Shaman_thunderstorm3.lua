-------------------------------------------------------------------
-- This script is created by zdroid9770; please do not edit this --
-- script and claim it as your own, as of All rights are claimed --
-- by me.                                                        --
--                     Copyright© zdroid9770					 --
-------------------------------------------------------------------

function OnCastThunderstorm3(event, plr, spellid)
	if(spellid == 59158) then
		plr:CastSpell(11903)
	end
end

RegisterServerHook(10, "OnCastThunderstorm3")