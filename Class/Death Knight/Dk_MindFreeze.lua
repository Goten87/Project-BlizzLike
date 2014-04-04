-------------------------------------------------------------------
-- This script is created by zdroid9770; please do not edit this --
-- script and claim it as your own, as of All rights are claimed --
-- by Holystone Productions.                                     --
--                     Copyright© zdroid9770					 --
-------------------------------------------------------------------
--//////////////////////////////////
--//// © Holystone Productions  ////
--////     Cronic & Warfrost    ////
--////       Copy Right         ////
--////  Blizzlike Repack v 2.5  ////
--//////////////////////////////////

function Dk_MindFreeze_Fixe(event, plr, spellid)
	if (spellid == 47528) then
		Target = plr:GetSelection()
		Target:InterruptSpell()
		Target:AddAura(53550, 4000)
	end
end

RegisterServerHook(10, "Dk_MindFreeze_Fixe")