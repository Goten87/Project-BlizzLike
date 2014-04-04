-------------------------------------------------------------------
-- This script is created by zdroid9770; please do not edit this --
-- script and claim it as your own, as of All rights are claimed --
-- by me.                                                        --
--                     Copyright© zdroid9770					 --
-------------------------------------------------------------------

function OnCastThunderstorm2(event, plr, spellid)
	if(spellid == 59156) then
		plr:CastSpell(2023)
	end
end

RegisterServerHook(10, "OnCastThunderstorm2")