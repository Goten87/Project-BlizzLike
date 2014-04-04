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

function IntimidatingShout_Spell_Fixe(event, plr, spellid)
	if (spellid == 65930) then
		Enemy = plr:GetClosestEnemy()
		if plr:GetDistanceYards(Enemy) < 15 then
			Enemy:AddAura(5782, 8000)
		end
	end
end

RegisterServerHook(10, "IntimidatingShout_Spell_Fixe")