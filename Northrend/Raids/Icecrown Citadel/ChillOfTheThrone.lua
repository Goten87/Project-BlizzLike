-- By Domicroat of ac-web.org

function Player_OnEnterWorld(pUnit, event)

local plrs = GetPlayersInWorld();
	for k, v in pairs(plrs) do
		if(v:HasAura(69127) == false) then
			if(v:GetMapId() == 631) then
				SetDBCSpellVar(69127, "c_is_flags", 0x01000)
				v:CastSpell(69127)
			end
		elseif(v:GetMapId() ~= 631) then
			v:RemoveAura(69127)
		end  
	end
end

RegisterTimedEvent("Player_OnEnterWorld", 1000, 0)