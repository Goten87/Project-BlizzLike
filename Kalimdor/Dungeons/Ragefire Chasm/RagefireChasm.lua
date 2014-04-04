--[[
Ragefire Chasm script (FULL DUNGEON)

Scripted by: Mathix of ac-web.org
Progress: 99%
]]

--Taragaman The Hungerer
function TaragamanOnCombat(unit, event, attacker)
	unit:RegisterEvent(TaragamanSpell1, 10000, 0)
	unit:RegisterEvent(TaragamanSpell2, 10000, 0)
end

function TaragamanSpell1(unit, event, attacker)
	unit:FullCastSpellOnTarget(11970, unit)
end

function TaragamanSpell2(unit, event, attacker)
	unit:FullCastSpellOnTarget(18072, unit:GetMainTank())
end

RegisterUnitEvent(11520, 1, "TaragamanOnCombat")

-- Jergosh the Invoker
function JergoshOnCombat(unit, event, attacker)
	unit:RegisterEvent(JergoshSpell1, 15000, 0)
	unit:RegisterEvent(JergoshSpell2, 10000, 0)
end

function JergoshSpell1(unit, event, attacker)
	unit:FullCastSpellOnTarget(20800, unit:GetMainTank())
end

function JergoshSpell2(unit, event, attacker)
	unit:FullCastSpellOnTarget(18267, unit:GetMainTank())
end

RegisterUnitEvent(11518, 1, "JergoshOnCombat")

-- Bazzalan
function BazzalanOnCombat(unit, event, attacker)
	unit:RegisterEvent(BazzalanSpell1, 15000, 0)
	unit:RegisterEvent(BazzalanSpell2, 5000, 0)
end

function BazzalanSpell1(unit, event, attacker)
	unit:FullCastSpellOnTarget(14873, unit:GetMainTank())
end

function BazzalanSpell2(unit, event, attacker)
	local maintank = unit:GetMainTank()
	maintank:AddAura(2818, 12000)
end

RegisterUnitEvent(11519, 1, "BazzalanOnCombat")

-- Oggleflint
function OggleflintOnCombat(unit, event, attacker)
	unit:RegisterEvent(OggleflintSpell1, 10000, 0)
end

function OggleflintSpell2(unit, event, attacker)
	unit:FullCastSpellOnTarget(40505, unit:GetMainTank())
end

RegisterUnitEvent(11517, 1, "OggleflintOnCombat")

--[[ Bloodfiller Orb
when you click this orb a npc will spawn (need gobject ID to complete this)]]

-- Earthborer
function EarthborerOnCombat(unit, event, attacker)
	unit:RegisterEvent(EarthborerSpell1, 15000, 0)
end

function EarthBorerSpell1(unit, event, attacker)
	unit:FullCastSpellOnTarget(18070, unit:GetMainTank())
end

RegisterUnitEvent(11320, 1, "EarthborerOnCombat")

-- Molten Elemental
function MoltenElementalOnCombat(unit, event, attacker)
	unit:RegisterEvent(MoltenElementalSpell1, 40000, 0)
end

function MoltenElementalSpell1(unit, event, attacker)
	unit:FullCastSpellOnTarget(134, unit)
end

RegisterUnitEvent(11321, 1, "MoltenElementalOnCombat")

-- Blade Cultist
function BladCultistOnCombat(unit, event, attacker)
	unit:RegisterEvent(BladCultistSpell1, 30000, 0)
end

function BladeCultistSpell1(unit, event, attacker)
	unit:FullCastSpellOnTarget(18266, unit:GetMainTank())
end

RegisterUnitEvent(11322, 1, "BladCultistOnCombat")

-- Searing Blade Enforcerer
function SearingBladeEnforcererOnCombat(unit, event, attacker)
	unit:RegisterEvent(SearingBladeEnforcererSpell1, 15000, 0)
end

function SearingBladeEnforcererSpell1(unit, event, attacker)
	unit:FullCastSpellOnTarget(8242, unit:GetMainTank())
end

RegisterUnitEvent(11323, 1, "SearingBladeEnforcererOnCombat")

-- Searing Blade Warlock
function SearingBladeWarlockOnCombat(unit, event, attacker)
	unit:RegisterEvent(SearingBladeWarlockSpell1, 20000, 0)
	unit:RegisterEvent(SearingBladeWarlockSpell2, 1000, 1)
end

function SearingBladeWarlockSpell1(unit, event, attacker)
	unit:FullCastSpellOnTarget(20791, unit:GetMainTank())
end

function SearingBladeWarlockSpell2(unit, event, attacker)
	if SearingBladeWarlockPet == 0 then
		unit:CreateGuardian(8996, 120000, 0, 14)
		local SearingBladeWarlockPet = 1
	end
end

function SearingBladeWarlockPetOnDied(unit, event, lasttarget)
	local SearingBladeWarlockPet = 0
end

RegisterUnitEvent(11324, 1, "SearingBladeWarlockOnCombat")
RegisterUnitEvent(8996, 4, "SearingBladeWarlockPetOnDied")

-- Ragefire Trogg

function RagefireTroggOnCombat(unit, event, attacker)
	unit:RegisterEvent(RagefireTroggSpell1, 40000, 0)
end

function RagefireTroggSpell1(unit, event, attacker)
	unit:FullCastSpellOnTarget(11976, unit:GetMainTank())
end

RegisterUnitEvent(11318, 1, "RagefireTroggOnCombat")

-- Ragefire Shaman
function RagefireShamanOnCombat(unit, event, attacker)
	unit:RegisterEvent(RagefireShamanSpell1, 15, 0)
	unit:RegisterEvent(RagefireShamanSpell2, 20, 0)
end

function RagefireShamanSpell1(unit, event, attacker)
	local RagefireShamanFriend = unit:GetRandomFriend()
	if RagefireShamanFriend:GetHealthPct() <= 75 then
		unit:FullCastSpellOnTarget(11986, RagefireShamanFriend)
	else 
		local RagefireShamanFriend = unit:GetRandomFriend()
	end
end

function RagefireShamanSpell2(unit, event, attacker)
	unit:FullCastSpellOnTarget(9532, unit:GetMainTank())
end

RegisterUnitEvent(11319, 1, "RagefireShamanOnCombat")
