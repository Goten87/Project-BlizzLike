-- Aimed Shot fix by Mathix of ac-web.org

function AimedShotFix(event, plr, spellid)
	if( spellid == 49050 and IsPlayerMoving() == true ) then
		local aimedtarget = plr:GetSelection()
		plr:CastSpellOnTarget(49050, aimedtarget)
	end

	if( spellid == 49049 and IsPlayerMoving() == true ) then
		local aimedtarget = plr:GetSelection()
		plr:CastSpellOnTarget(49049, aimedtarget)
	end

	if( spellid == 27065 and IsPlayerMoving() == true ) then
		local aimedtarget = plr:GetSelection()
		plr:CastSpellOnTarget(27065, aimedtarget)
	end

	if( spellid == 20904 and IsPlayerMoving() == true ) then
		local aimedtarget = plr:GetSelection()
		plr:CastSpellOnTarget(20904, aimedtarget)
	end

	if( spellid == 20903  and IsPlayerMoving() == true ) then
		local aimedtarget = plr:GetSelection()
		plr:CastSpellOnTarget(20903, aimedtarget)
	end

	if( spellid == 20902 and IsPlayerMoving() == true ) then
		local aimedtarget = plr:GetSelection()
		plr:CastSpellOnTarget(20902, aimedtarget)
	end

	if( spellid == 20901 and IsPlayerMoving() == true ) then
		local aimedtarget = plr:GetSelection()
		plr:CastSpellOnTarget(20901, aimedtarget)
	end

	if( spellid == 20900 and IsPlayerMoving() == true ) then
		local aimedtarget = plr:GetSelection()
		plr:CastSpellOnTarget(20900, aimedtarget)
	end

	if( spellid == 19434 and IsPlayerMoving() == true ) then
		local aimedtarget = plr:GetSelection()
		plr:CastSpellOnTarget(19434, aimedtarget)
	end
end

RegisterServerHook(10, "AimedShotFix")