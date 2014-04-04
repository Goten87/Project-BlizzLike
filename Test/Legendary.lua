-- needs to be a world massage if someone loots a legendary item
Legendary = {}
Legendary_ID = 999999


function Legendary.Loot(Unit, event, player)
	SendWorldMessage(player:GetName().." Looted <item>", 1)
end
