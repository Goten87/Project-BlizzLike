--[[
Deadmines Script
By DarkAngel39
]]

-- Defias Blackguard
local NPC_BLACKGUARD	= 636
local SPELL_SHOT		= 1833
local SPELL_FADE		= 6408
local SPELL_RUPTURE		= 14903
 -- local SPELL_STEALTH		= 8874

-- Defias Pirate
local NPC_PIRATE		= 657
local NPC_BURD			= 3450
local SPELL_SUM			= 5172

local self = getfenv(1)

function BlackguardOnCombat(pUnit,event)
self[tostring(pUnit)] = {
rapture = math.random(5,9),
fade = math.random(10,15)
}
pUnit:FullCastSpell(SPELL_FADE)
pUnit:RegisterAIUpdateEvent(1000)
end

function BlackguardAI(pUnit)
if(pUnit == nil)then
	pUnit:RemoveAIUpdateEvent()
end
if(pUnit:GetNextTarget() == nil)then
	pUnit:WipeThreatList()
	return
end
local vars = self[tostring(pUnit)]
if(pUnit:HasAura(SPELL_FADE))then
	if(pUnit:GetDistanceYards(pUnit:GetMainTank()) < 5)then
		pUnit:CastSpellOnTarget(SPELL_SHOT, pUnit:GetMainTank())
		pUnit:RemoveAura(SPELL_FADE)
	end
else
	vars.rapture = vars.rapture - 1
	if(vars.fade > 0)then
		vars.fade = vars.fade - 1
		if(vars.fade == 0)then
			pUnit:FullCastSpell(SPELL_FADE)
		end
	end
	if(vars.rapture <= 0)then
		pUnit:CastSpellOnTarget(SPELL_RUPTURE, pUnit:GetMainTank())
	end
end
end

function BlackguardOnDied(pUnit)
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

function BlackguardOnLeaveCombat(pUnit)
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

function PirateOnLoad(pUnit)
local bird = pUnit:GetCreatureNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),NPC_BURD)
if not(bird or pUnit:GetDistanceYards(bird) < 15)then
	pUnit:CastSpell(SPELL_SUM)
end
end

RegisterUnitEvent(NPC_BLACKGUARD,1,BlackguardOnCombat)
RegisterUnitEvent(NPC_BLACKGUARD,2,BlackguardOnLeaveCombat)
RegisterUnitEvent(NPC_BLACKGUARD,4,BlackguardOnDied)
RegisterUnitEvent(NPC_BLACKGUARD,21,BlackguardAI)

RegisterUnitEvent(NPC_PIRATE,18,PirateOnLoad)
