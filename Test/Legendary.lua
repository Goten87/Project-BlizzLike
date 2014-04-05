 --[[Script by DarkAngel39]]--

function LegendaryLoot(event, pPlayer, pTarget, Money, ItemId)
	print("looted")
	local itemquality = WorldDBQuery("SELECT quality FROM items WHERE entry="..ItemId..";"):GetColumn(0):GetString()
	if(itemquality == "5")then
		local itemname = WorldDBQuery("SELECT name1 FROM items WHERE entry="..ItemId..";"):GetColumn(0):GetString()
		SendWorldMessage(pPlayer:GetName().." Looted "..itemname..".",2)
	end
end

RegisterServerHook(17,LegendaryLoot)
