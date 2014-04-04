PLAYERENTER = {}
local class_colour = {
{"Warrior","|cFF993300"},
{"Paladin","|cFFFF00FF"},
{"Hunter","|cFF00FF00"},
{"Rogue","|cFFFFFF00"},
{"Priest","|cFFFFFFFF"},
{"Death Knight","|cFF800000"},
{"Shaman","|cFF000080"},
{"Mage","|cFFCCCCFF"},
{"Warlock","|cFF800080"},
{"Druid","|cFFFF6600"}
}
--[~~~~~~~~]--
--[ Config ]--
--[~~~~~~~~]--

PLAYERENTER.ServerName = "Emerald Dream" --Change "ServerName" with your Server Name.

--[~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~]--
--[ You can edit all SendWorldMessage : ''Welcome our [ServerNameStaff][HeadAdmin] and the colors. ]--
--[~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~]--

function PLAYERENTER.PlayerOnEnterWorldFirstTimeWelcome(event, player)
	local class = player:GetPlayerClass()
	local colour = "|cFFC79C6E" -- Default colour
        for i = 1, #class_colour do
                if(class_colour[i][1] == class)then
                        colour = class_colour[i][2]
                end
        end
		
        if (player:GetGmRank() == "0") then
                SendWorldMessage("|cFF35bab8<"..PLAYERENTER.ServerName.." - Announce>|r - |CFFbbbbbbAll Welcome To Our New [Player] :|r "..colour..""..player:GetName().."|r|CFFbbbbbb!|r", 2)
        end

end

function PLAYERENTER.PlayerOnEnterWorldWelcome(event, player)
	local class = player:GetPlayerClass()
	local colour = "|cFFC79C6E" -- Default colour
        for i = 1, #class_colour do
			if(class_colour[i][1] == class)then
				colour = class_colour[i][2]
			end
        end
        if (player:GetGmRank() == "0") then
                SendWorldMessage("|cFF35bab8<"..PLAYERENTER.ServerName.." - Announce>|r - |CFFbbbbbbWelcome Back :|r "..colour..""..player:GetName().."|r|CFFbbbbbb!|r", 2)
        end

end

RegisterServerHook(3, "PLAYERENTER.PlayerOnEnterWorldFirstTimeWelcome")
RegisterServerHook(19, "PLAYERENTER.PlayerOnEnterWorldWelcome")