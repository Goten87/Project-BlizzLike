--[[
Script by Mathix of ac-web.org
]]

function FieryWeaponEnchantFix(effectIndex, spell)
	local procnumber = math.random(1,10)

	if ( procnumber == 1 )  then
		local plr = spell:GetCaster()
		local fieryenemy = plr:GetSelection()
		plr:DealDamage(fieryenemy, 40, 30183)
	end
end

RegisterDummySpell(30183, "FieryWeaponEnchantFix")