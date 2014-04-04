-- needs to be a world massage if someone loots a legendary item
Legendary = {}
UnitID = 999999


function Legendary.Loot(Unit, event, player)
	SendWorldMessage(player:GetName().." entering combat witch", 1)
end
 
-- Register
--RegisterUnitEvent(UnitID, EventId, function)
RegisterUnitEvent(UnitID, 20, "Legendary.Loot");
