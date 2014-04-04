-- Intimidation fix by Mathix of ac-web.org
function IntimidationFix(event, plr, spellid)
	if( spellid == 19577 ) then
		local pet = tostring(plr)
		local pettarget = pet:GetSelection();
		
		if( pettarget:IsFriendly() == false ) then
			pet:CastSpellOnTarget(19577, pettarget)
		end
	end
end

RegisterServerHook(10, "IntimidationFix")