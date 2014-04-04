-- Fan of Knives fix by Mathix of ac-web.org
-- A big thanks to Foereaper for the loop!
function FanOfKnivesFix(event, plr, spellid)
    if (spellid == 51723) then
        local Enemies = plr:GetInRangeEnemies()
		for _, v in ipairs(Enemies) do
			if plr:GetDistanceYards(v) <= 8 then
				plr:DealDamage(v, math.random(400, 500), 51723)
			end
		end
	end
end
 
RegisterServerHook(10, "FanOfKnivesFix")