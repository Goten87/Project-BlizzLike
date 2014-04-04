
 
-- Gossip
function Get_legendry(Unit, player)
  SendWorldMessage("You are not prepared!", 1)
end
 
-- Register
RegisterUnitEvent(32837, 20, "Get_legendry");