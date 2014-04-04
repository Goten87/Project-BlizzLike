--High Interrogator Gerstahn <Twilight's Hammer Interrogator> SPELL FIXES
-- Feel free to remove spells that's already fixed.
-- By Mathix of ac-web.org

-- Manaburn
function OnCastManaBurn(event, plr, spellid)
	if (spellid == 14033) then
		local target = plr:GetRandomPlayer(4)
		local distance = plr:GetDistance(target)
		if distance <= 30 then
			local manaburnvalue = math.random(71, 78)
			local playermana = target:GetMaxMana();
			local manataken = playermana:manaburnvalue();
			player:SetMana(manataken)
		end
	end
end

RegisterServerHook(10, "OnCastManaBurn")

-- Psychic Scream
function OnCastPsychicScream(event, plr, spellid)
	if (spellid == 13704) then
		local targets = plr:GetInRangePlayers();
		local distance = plr:GetDistance(targets);
		if distance <= 8 then
			targets:AddAura(13704, 4000)
		end
	end
end

RegisterServerHook(10, "OnCastPsychicScream")

--Shadow Shield
function OnCastShadowShield(event, plr, spellid)
	plr:AddAura(12040, 30000)
	local damageabsorb = 200
end

function AbsorbShadowShield(unit, event, attacker, amount)
	if unit:HasAura(12040) then
		local damageabsorb = damageabsorb-amount
		if damageabsorb <= 0 then
			unit:RemoveAura(12040)
		elseif damageabsorb >=1 then
			local maxhp = unit:GetMaxHealth();
			unit:SetHealth(maxhp+amount);
		end
	end
end

RegisterServerHook(10, "OnCastShadowShield")
RegisterUnitEvent(9018, 23, "AbsorbShadowShield")

--Shadow Word: Pain (I ASSUME THIS IS FIXED SO I DID NOTHING TO THIS!
