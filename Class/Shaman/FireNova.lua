-- Fire nova fix, all ranks

function FireNova9(event, plr, spellid)
	if (spellid == 61657) then
		Enemys = plr:GetInRangeEnemies()
		if( plr:GetDistanceYards(Enemies) <= 10 ) then
			local damage = math.random(893,997)
			plr:DealDamage(Enemies, damage, 61657)
		end
	end
end

RegisterServerHook(10, "FireNova9")

function FireNova8(event, plr, spellid)
	if (spellid == 61649) then
		Enemys = plr:GetInRangeEnemies()
		if( plr:GetDistanceYards(Enemies) <= 10 ) then
			local damage = math.random(755,843)
			plr:DealDamage(Enemies, damage, 61649)
		end
	end
end

RegisterServerHook(10, "FireNova8")

function FireNova7(event, plr, spellid)
	if (spellid == 25547) then
		Enemys = plr:GetInRangeEnemies()
		if( plr:GetDistanceYards(Enemies) <= 10 ) then
			local damage = math.random(727,813)
			plr:DealDamage(Enemies, damage, 25547)
		end
	end
end

RegisterServerHook(10, "FireNova7")

function FireNova6(event, plr, spellid)
	if (spellid == 25546) then
		Enemys = plr:GetInRangeEnemies()
		if( plr:GetDistanceYards(Enemies) <= 10 ) then
			local damage = math.random(518,578)
			plr:DealDamage(Enemies, damage, 25546)
		end
	end
end

RegisterServerHook(10, "FireNova6")

function FireNova5(event, plr, spellid)
	if (spellid == 11315) then
		Enemys = plr:GetInRangeEnemies()
		if( plr:GetDistanceYards(Enemies) <= 10 ) then
			local damage = math.random(396,442)
			plr:DealDamage(Enemies, damage, 11315)
		end
	end
end

RegisterServerHook(10, "FireNova5")

function FireNova4(event, plr, spellid)
	if (spellid == 11314) then
		Enemys = plr:GetInRangeEnemies()
		if( plr:GetDistanceYards(Enemies) <= 10 ) then
			local damage = math.random(281,317)
			plr:DealDamage(Enemies, damage, 11314)
		end
	end
end

RegisterServerHook(10, "FireNova4")

function FireNova3(event, plr, spellid)
	if (spellid == 8499) then
		Enemys = plr:GetInRangeEnemies()
		if( plr:GetDistanceYards(Enemies) <= 10 ) then
			local damage = math.random(184,208)
			plr:DealDamage(Enemies, damage, 8499)
		end
	end
end

RegisterServerHook(10, "FireNova3")

function FireNova2(event, plr, spellid)
	if (spellid == 8498) then
		Enemys = plr:GetInRangeEnemies()
		if( plr:GetDistanceYards(Enemies) <= 10 ) then
			local damage = math.random(102,116)
			plr:DealDamage(Enemies, damage, 8498)
		end
	end
end

RegisterServerHook(10, "FireNova2")

function FireNova1(event, plr, spellid)
	if ( spellid == 1535 ) then
		Enemys = plr:GetInRangeEnemies()
		if( plr:GetDistanceYards(Enemies) <= 10 ) then
			local damage = math.random(48,56)
			plr:DealDamage(Enemies, damage, 1535)
		end
	end
end

RegisterServerHook(10, "FireNova1")