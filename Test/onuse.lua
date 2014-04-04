function GameObject_OnUse(go,_,player)
 print(player:GetName().." has activated game_object :"..tostring(go))
end

RegisterGameObjectEvent(202242, 4, GameObject_OnUse)