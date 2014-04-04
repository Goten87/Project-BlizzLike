--[[
Script by Mathix of ac-web.org
Thanks to Runemaster of ac-web.org 
]]
function LifestealEnchantFix(effectIndex, spell)
	local procnumber = math.random(1,10)

	if ( procnumber == 1) then
		local plr = spell:GetCaster()
		local maxhealth = plr:GetHealth()
		local lifestealenemy = plr:GetSelection()
		plr:SetHealth(maxhealth+30)
		plr:DealDamage(lifestealenemy, 30, 27104)
	end
end

RegisterDummySpell(27104, "LifestealEnchantFix")