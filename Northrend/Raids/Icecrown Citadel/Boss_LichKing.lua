------------------------------------------------------------------
--[[
This script was made by Stoneharry of www.MMOwned.com
This script may be edited and changed at will, but credits must be provided.
Thank you.

Please note the following has not been included within this script:
- Defile
- Frostmourne Chamber
]]
------------------------------------------------------------------

local Lich = nil
local Tirion = nil
local package = nil
local Terenas = nil
local Garfield = nil
local Object = nil
local Count = 0
local Phase = 0
local Players_Wiped = 0
local CheatMode = true -- If this is set to true then you can use #startlk and #endlk to to the intro and outro without actually fighting him. :) CAN BE VERY BUGGY!

---- Checkers ----------------------------------------------------

if GetLuaEngine() ~= "LuaHypArc" then -- Make sure we are using LuaHypArc
	print("-------------------------------------------------------------------")
	print("LuaHypArc is not installed. This script may not function correctly.")
	print("LuaHypArc comes with ArcEmu by default.")
	print("-------------------------------------------------------------------")
	else
	print("-------------------------------------------------------")
	print("-- The Lich King - Made by Stoneharry of MMOwned.com --")
	print("--                     Enjoy                         --")
	print("-------------------------------------------------------")
end

---- Lich King ---------------------------------------------------

function LichKing_OnSpawn(pUnit, Event)
	pUnit:RegisterEvent("LichKing_OnSpawn_Go", 1000, 1)
end

function LichKing_OnSpawn_Go(pUnit, Event)
	if Lich ~= nil then -- Do a check
	Lich:RemoveFromWorld()
	end
	Lich = pUnit
	Lich:SetFaction(35)
end

RegisterUnitEvent(3072111, 18, "LichKing_OnSpawn")

function LichKing_OnLeaveJewCombat(pUnit, Event)
	if Players_Wiped == 1 then
	Players_Wiped = 0
	Lich:SetHealthPct(10)
	else
	pUnit:RemoveEvents()
	end
end

RegisterUnitEvent(3072111, 2, "LichKing_OnLeaveJewCombat")

---- Tirion ------------------------------------------------------

function TirionFordring_OnSpawn(pUnit, Event)
        Tirion = pUnit
	pUnit:RegisterEvent("TirionFordring_OnSpawn_Go", 5000, 0)
end

function TirionFordring_OnSpawn_Go(pUnit, Event)
	if Lich ~= nil then -- If theres no lich king we can't start the event
		local plr = pUnit:GetClosestPlayer()
		if plr ~= nil then -- we need a player
			if pUnit:GetDistanceYards(plr) < 5 then -- we are close enough to start
				local PlayersAllAround = pUnit:GetInRangePlayers()
				for a, players in pairs(PlayersAllAround) do
				players:CastSpell(69127)
				end
			pUnit:PlaySoundToSet(17458)
			pUnit:RemoveEvents() -- Stop repeating
			Lich:MoveTo(461.47, -2123.73, 1572.1, 0)
			pUnit:Emote(375, 60000)
			pUnit:PlaySoundToSet(17349) -- pUnit since players are closer to him
			Lich:SendChatMessage(14, 0, "So...the Light's vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?")
			pUnit:RegisterEvent("TirionFordring_OnSpawn_Goz", 13500, 1)
			end
		end
	end
end

RegisterUnitEvent(26529762, 18, "TirionFordring_OnSpawn")

function TirionFordring_OnSpawn_Goz(pUnit, Event)
	pUnit:SendChatMessage(14,0,"We will grant you a swift death, Arthas. More than can be said for the thousands you've tortured and slain.")
	pUnit:PlaySoundToSet(17390)
	local PlayersAllAround = pUnit:GetInRangePlayers()
	for a, players in pairs(PlayersAllAround) do
	players:CastSpell(69127)
	end
	pUnit:RegisterEvent("TirionFordring_OnSpawn_Gozz", 9000, 1)
end

function TirionFordring_OnSpawn_Gozz(pUnit, Event)
	Lich:SendChatMessage(14,0,"You will learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power.")
	pUnit:PlaySoundToSet(17350)
	Lich:Emote(397, 4000)
	pUnit:RegisterEvent("zTirionFordring_OnSpawn_Gozzz", 4500, 1)
	pUnit:RegisterEvent("zzTirionFordring_OnSpawn_Gozzz", 12000, 1)
	pUnit:RegisterEvent("TirionFordring_OnSpawn_Gozzz", 22000, 1)
end

function zTirionFordring_OnSpawn_Gozzz(pUnit, Event)
	Lich:Emote(1, 6000)
end

function zzTirionFordring_OnSpawn_Gozzz(pUnit, Event)
	Lich:Emote(392, 3500)
end

function TirionFordring_OnSpawn_Gozzz(pUnit, Event)
	Lich:SendChatMessage(14,0,"So be it. Champions, attack!")
	pUnit:PlaySoundToSet(17391)
	pUnit:Emote(397, 2000)
	pUnit:RegisterEvent("PATHETIC_RUN_TIRION", 2000, 1)
	pUnit:RegisterEvent("TirionFordring_OnSpawn_Gozzzz", 3000, 1)
	pUnit:RegisterEvent("TirionFordring_zzz_Gozzzz", 4500, 1)
end

function PATHETIC_RUN_TIRION(pUnit, Event)
	pUnit:SetMovementFlags(1)
	pUnit:MoveTo(485.92, -2123.2, 1572.1, 3.17)
end

function TirionFordring_OnSpawn_Gozzzz(pUnit, Event)
	Lich:SendChatMessage(14,0,"I'll keep you alive to witness the end, Fordring. I would not want the Light's greatest champion to miss seeing this wretched world remade in my image.")
	pUnit:PlaySoundToSet(17351)
	local PlayersAllAround = pUnit:GetInRangePlayers()
	for a, players in pairs(PlayersAllAround) do
	players:CastSpell(69127)
	end
	Tirion = pUnit
end

function TirionFordring_zzz_Gozzzz(pUnit, Event)
	Tirion:CastSpell(71614)
	Lich:SetFaction(22)
end

-------- Rage Counter ---------------------------------------------

function Rage_Counter_Lich_King(pUnit, Event)
	if Lich == nil then
	pUnit:RemoveEvents()
	else
		if Count == 300 then
			if Phase == 2 then
			Count = 0
			Phase = 0
			Lich:RemoveEvents()
			Lich:SendChatMessage(14,0,"Face now your tragic end!")
			Lich:PlaySoundToSet(17365)
			else
			Lich:FullCastSpell(61714) -- Enrage, basic method used by most bosses, not real spell
			Phase = Phase + 1
			end
		else
		Count = Count + 5
		end
	end
end

-------- Fight ----------------------------------------------------

function LichKingHasEnteredCombatLawl_Phase_One(pUnit, Event)
	if Tirion == nil then
	pUnit:Despawn(1, 10000) -- Where the F is he
	Lich = nil -- Reset
	else
		if Players_Wiped == 1 then
		--Players_Wiped = 0
		Lich:SetHealthPct(10)
		else
			local Dungeon = pUnit:GetDungeonDifficulty()
			if Dungeon == 0 then -- 10man normal
			Lich:SetCombatCapable(0)
			Lich:RegisterEvent("Rage_Counter_Lich_King", 5000, 0)
			Lich:RegisterEvent("Adds_Spawning_Incoming_Dredge_Ghouls", 19000, 0) -- Every 20 seconds (19 + 1 for next)
			Lich:RegisterEvent("Adds_Spawning_Incoming_Shambling_Horror", math.random(60000,70000), 0) -- Every 60-70 seconds (changes each match)
			Lich:RegisterEvent("Necrotic_Plague_Incoming", 20000, 0)
			Lich:RegisterEvent("Infest_Big_AOE_Incoming", 30000, 0)
			Lich:RegisterEvent("Phase_Two_Checker", 2500, 0)
			end
			if Dungeon == 1 then -- 10man heroic
			Lich:SetMaxHealth(29009376)
			Lich:SetHealth(29009376)
			Lich:SetCombatCapable(0)
			Lich:RegisterEvent("Rage_Counter_Lich_King", 5000, 0)
			Lich:RegisterEvent("Adds_Spawning_Incoming_Dredge_Ghouls", 19000, 0) -- Every 20 seconds (19 + 1 for next)
			Lich:RegisterEvent("Adds_Spawning_Incoming_Shambling_Horror", math.random(60000,70000), 0) -- Every 60-70 seconds (changes each match)
			Lich:RegisterEvent("zNecrotic_Plague_Incoming", 20000, 0)
			Lich:RegisterEvent("zInfest_Big_AOE_Incoming", 30000, 0)
			Lich:RegisterEvent("Phase_Two_Checker", 2500, 0)
			end
			if Dungeon == 2 then -- 25man normal
			Lich:SetMaxHealth(60109376)
			Lich:SetHealth(60109376)
			Lich:SetCombatCapable(0)
			Lich:RegisterEvent("Rage_Counter_Lich_King", 5000, 0)
			Lich:RegisterEvent("Adds_Spawning_Incoming_Dredge_Ghouls", 19000, 0) -- Every 20 seconds (19 + 1 for next)
			Lich:RegisterEvent("Adds_Spawning_Incoming_Shambling_Horror", math.random(60000,70000), 0) -- Every 60-70 seconds (changes each match)
			Lich:RegisterEvent("zzNecrotic_Plague_Incoming", 20000, 0)
			Lich:RegisterEvent("zzInfest_Big_AOE_Incoming", 30000, 0)
			Lich:RegisterEvent("Phase_Two_Checker", 2500, 0)
			end
			if Dungeon == 3 then -- 25man heroic
			Lich:SetMaxHealth(61009376)
			Lich:SetHealth(61009376)
			Lich:SetCombatCapable(0)
			Lich:RegisterEvent("Rage_Counter_Lich_King", 5000, 0)
			Lich:RegisterEvent("Adds_Spawning_Incoming_Dredge_Ghouls", 19000, 0) -- Every 20 seconds (19 + 1 for next)
			Lich:RegisterEvent("Adds_Spawning_Incoming_Shambling_Horror", math.random(60000,70000), 0) -- Every 60-70 seconds (changes each match)
			Lich:RegisterEvent("zzNecrotic_Plague_Incoming", 20000, 0)
			Lich:RegisterEvent("zzInfest_Big_AOE_Incoming", 30000, 0)
			Lich:RegisterEvent("Phase_Two_Checker", 2500, 0)
			end
		end
	end
end

function Adds_Spawning_Incoming_Dredge_Ghouls(pUnit, Event)
	Lich:RegisterEvent("Adds_Spawning_Incoming_Dredge_Ghoulsz", 1000, 3) -- 3 times
end

function Adds_Spawning_Incoming_Dredge_Ghoulsz(pUnit, Event)
	local x = Lich:GetX()
	local y = Lich:GetY()
	local z = Lich:GetZ()
	local o = Lich:GetO()
	if math.random(1,2) == 1 then -- Spawn in different locations basically
	Lich:SpawnCreature(3769511, x+math.random(1,6), y+math.random(1,6), z, o, 15, 360000)
	else
	Lich:SpawnCreature(3769511, x-math.random(1,6), y-math.random(1,6), z, o, 15, 360000)
	end
end

function Adds_Spawning_Incoming_Shambling_Horror(pUnit, Event)
	local x = Lich:GetX()
	local y = Lich:GetY()
	local z = Lich:GetZ()
	local o = Lich:GetO()
	if math.random(1,2) == 1 then -- Spawn in different locations basically
	Lich:SpawnCreature(3769811, x+math.random(1,6), y+math.random(1,6), z, o, 15, 360000)
	else
	Lich:SpawnCreature(3769811, x-math.random(1,6), y-math.random(1,6), z, o, 15, 360000)
	end
end

function Necrotic_Plague_Incoming(pUnit, Event) -- 10 man
	local plr = Lich:GetRandomPlayer(0)
	if plr ~= nil then
	Lich:FullCastSpellOnTarget(70337, plr)
	end
end

function Infest_Big_AOE_Incoming(pUnit, Event)
	Lich:FullCastSpell(70541)
end

function zNecrotic_Plague_Incoming(pUnit, Event) -- 10 man heroic
	local plr = Lich:GetRandomPlayer(0)
	if plr ~= nil then
	Lich:FullCastSpellOnTarget(73912, plr)
	end
end

function zInfest_Big_AOE_Incoming(pUnit, Event)
	Lich:FullCastSpell(73780)
end

function zzNecrotic_Plague_Incoming(pUnit, Event) -- 25 man
	local plr = Lich:GetRandomPlayer(0)
	if plr ~= nil then
	Lich:FullCastSpellOnTarget(73779, plr)
	end
end

function zzInfest_Big_AOE_Incoming(pUnit, Event)
	Lich:FullCastSpell(73780)
end

RegisterUnitEvent(3072111, 1, "LichKingHasEnteredCombatLawl_Phase_One")

function Phase_Two_Checker(pUnit, Event)
	if Lich:GetHealthPct() < 71 then
	Lich:RemoveEvents()
	Lich:MoveTo(512.7, -2120.5, 1572.1, 0)
	Lich:SetMovementFlags(1)
	Lich:SetCombatCapable(1)
	Lich:RegisterEvent("Test_Debug_MoveToCentreOfRoom", 100, 0)
	Lich:RegisterEvent("Test_Debug_MoveToCentreOfRoom_z", 4005, 1)
	end
end

function Test_Debug_MoveToCentreOfRoom(pUnit, Event)
	Lich:MoveTo(512.7, -2120.5, 1572.1, 0)
	Lich:SetMovementFlags(1)
end

function Test_Debug_MoveToCentreOfRoom_z(pUnit, Event)
	Lich:RemoveEvents()
	Lich:Root()
	if pUnit:GetDungeonDifficulty() == 0 then -- 10 man normal
	Lich:FullCastSpell(68981)
	--end
	else
	--if pUnit:GetDungeonDifficulty() == 1 then -- 10 man heroic
	Lich:FullCastSpell(74270)
	end
	Lich:SendChatMessage(14,0,"I will freeze you from within until all that remains is an icy husk!")
	Lich:PlaySoundToSet(17369)
	Lich:RegisterEvent("weaiyhoahg_delay", 6000, 1)
end

function weaiyhoahg_delay(pUnit, Event)
	local x = Lich:GetX()
	local y = Lich:GetY()
	Lich:SpawnCreature(3769812, x+math.random(3,6), y+math.random(3,6), Lich:GetZ(), Lich:GetZ(), 21, 10000)
	if pUnit:GetDungeonDifficulty() == 0 then -- 10 man normal
	Lich:RegisterEvent("Spam_Of_Lightning_That_Looks_Crap_But_Is_Blizzlike", 1500, 0)
	--end
	else
	--if pUnit:GetDungeonDifficulty() == 1 then -- 10 man normal
	Lich:RegisterEvent("zSpam_Of_Lightning_That_Looks_Crap_But_Is_Blizzlike", 1500, 0)
	end
	Lich:RegisterEvent("NeedToWaitBecauseAddsBreakAndShizzleOrSomething", 3005, 1)
	Lich:RegisterEvent("RandomRagingSpiritAddsThatAreNotRandom", 19990, 3) -- So we can get 3 in a minute without removing events
	Lich:RegisterEvent("Test_Despawn_Outer_Shell", 59000, 0)
end

function NeedToWaitBecauseAddsBreakAndShizzleOrSomething(pUnit,Event)
	local x = Lich:GetX()
	local y = Lich:GetY()
	Lich:SpawnCreature(3769812, x-math.random(3,6), y-math.random(3,6), Lich:GetZ(), Lich:GetZ(), 21, 10000)
end

function RandomRagingSpiritAddsThatAreNotRandom(pUnit, Event)
	local plr = Lich:GetRandomPlayer(0)
	if plr ~= nil then
	local x,y,z,o = plr:GetX(),plr:GetY(),plr:GetZ(),plr:GetO()
	Lich:SpawnCreature(3769813, x,y,z,o , 21, 360000)
	end
end

function Spam_Of_Lightning_That_Looks_Crap_But_Is_Blizzlike(pUnit, Event) -- 10 man normal
	local plr = Lich:GetRandomPlayer(0)
	if plr ~= nil then
	Lich:FullCastSpellOnTarget(72133, plr)
	end	
end

function zSpam_Of_Lightning_That_Looks_Crap_But_Is_Blizzlike(pUnit, Event) -- 10 man heroic
	local plr = Lich:GetRandomPlayer(0)
	if plr ~= nil then
	Lich:FullCastSpellOnTarget(73788, plr)
	end	
end
	
function Test_Despawn_Outer_Shell(pUnit, Event)
	Lich:RemoveEvents()
	Lich:SendChatMessage(14,0,"Watch as the world around you collapses!")
	Lich:PlaySoundToSet(17370)
	--Lich:CastSpell(59084) -- temporary solution to no destructable object support on ArcEmu
	Lich:SpawnCreature(2626262, 476.2, -2083.56, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 505.1, -2074.47, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 523.35, -2077.77, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 541, -2086.36, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 552.7, -2111.2, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 554, -2137, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 545.9, -2153.1, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 528, -2164, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 508.25, -2169.5, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 488.2, -2168, 1573.1, 0, 814, 20000)
	Lich:RegisterEvent("DelayForDespawnSinceVisualTakesSomeTimeTehe_Zieghoszho", 1000, 1)
	Lich:RegisterEvent("DelayForDespawnSinceVisualTakesSomeTimeTehe", 2500, 1)
end

function DelayForDespawnSinceVisualTakesSomeTimeTehe_Zieghoszho(pUnit, Event)
	Lich:FullCastSpell(72262) -- Epic shit I got working :D
end

function DelayForDespawnSinceVisualTakesSomeTimeTehe(pUnit, Event)
	Object = Lich:GetGameObjectNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(), 2957197)
	if Object ~= nil then
	Object:SetScale(0.01)
	--Object:Despawn(1,0)
	--Lich:CastSpell(46853) -- Shakes camera
	end
	Lich:SetCombatCapable(0)
	Lich:Unroot()
	-- Phase 2
	Lich:RegisterEvent("Summon_Valkyr_Shadowguard", 19500, 0)
	if pUnit:GetDungeonDifficulty() == 0 then -- 10 man normal
	Lich:RegisterEvent("Infest_Big_AOE_Incoming", 22000, 0)
	Lich:RegisterEvent("Soul_Reaper_On_Main_Tank", 30000, 0)
	--end
	else
	--if pUnit:GetDungeonDifficulty() == 1 then -- 10 man normal
	Lich:RegisterEvent("zInfest_Big_AOE_Incoming", 22000, 0)
	Lich:RegisterEvent("zSoul_Reaper_On_Main_Tank", 30000, 0)
	end	
	Lich:RegisterEvent("Phase_TwoPointFive_Checker", 2500, 0)
	-- I cba to script defile :3
end

function Soul_Reaper_On_Main_Tank(pUnit, Event) -- 10 man normal
	local tank = Lich:GetMainTank()
	if tank ~= nil then
	Lich:FullCastSpellOnTarget(69409, tank)
	end
end

function zSoul_Reaper_On_Main_Tank(pUnit, Event) -- 10 man heroic
	local tank = Lich:GetMainTank()
	if tank ~= nil then
	Lich:FullCastSpellOnTarget(73798, tank)
	end
end

function Summon_Valkyr_Shadowguard(pUnit, Event)
	local x, y, z, o = Lich:GetX()+3, Lich:GetY(), Lich:GetZ(), Lich:GetO()
	Lich:SpawnCreature(25452151, x, y, z, o, 22, 0)
	Lich:SendChatMessage(14,0,"Val'kyr, your master calls!")
	Lich:PlaySoundToSet(17373)
end

function Phase_TwoPointFive_Checker(pUnit, Event)
	if Lich:GetHealthPct() < 41 then
	Lich:RemoveEvents()
	Lich:MoveTo(512.7, -2120.5, 1572.1, 0)
	Lich:SetMovementFlags(1)
	Lich:SetCombatCapable(1)
	Lich:RegisterEvent("hhTest_Debug_MoveToCentreOfRoom", 100, 0)
	Lich:RegisterEvent("hhTest_Debug_MoveToCentreOfRoom_z", 4005, 1)
	end
end

function hhTest_Debug_MoveToCentreOfRoom(pUnit, Event)
	Lich:MoveTo(512.7, -2120.5, 1572.1, 0)
	Lich:SetMovementFlags(1)
end

function hhTest_Debug_MoveToCentreOfRoom_z(pUnit, Event)
	Lich:RemoveEvents()
	Lich:Root()
	if pUnit:GetDungeonDifficulty() == 0 then -- 10 man normal
	Lich:FullCastSpell(68981)
	--end
	else
	--if pUnit:GetDungeonDifficulty() == 1 then -- 10 man heroic
	Lich:FullCastSpell(74270)
	end
	Lich:SendChatMessage(14,0,"I will freeze you from within until all that remains is an icy husk!")
	Lich:PlaySoundToSet(17369)
	Lich:RegisterEvent("jjweaiyhoahg_delay", 6000, 1)
end

function jjweaiyhoahg_delay(pUnit, Event)
	local x = Lich:GetX()
	local y = Lich:GetY()
	Lich:SpawnCreature(3769812, x+math.random(3,6), y+math.random(3,6), Lich:GetZ(), Lich:GetZ(), 21, 10000)
	Lich:RegisterEvent("Spam_Of_Lightning_That_Looks_Crap_But_Is_Blizzlike", 1500, 0)
	Lich:RegisterEvent("NeedToWaitBecauseAddsBreakAndShizzleOrSomething", 3005, 1)
	Lich:RegisterEvent("RandomRagingSpiritAddsThatAreNotRandom", 14000, 3)
	Lich:RegisterEvent("zzzTest_Despawn_Outer_Shell", 59000, 0)
end

function zzzTest_Despawn_Outer_Shell(pUnit, Event)
	Lich:RemoveEvents()
	Lich:SendChatMessage(14,0,"Watch as the world around you collapses!")
	Lich:PlaySoundToSet(17370)
	if Object ~= nil then
	Object:SetScale(1)
	end
	--Lich:CastSpell(59084) -- temporary solution to no destructable object support on ArcEmu
	Lich:SpawnCreature(2626262, 476.2, -2083.56, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 505.1, -2074.47, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 523.35, -2077.77, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 541, -2086.36, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 552.7, -2111.2, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 554, -2137, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 545.9, -2153.1, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 528, -2164, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 508.25, -2169.5, 1573.1, 0, 814, 20000)
	Lich:SpawnCreature(2626262, 488.2, -2168, 1573.1, 0, 814, 20000)
	Lich:RegisterEvent("DelayForDespawnSinceVisualTakesSomeTimeTehe_Zieghoszho", 1000, 1)
	Lich:RegisterEvent("zzzDelayForDespawnSinceVisualTakesSomeTimeTehe", 2500, 1)
end

function zzzDelayForDespawnSinceVisualTakesSomeTimeTehe(pUnit, Event)
	if Object ~= nil then
	Object:Despawn(1,0)
	end
	Lich:SetCombatCapable(0)
	Lich:Unroot()
	-- Phase 3
	Lich:RemoveEvents()
	Lich:RegisterEvent("Soul_Reaper_On_Main_Tank", 30000, 0)
	if pUnit:GetDungeonDifficulty() == 0 then -- 10 man normal
	Lich:RegisterEvent("Harvest_Soul_Random_Raid_Member", 66000, 0)
	else
		if pUnit:GetDungeonDifficulty() == 1 then -- 10 man heroic
		Lich:RegisterEvent("zHarvest_Soul_Random_Raid_Member", 66000, 0)
		else
			if pUnit:GetDungeonDifficulty() == 2 then -- 25 man
			Lich:RegisterEvent("zzHarvest_Soul_Random_Raid_Member", 66000, 0)
			else
			Lich:RegisterEvent("zzHarvest_Soul_Random_Raid_Member", 66000, 0)
			end
		end
	end
	Lich:RegisterEvent("Vile_Spirits_Spawning_Inc", 28000, 0)
	Lich:RegisterEvent("Phase_Four_The_Ending_tehe", 1500, 0)
end

function Harvest_Soul_Random_Raid_Member(pUnit, Event) -- 10 man normal
	local plr = Lich:GetRandomPlayer(0)
	if plr ~= nil then
	Lich:SendChatMessage(14,0,"Frostmourne hungers...")
	Lich:PlaySoundToSet(17366)
	Lich:FullCastSpellOnTarget(68980, plr)
	end
end

function zHarvest_Soul_Random_Raid_Member(pUnit, Event) -- 10 man heroic
	local plr = Lich:GetRandomPlayer(0)
	if plr ~= nil then
	Lich:SendChatMessage(14,0,"Frostmourne hungers...")
	Lich:PlaySoundToSet(17366)
	Lich:FullCastSpellOnTarget(74296, plr)
	end
end

function zzHarvest_Soul_Random_Raid_Member(pUnit, Event) -- 25 man
	local plr = Lich:GetRandomPlayer(0)
	if plr ~= nil then
	Lich:SendChatMessage(14,0,"Frostmourne hungers...")
	Lich:PlaySoundToSet(17366)
	Lich:FullCastSpellOnTarget(74325, plr)
	end
end

function Vile_Spirits_Spawning_Inc(pUnit, Event)
	Lich:RegisterEvent("Spawning_The_Vile_spirits_NoW", 1000, 10)
end

function Spawning_The_Vile_spirits_NoW(pUnit, Event)
	local pla = Lich:GetRandomPlayer(0)
	if pla ~= nil then
	local x, y, z, o = pla:GetX(), pla:GetY(), pla:GetZ(), pla:GetO()
	Lich:SpawnCreature(5078151, x, y, z, o, 22, 60000)
	end
end

function Phase_Four_The_Ending_tehe(pUnit, Event)
	if Lich:GetHealthPct() < 11 then
	Count = 0
	Phase = 0
	Lich:RemoveEvents()
	Lich:SendChatMessage(14,0,"You gnats actually hurt me! Perhaps I've toyed with you long enough, now taste the vengeance of the grave!")
	Lich:PlaySoundToSet(17359)
	Lich:MoveTo(512.7, -2120.5, 1572.1, 0)
	Lich:SetMovementFlags(1)
	Lich:SetCombatCapable(1)
	Lich:RegisterEvent("hhTest_Debug_MoveToCentreOfRoom", 100, 0)
	Lich:RegisterEvent("hggzhTest_Debug_MoveToCentreOfRoom_z", 5005, 1)
	end
end

function hggzhTest_Debug_MoveToCentreOfRoom_z(pUnit, Event)
	Lich:RemoveEvents()
	if pUnit:GetDungeonDifficulty() == 0 then -- 10 man normal
	Lich:FullCastSpell(70063)
	else
	--if pUnit:GetDungeonDifficulty() == 1 then -- 10 man heroic
	Lich:FullCastSpell(72350)
	end
	Players_Wiped = 1
	-- Some visuals missing
	Lich:RegisterEvent("Debug_Send_Next_Message_LichKing", 10000, 1)
end

function Debug_Send_Next_Message_LichKing(pUnit, Event)
	Lich:SendChatMessage(14,0,"No question remains unanswered. No doubts linger. You are Azeroth's greatest champions! You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught, your unbridled fury...")
	Lich:PlaySoundToSet(17353)
	Lich:RegisterEvent("zzDebug_Send_Next_Message_LichKing", 25000, 1)
end

function zzDebug_Send_Next_Message_LichKing(pUnit, Event)
	Lich:SendChatMessage(14,0,"You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.")
	Lich:PlaySoundToSet(17355)
	local plr = Lich:GetRandomPlayer(0)
	if plr ~= nil then
	Lich:ChannelSpell(71769, plr)
	end
	local DeadGuys = Lich:GetInRangePlayers()
	for k, plrs in pairs(DeadGuys) do
	plrs:ChannelSpell(47855, Lich)
	end
	Lich:RegisterEvent("zzzzDebug_Send_Next_Message_LichKing", 24000, 1)
end

function zzzzDebug_Send_Next_Message_LichKing(pUnit, Event)
	Lich:SendChatMessage(14,0,"Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth's fall will come at their hands -- and you will be the first to die.")
	Lich:PlaySoundToSet(17356)
	Lich:RegisterEvent("zzzzDebug_Send_Next_Message_LichKingzz", 26000, 1)
end

function zzzzDebug_Send_Next_Message_LichKingzz(pUnit, Event)
	Lich:PlaySoundToSet(17357)
	Lich:SendChatMessage(14,0,"I delight in the irony.")
	Lich:RegisterEvent("zzzzDebug_Send_Next_Message_LichKingzzzz", 6000, 1)
	--Lich:StopChannel()
end

function zzzzDebug_Send_Next_Message_LichKingzzzz(pUnit, Event)
	if Tirion == nil then
	Lich:Despawn(1,0)
	else
	Tirion:SendChatMessage(14,0,"LIGHT, GRANT ME ONE FINAL BLESSING. GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!")
	Tirion:PlaySoundToSet(17392)
	Lich:RegisterEvent("Breakoutofice", 9000, 1)
	end
end

function Breakoutofice(pUnit, Event)
	Tirion:RemoveAura(71614) --(Remove IceBlock, to cast the Spell under this Line :>)
	Tirion:CastSpell(71797)
	Tirion:CastSpell(71614) --(Get the IceBlock Again :>, You cannot see that he was out :>) -- Stays in ice block? lol
	Lich:RegisterEvent("zzzzDebug_Send_Next_Message_LichKingzzzzgg", 5000, 1)
end

function zzzzDebug_Send_Next_Message_LichKingzzzzgg(pUnit, Event)
	Tirion:RemoveAura(71614) -- Ice Block
	Tirion:CastSpell(71773)
	Lich:RegisterEvent("zzzzDebug_Send_Next_Message_LichKingzzzzgzg", 1500, 1)
	-- jumps and destroys frostmourne
end

function zzzzDebug_Send_Next_Message_LichKingzzzzgzg(pUnit, Event)
	Tirion:SetMovementFlags(2)
	Tirion:SetFlying()
	Tirion:Emote(375, 60000)
	Tirion:MoveTo(511, -2121, 1575, 14)
	Tirion:Emote(375, 60000)
	Lich:StopChannel()
	Lich:RegisterEvent("zagazzzDebug_Send_Next_Message_LichKingzzzzgzg", 3000, 1)
end

function zagazzzDebug_Send_Next_Message_LichKingzzzzgzg(pUnit, Event)
	Tirion:SetMovementFlags(1)
	Tirion:MoveTo(536.5, -2121, 1572.1, 3.15)
	Lich:PlaySoundToSet(17459)
	Lich:SpawnCreature(2626269, Lich:GetX(), Lich:GetY(), Lich:GetZ(), 0, 35, 0) -- Invisible trigger
	Lich:RegisterEvent("zagazzzDebug_Send_Next_Message_LichKingzgeazzzzgzg", 1900, 1)
	Tirion:RegisterEvent("lichisdead", 1900, 1)
end

function lichisdead(pUnit, Event)
	Tirion:MoveTo(514.135254, -2122.514160, 1572)
end

function zagazzzDebug_Send_Next_Message_LichKingzgeazzzzgzg(pUnit, Event)
	Lich:CastSpell(37592) -- Knockdown
	--Lich:CastSpell(72726) -- Boom visual
	local DeadGuys = Lich:GetInRangePlayers()
	for k, plrs in pairs(DeadGuys) do
	plrs:StopChannel()
	end
	if Garfield ~= nil then
	Garfield:CastSpell(72405) -- THE CORRECT VISUAL ;D
	end -- I cba to add a debugger, if it screws up at this point SCREW YOU BLIZZARD AND EMULATION
	--Lich:FullCastSpell(72406) -- The drop frostmourne visual thing (it fucks up his animations so I cba with this :D)
	Lich:CastSpell(73017) -- The soul free thing
	Lich:FullCastSpell(72398) -- Frostmourne on floor
	Lich:EquipWeapons(0,0,0)
	Lich:SendChatMessage(14,0,"Impossible...")
	Lich:PlaySoundToSet(17358)
	Lich:Emote(473, 120000)
	--Lich:CastSpell(72523)
	Lich:RegisterEvent("zagazzzDebug_Send_Next_Message_LichKingzgeazzzzedhezgzg", 1500, 1)
end

function zagazzzDebug_Send_Next_Message_LichKingzgeazzzzedhezgzg(pUnit, Event)
	Tirion:SendChatMessage(14,0,"No more, Arthas! No more lives will be consumed by your hatred!")
	Tirion:PlaySoundToSet(17393)
	Tirion:SetMovementFlags(1)
	Lich:Emote(473, 120000)
	Lich:SpawnCreature(31021151, 518.8, -2115.8, 1572.1, 3.780169, 35, 0)
	Tirion:MoveTo(526, -2120.5, 1572.1, 3)
	Lich:RegisterEvent("zagazzzDebug_Send_Next_Message_LichKingzgeazzzzedhezgzzzzsay", 5500, 1)
end

function zagazzzDebug_Send_Next_Message_LichKingzgeazzzzedhezgzzzzsay(pUnit, Event)
	if Terenas == nil then -- Dunno why this would happen
	Lich:Despawn(1,0)
	Lich = nil
	Tirion:Despawn(1,0)
	Tirion = nil
	else
	Lich:Emote(473, 120000)
	Terenas:EquipWeapons(23456, 18825, 0)
	Terenas:SendChatMessage(14,0,"Free at last! It is over, my son. This is the moment of reckoning.")
	Terenas:PlaySoundToSet(17397)
	Terenas:ChannelSpell(51361, Terenas)
	Lich:RegisterEvent("epiashgyophopapea_Lich_King_Is_Not_A_Happy_Bunny", 10000, 1)
	end
end

function epiashgyophopapea_Lich_King_Is_Not_A_Happy_Bunny(pUnit, Event)
	Terenas:SendChatMessage(14,0,"Rise up, champions of the Light!")
	Terenas:PlaySoundToSet(17398)
	Terenas:StopChannel()
	Terenas:CastSpell(37755)
	Lich:Emote(473, 120000)
	local PlayersAllAround = Terenas:GetInRangePlayers()
	for a, players in pairs(PlayersAllAround) do
	players:ResurrectPlayer(players)
	players:CastSpell(24171)
	end
	--Terenas:FullCastSpell(72429) -- Failure
	Lich:RegisterEvent("zLich_King_Is_Not_A_Happy_Bunny", 5000, 1)
end

function zLich_King_Is_Not_A_Happy_Bunny(pUnit, Event)
	Terenas:Despawn(500,0)
	Lich:Emote(473, 120000)
	Lich:SendChatMessage(14,0,"Now I stand, the lion before the lambs... and they do not fear.")
	Lich:PlaySoundToSet(17361)
	Lich:RegisterEvent("zLich_King_Is_Not_A_Happy_Bunnyz", 8000, 1)
end

function zLich_King_Is_Not_A_Happy_Bunnyz(pUnit, Event)
	Lich:SendChatMessage(14,0,"They cannot fear.")
	Lich:PlaySoundToSet(17362)
	Lich:Emote(473, 120000)
	Lich:SetHealthPct(10)
	-- The end, poor arthas, Q_Q, lets all go do a rain dance, ~Stoneharry
end

---- Terenas -----------------------------------------------------

function Terenas_Spawned_root_Hes_the_realm_of_My_RETAIL_Char(pUnit, Event)
	if Tirion == nil or Lich == nil then
	pUnit:Despawn(1,0)
	else
	Terenas = pUnit
	end
end

RegisterUnitEvent(31021151, 18, "Terenas_Spawned_root_Hes_the_realm_of_My_RETAIL_Char")

-------------------------------------------------------------------

function LichKingHasDiedSoWePlayMovie(pUnit, Event)
	if Garfield ~= nil then
	Garfield:Despawn(1,0)
	end
	local PlayersAllAround = pUnit:GetInRangePlayers()
	for a, players in pairs(PlayersAllAround) do
		if players:GetDungeonDifficulty() == 0 then -- 10 man
			if players:HasAchievement(4530) == false then
			players:AddAchievement(4530)
			end
		else
			if players:GetDungeonDifficulty() == 1 then -- 10 man heroic
				if players:HasAchievement(4583) == false then
				players:AddAchievement(4583)
				end
			else
				if players:GetDungeonDifficulty() == 2 then -- 25 man
					if players:HasAchievement(4579) == false then
					players:AddAchievement(4579)
					end
				else
					if players:GetDungeonDifficulty() == 3 then -- 25 man heroic
						if players:HasAchievement(4584) == false then
						players:AddAchievement(4584)
						end
					end
				end
			end
		end
	end
	Lich = nil
	pUnit:RemoveEvents()
	pUnit:PlaySoundToSet(17374) -- Freak makes dying sound
	pUnit:SpawnCreature(3072110, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 35, 10000)
end

RegisterUnitEvent(3072111, 4, "LichKingHasDiedSoWePlayMovie")

function TriggerHasSpawnedSoPlayMovie(pUnit, Event)
	pUnit:RegisterEvent("PlayMovieOnceDeathAnimationHasPlayed", 9000, 1)
end

function PlayMovieOnceDeathAnimationHasPlayed(pUnit, Event)
	-- Reset Fight
	Garfield = nil
	Tirion = nil
	Lich = nil
	Terenas = nil
	package = nil
	Phase = 0
	Count = 0
	-- Movie
	Players_Wiped = 0
	local PlayersAllAround = pUnit:GetInRangePlayers()
	for a, players in pairs(PlayersAllAround) do
	--SMSG_TRIGGER_MOVIE = 0x464
	local packet = LuaPacket:CreatePacket(0x464, 4) -- Move type 4
	packet:WriteULong(16) -- Id 16
	players:SendPacketToPlayer(packet) -- Send to players
	end
	-- Bolvar
	local Bolvar = pUnit:GetGameObjectNearestCoords(428.758, -2124.4, 1594.69, 2508221) -- Bolvar in chains
	if Bolvar ~= nil then
	Bolvar:Despawn(1,0)
	pUnit:SpawnGameObject(2508220, 428.758, -2124.4, 1594.69, 0, 360000) -- Chains
	pUnit:SpawnGameObject(2508219, 430.103, -2124, 1595.93, 3.3, 360000) -- Bolvar
	end
end

RegisterUnitEvent(3072110, 18, "TriggerHasSpawnedSoPlayMovie")
	
------- Adds ------------------------------------------------------

function Dredge_Ghouls_OnSpawn(pUnit, Event)
	pUnit:RegisterEvent("TestRootFunctionNextSecond", 1, 1)
end

function TestRootFunctionNextSecond(pUnit, Event)
	if Lich == nil then -- This way when the ghoul spawns, if the fight is not happening for some reason it will just disapear again instantly as if nothing happened ;)
	pUnit:RemoveFromWorld()
	else -- Well if he is here
	pUnit:Emote(449, 4000) -- spawn animation
	pUnit:Root() -- Root him while he spawns
	pUnit:RegisterEvent("Delay_A_Second_And_See_WhatHappens_Tehe", math.random(1,1000), 1)
	pUnit:RegisterEvent("SetFactionToHostileForTheEmote", 4500, 1)
	end
end

function Delay_A_Second_And_See_WhatHappens_Tehe(pUnit, Event)
	pUnit:CastSpell(55719)
end

function SetFactionToHostileForTheEmote(pUnit, Event)
	pUnit:Unroot() -- let him run free
	pUnit:SetFaction(21) -- hostile
end

RegisterUnitEvent(3769511, 18, "Dredge_Ghouls_OnSpawn")

---------------------------------------------------------------------

function Shambling_Horrors_OnSpawn(pUnit, Event)
	pUnit:RegisterEvent("zzTestRootFunctionNextSecond", 1, 1)
end

function zzTestRootFunctionNextSecond(pUnit, Event)
	if Lich == nil then -- This way when the ghoul spawns, if the fight is not happening for some reason it will just disapear again instantly as if nothing happened ;)
	pUnit:RemoveFromWorld()
	else -- Well if he is here
	pUnit:Emote(449, 4000) -- spawn animation
	pUnit:Root() -- Root him while he spawns
	pUnit:CastSpell(55719)
	pUnit:RegisterEvent("zzSetFactionToHostileForTheEmote", 4500, 1)
	end
end

function zzSetFactionToHostileForTheEmote(pUnit, Event)
	pUnit:Unroot() -- let him run free
	pUnit:SetFaction(21) -- hostile
end

RegisterUnitEvent(3769811, 18, "Shambling_Horrors_OnSpawn")

function Shambling_Horrors_OnCombat(pUnit, Event)
	if Lich == nil then -- This way when the ghoul spawns, if the fight is not happening for some reason it will just disapear again instantly as if nothing happened ;)
	pUnit:RemoveFromWorld()
	else -- Well if he is here
	pUnit:RegisterEvent("Enrage_Spam_Incoming_Varied_Time", math.random(20000,25000), 0) -- Varied time depending on add
	pUnit:RegisterEvent("Shockwave_thingy_time_notsure_on_timer", 15000, 0)
	end
end

function Enrage_Spam_Incoming_Varied_Time(pUnit, Event)
	pUnit:FullCastSpell(72143)
end

function Shockwave_thingy_time_notsure_on_timer(pUnit, Event)
	pUnit:FullCastSpell(72149)
end

function Shambling_Horrors_OnLeave(pUnit, Event)
	pUnit:RemoveEvents()
end

function Shambling_Horrors_OnDead(pUnit, Event)
	pUnit:RemoveEvents()
end

function Low_Enrage(pUnit, Event)
	if pUnit:GetDungeonDifficulty() ~= 0 then -- not 10 man
		if pUnit:GetHealthPct() < 20 then
		pUnit:CastSpell(28747) -- ENRAGEEEEEE (a lust for blood? :p)
		end
	end
end

RegisterUnitEvent(3769811, 1, "Shambling_Horrors_OnCombat")
RegisterUnitEvent(3769811, 2, "Shambling_Horrors_OnLeave")
RegisterUnitEvent(3769810, 3, "Low_Enrage")
RegisterUnitEvent(3769811, 4, "Shambling_Horrors_OnDead")

----- Ice Sphere --------------------------------------------------

-- 69090 on spawn -- only 2 on phase 1.5, head towards player and explode if hit

function IceShard_OnSpawn(pUnit, Event)
	pUnit:RegisterEvent("rage_rage_rage_rage_Rage_rage", 1, 1)
end

function rage_rage_rage_rage_Rage_rage(pUnit, Event)
	if Lich == nil then
	pUnit:RemoveFromWorld() -- may cause crash if he tries to despawn but variable broke
	else
		pUnit:FullCastSpell(69090) -- Visual
		local pla = pUnit:GetRandomPlayer(0)
		if pla ~= nil then
		pUnit:MoveTo(pla:GetX(), pla:GetY(), pla:GetZ(), pla:GetO())
		pUnit:SetMovementFlags(1)
		pUnit:RegisterEvent("rage_rage_rage_rage_Rage_rage_r", 1000, 8)
		else
		pUnit:RemoveFromWorld()
		end
	end
end

function rage_rage_rage_rage_Rage_rage_r(pUnit, Event)
	local plm = pUnit:GetClosestPlayer()
	if plm ~= nil then
		pUnit:FullCastSpell(69090) -- Visual
		if pUnit:GetDistanceYards(plm) < 4 then
		--pUnit:FullCastSpellOnTarget(70827, plm) -- May be buggy if player dies, maybe not knockbacked and players try to exploit by ressing?
		pUnit:FullCastSpellOnTarget(11027, plm) -- Knockback
		pUnit:CastSpell(56135)
		pUnit:RemoveEvents()
		end
	end
end

RegisterUnitEvent(3769812, 18, "IceShard_OnSpawn")

---- Raging Spirit ------------------------------------------------

function RagingSpirit_OnCombat(pUnit, Event)
	if Lich == nil then
	pUnit:RemoveFromWorld()
	else
	pUnit:RegisterEvent("Soul_Shriek_Random_Time_Depending_On_Mob", math.random(7500, 15000), 0)
	pUnit:RegisterEvent("Soul_Shriek_Random_Visual", 1000, 1)
	end
end

function Soul_Shriek_Random_Visual(pUnit, Event)
	pUnit:FullCastSpell(69198) -- Visual
end

function Soul_Shriek_Random_Time_Depending_On_Mob(pUnit, Event)
	if pUnit:GetDungeonDifficulty() == 0 then -- 10 man
	pUnit:FullCastSpell(69242) -- Shriek normal
	else
	pUnit:FullCastSpell(73801) -- Shriek heroic
	end
end

function RagingSpirit_OnLeave(pUnit, Event)
	pUnit:RemoveEvents()
end

function RagingSpirit_OnDead(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(3769813, 1, "RagingSpirit_OnCombat")
RegisterUnitEvent(3769813, 2, "RagingSpirit_OnLeave")
RegisterUnitEvent(3769813, 4, "RagingSpirit_OnDead")

---- Flying Dudes ------------------------------------------------------

function zhgzFlying_Dude_OnCombat(pUnit, Event)
	if Lich == nil then
	pUnit:RemoveFromWorld()
	else
	pUnit:RegisterEvent("zhgzFlying_Dude_Find_Player", 1, 1)
	end
end

function zhgzFlying_Dude_Find_Player(pUnit, Event)
	package = pUnit:GetClosestPlayer()
	if package ~= nil then
	pUnit:SetCombatCapable(1) -- Stop npc running around
	package:SetPlayerLock(1) -- Stop player doing stuff :3
	pUnit:SetMovementFlags(2) -- Flying Mode On
	pUnit:ChannelSpell(55520, package) -- visual
	pUnit:MoveTo(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ()+6, pUnit:GetO(), 12288)
	package:MovePlayerTo(package:GetX(), package:GetY(), package:GetZ()+6, package:GetO(), 12288)
	pUnit:RegisterEvent("now_we_have_loaded_preset_We_can_move_on", 2000, 1)
	else
	pUnit:RemoveFromWorld()
	end
end

function now_we_have_loaded_preset_We_can_move_on(pUnit, Event)
	if package ~= nil then
	package:CastSpell(52241) -- Choke visual
	package:CastSpell(53658) -- Bubble to stop stupid animations
	pUnit:ChannelSpell(29172, package) -- visual
	pUnit:RegisterEvent("now_we_have_loaded_preset_We_can_move_on_two", 1500, 0)
	else
	pUnit:RemoveEvents()
	pUnit:RemoveFromWorld()
	end
end

function now_we_have_loaded_preset_We_can_move_on_two(pUnit, Event)
	if package ~= nil then
		if pUnit:GetX() == 572 and pUnit:GetY() == -2121.5 then -- Don't use Z, blizzard don't, POI's don't, why should we? It will just screw up and we don't need it :)
		pUnit:RemoveEvents()
		pUnit:StopChannel()
		package:RemoveAura(52241) -- choke
		package:RemoveAura(53658) -- buble
		package:SetPlayerLock(0)
		package = nil
		--pUnit:RemoveFromWorld() -- Causes crash :(		
		else
			if pUnit:GetDungeonDifficulty() ~= 0 and pUnit:GetDungeonDifficulty() ~= 2 then --not 10 man normal or 25man normal
				if pUnit:GetHealthPct() < 50 then
				pUnit:RemoveEvents()
				pUnit:StopChannel()
				package:RemoveAura(52241) -- choke
				package:RemoveAura(53658) -- buble
				package:SetPlayerLock(0)
				package = nil
				pUnit:MoveTo(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ()+4, pUnit:GetO())
				pUnit:RegisterEvent("lol_siphon_spam_or_something_vrykul", 10000, 0)
				else		
				pUnit:SetMovementFlags(2)
				package:ModifyFlySpeed(2.5)
				pUnit:MoveTo(572, -2121.5, 1577.2, 0, 12288, 2.5)
				package:MovePlayerTo(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ() ,pUnit:GetO(), 12288)
				end
			end
		end
	else
	pUnit:RemoveEvents()
	pUnit:RemoveFromWorld()
	end
end

function lol_siphon_spam_or_something_vrykul(pUnit, Event)
	local tank = pUnit:GetMainTank()
	if tank ~= nil then
	pUnit:FullCastSpellOnTarget(73784, tank) -- Correct spell - 2 second cast time, lasts for ???
	end
end

function zhgzFlying_Dude_OnDead(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:StopChannel()
	package:RemoveAura(52241) -- choke
	package:RemoveAura(53658) -- buble
	package:SetPlayerLock(0)
	package = nil
	--pUnit:RemoveFromWorld() -- Causes crash :(
end

RegisterUnitEvent(25452151, 1, "zhgzFlying_Dude_OnCombat")
RegisterUnitEvent(25452151, 4, "zhgzFlying_Dude_OnDead")

---- Vile Spirits ------------------------------------------------------

function VileSpiirt_OnCombat(pUnit, Event)
	if Lich == nil then
	pUnit:RemoveFromWorld()
	else
	pUnit:RegisterEvent("deoaopighophgeoaugozh_delay", 500, 1)
	end
end

function deoaopighophgeoaugozh_delay(pUnit, Event)
	pUnit:Root()
	pUnit:SetCombatCapable(1)
	pUnit:RegisterEvent("Tick_Tick_Tick_dot_dot_dot_BOOM", 29000, 1)
end

function Tick_Tick_Tick_dot_dot_dot_BOOM(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:CastSpell(73807) -- Correct spell now
	pUnit:RegisterEvent("Kill_Self_Suicide_Or_Whathaveyou_vile", 1000, 1)
end

function Kill_Self_Suicide_Or_Whathaveyou_vile(pUnit, Event)
	if pUnit:IsAlive() == true then
	pUnit:Despawn(1,0)
	end
end

function VileSpiirt_OnLeave(pUnit, Event)
	pUnit:RemoveEvents()
end

function VileSpiirt_OnDead(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(5078151, 1, "VileSpiirt_OnCombat")
RegisterUnitEvent(5078151, 2, "VileSpiirt_OnLeave")
RegisterUnitEvent(5078151, 4, "VileSpiirt_OnDead")

------------------------------------------------------------------------

function Garfield_On_Spawn_Trigger_Define(pUnit, Event)
	Garfield = pUnit
end

RegisterUnitEvent(2626269, 18, "Garfield_On_Spawn_Trigger_Define")

------------------------------------------------------------------------

if CheatMode == true then
	function zczz_OnChat(event, plr, message, type, language)
		local message = string.lower(message)
		if (message == "#startlk") then
			if plr:IsGm() == true then
				if Lich ~= nil and Tirion ~= nil then
				Tirion:PlaySoundToSet(17458)
				Tirion:RemoveEvents() -- Stop repeating
				Lich:RemoveEvents()
				Lich:MoveTo(461.47, -2123.73, 1572.1, 0)
				Tirion:Emote(375, 60000)
				Tirion:PlaySoundToSet(17349) -- pUnit since players are closer to him
				Lich:SendChatMessage(14, 0, "So...the Light's vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?")
				Tirion:RegisterEvent("TirionFordring_OnSpawn_Goz", 13500, 1)
				end
			end
		end
		if (message == "#endlk") then
			if Lich ~= nil and Tirion ~= nil then
				if plr:IsGm() == true then
				Count = 0
				Phase = 0
				Lich:RemoveEvents()
				Tirion:RemoveEvents()
				Lich:SendChatMessage(14,0,"You gnats actually hurt me! Perhaps I've toyed with you long enough, now taste the vengeance of the grave!")
				Lich:PlaySoundToSet(17359)
				Lich:MoveTo(512.7, -2120.5, 1572.1, 0)
				Lich:SetMovementFlags(1)
				Lich:SetCombatCapable(1)
				Lich:RegisterEvent("hhTest_Debug_MoveToCentreOfRoom", 100, 0)
				Lich:RegisterEvent("hggzhTest_Debug_MoveToCentreOfRoom_z", 5005, 1)
				end
			end
		end
	end
	RegisterServerHook(16, "zczz_OnChat")
end

------------------------------------------------------------------------