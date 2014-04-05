local INSTANCE_ICC = {}
local object_link = {
{36612,201910},
{36612,201911},
{36612,201563},
{36612,202245},
{36855,202243},
{36855,202244},
{37813,201825},
{37813,202235},
{36626,201613}, -- festergut
{36627,201614}, -- rotface
{-1,201612}, -- prof colision
{-1,201372}, -- prof door
{36678,202182},
{36678,201376},
{37970,201378},
{37970,201377},
{37955,201755},
{37955,202183},
{37955,201375},
{36789,201382},
{36789,201381},
{36789,201380},
{36789,201383},
{36789,201374},
{36789,201373},
{36853,201369},
{36853,202246},
{36853,201379},
{36853,202181},
{-2,202223}
}
local scourge_ports = {{202246},{202245},{202244},{202243},{202242},{202235},{202223}}
local tele_coords = {
{1,70781,-17.1928,2211.44,30.1158,0},
{2,70856,-503.62,2211.47,62.8235,0},
{3,70857,-615.145,2211.47,199.972,0},
{4,70858,-549.131,2211.29,539.291,0},
{5,70859,4198.42,2769.22,351.065,0},
{6,70861,4356.58,2565.75,220.4,0},
{7,70860,528.39,-2124.84,1040.86,0}
}

local SPELL_CHILL = 69127
local SPELL_FROZEN_THRONE_T = 70860
local MAP_ICC = 631

function DoorOnLoad(iid, pPlayer)
local id = pPlayer:GetInstanceID()
if(INSTANCE_ICC[id] == nil)then
	local string_data = {}
	INSTANCE_ICC[id] = {}
	INSTANCE_ICC[id].builddata = true
	local result = CharDBQuery("SELECT killed_npc_guids FROM instances WHERE id="..id..";")
	if(result ~= nil)then
		local colcount = result:GetColumnCount();
		repeat
			for col = 0, colcount-1, 1 do
				string_data[col] = result:GetColumn( col ):GetString()
				local b1 = string.find(string_data[col], "36612")
				local b2 = string.find(string_data[col], "36855")
				local b3 = string.find(string_data[col], "37813")
				local b4 = string.find(string_data[col], "36626")
				local b5 = string.find(string_data[col], "36627")
				local b6 = string.find(string_data[col], "36678")
				local b7 = string.find(string_data[col], "37970")
				local b8 = string.find(string_data[col], "37955")
				local b9 = string.find(string_data[col], "36789")
				local b10 = string.find(string_data[col], "36853")
				local b11 = string.find(string_data[col], "36597")
				if(b1 ~= nil)then
					INSTANCE_ICC[id].marrowgar = true
				end
				if(b2 ~= nil)then
					INSTANCE_ICC[id].deathwhisper = true
				end
				if(b3 ~= nil)then
					INSTANCE_ICC[id].saurfang = true
				end
				if(b4 ~= nil)then
					INSTANCE_ICC[id].festergut = true
				end
				if(b5 ~= nil)then
					INSTANCE_ICC[id].rotface = true
				end
				if(b6 ~= nil)then
					INSTANCE_ICC[id].prof = true
				end
				if(b7 ~= nil)then
					INSTANCE_ICC[id].prince = true
				end
				if(b8 ~= nil)then
					INSTANCE_ICC[id].bloodqueen = true
				end
				if(b9 ~= nil)then
					INSTANCE_ICC[id].dreamwalker = true
				end
				if(b10 ~= nil)then
					INSTANCE_ICC[id].sindragosa = true
				end
				if(b11 ~= nil)then
					INSTANCE_ICC[id].lichking = true
				end
			end
		until result:NextRow() ~= true;
	end
end
if(INSTANCE_ICC[id].lichking ~= true and pPlayer:HasAura(SPELL_CHILL) == false)then
	SetDBCSpellVar(SPELL_CHILL, "c_is_flags", 0x01000)
	pPlayer:CastSpell(SPELL_CHILL)
end
end

function OnGOpush(pGO)
local plr = pGO:GetClosestPlayer()
if(plr)then
	local id = plr:GetInstanceID()
	for b = 1,#object_link do
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 36612 and INSTANCE_ICC[id].marrowgar)then
			pGO:Activate()
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 36855 and INSTANCE_ICC[id].deathwhisper)then
			pGO:Activate()
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 37813 and INSTANCE_ICC[id].saurfang)then
			pGO:Activate()
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 36626 and INSTANCE_ICC[id].festergut and INSTANCE_ICC[id].rotface == nil)then
			pGO:Activate()
		elseif(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 36626 and INSTANCE_ICC[id].festergut and INSTANCE_ICC[id].rotface)then
			pGO:Despawn(1,0)
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 36627 and INSTANCE_ICC[id].rotface and INSTANCE_ICC[id].festergut == nil)then
			pGO:Activate()
		elseif(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 36627 and INSTANCE_ICC[id].rotface and INSTANCE_ICC[id].festergut)then
			pGO:Despawn(1,0)
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == -1 and INSTANCE_ICC[id].rotface and INSTANCE_ICC[id].festergut)then
			pGO:Activate()
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 36678 and INSTANCE_ICC[id].prof)then
			pGO:Activate()
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 37970 and INSTANCE_ICC[id].prince)then
			pGO:Activate()
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 37955 and INSTANCE_ICC[id].bloodqueen)then
			pGO:Activate()
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 36789 and INSTANCE_ICC[id].dreamwalker)then
			pGO:Activate()
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == 36853 and INSTANCE_ICC[id].sindragosa)then
			pGO:Activate()
		end
		if(pGO:GetEntry() == object_link[b][2] and object_link[b][1] == -2 and INSTANCE_ICC[id].sindragosa and INSTANCE_ICC[id].prof and INSTANCE_ICC[id].bloodqueen)then
			pGO:Activate()
		end
	end
end
end

function TeleportOnGossip(pGO, event, pPlayer)
local id = pPlayer:GetInstanceID()
pGO:GossipCreateMenu(15221, pPlayer, 0)
pGO:GossipMenuAddItem(0,"Teleport to the Light's Hammer.", 1, 0)
if(INSTANCE_ICC[id].marrowgar)then
	pGO:GossipMenuAddItem(0,"Teleport to the Oratory of the Damned.", 2, 0)
end
if(INSTANCE_ICC[id].deathwhisper)then
	pGO:GossipMenuAddItem(0,"Teleport to the Rampart of Skulls.", 3, 0)
	pGO:GossipMenuAddItem(0,"Teleport to the Deathbringer's Rise.", 4, 0) -- gunship battle needs core support.
end
if(INSTANCE_ICC[id].saurfang)then
	pGO:GossipMenuAddItem(0,"Teleport to the The Upper Spire.", 5, 0)
end
if(INSTANCE_ICC[id].sindragosa)then
	pGO:GossipMenuAddItem(0,"Teleport to the The Frost Queen's Lair.", 6, 0)
end
pGO:GossipSendMenu(pPlayer)
end

function TeleporterOnSelect(pGO, event, pPlayer, id, intid, code)
for i = 1, #tele_coords do
	if(intid == tele_coords[i][1])then
		pPlayer:CastSpell(tele_coords[i][2])
		pPlayer:Teleport(MAP_ICC,tele_coords[i][3],tele_coords[i][4],tele_coords[i][5],tele_coords[i][6])
	end
end
pPlayer:GossipComplete()
end

function OnZoneOut(event, pPlayer, ZoneId, OldZoneId)
if(pPlayer:GetMapId() ~= MAP_ICC and pPlayer:HasAura(SPELL_CHILL))then
	pPlayer:RemoveAura(SPELL_CHILL)
end
end

function KillBoss(id, pVictim, pKiller)
local id = pKiller:GetInstanceID()
if(pVictim:IsCreature() and pVictim:GetEntry() == 36612)then
	INSTANCE_ICC[id].marrowgar = true
elseif(pVictim:IsCreature() and pVictim:GetEntry() == 36855)then
	INSTANCE_ICC[id].deathwhisper = true
elseif(pVictim:IsCreature() and pVictim:GetEntry() == 37813)then
	INSTANCE_ICC[id].saurfang = true
elseif(pVictim:IsCreature() and pVictim:GetEntry() == 36626)then
	INSTANCE_ICC[id].festergut = true
elseif(pVictim:IsCreature() and pVictim:GetEntry() == 36627)then
	INSTANCE_ICC[id].rotface = true
elseif(pVictim:IsCreature() and pVictim:GetEntry() == 36678)then
	INSTANCE_ICC[id].prof = true
elseif(pVictim:IsCreature() and pVictim:GetEntry() == 37970)then
	INSTANCE_ICC[id].prince = true
elseif(pVictim:IsCreature() and pVictim:GetEntry() == 37955)then
	INSTANCE_ICC[id].bloodqueen = true
elseif(pVictim:IsCreature() and pVictim:GetEntry() == 36789)then
	INSTANCE_ICC[id].dreamwalker = true
elseif(pVictim:IsCreature() and pVictim:GetEntry() == 36853)then
	INSTANCE_ICC[id].sindragosa = true
elseif(pVictim:IsCreature() and pVictim:GetEntry() == 36597)then
	INSTANCE_ICC[id].lichking = true
end
end

RegisterServerHook(15,OnZoneOut)
RegisterInstanceEvent(MAP_ICC,2,DoorOnLoad)
RegisterInstanceEvent(MAP_ICC,5,KillBoss)
for i = 1, #object_link do
RegisterGameObjectEvent(object_link[i][2],2,OnGOpush)
end
for i = 1, #scourge_ports do
RegisterGameObjectEvent(scourge_ports[i][1],4,TeleportOnGossip)
end
for i = 1, #scourge_ports do
RegisterGOGossipEvent(scourge_ports[i][1],2,TeleporterOnSelect)
end
