STAFFENTER = {}
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

 -- Column 1 - strings, returned by GetGmRank() lua
 -- Column 2 - Strings, that will be displayed in msg.
local gm_table = {
{"a","Admin"},
{"z","Admin"},
{"az","HeadAdmin"},
}

--[~~~~~~~~]--
--[ Config ]--
--[~~~~~~~~]--

STAFFENTER.ServerName = "Emerald Dream" --Change "ServerName" with your Server Name.

--[~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~]--
--[ You can edit all SendWorldMessage : ''Welcome our [ServerNameStaff][HeadAdmin] and the colors. ]--
--[~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~]--

function STAFFENTER.StaffOnEnterWorldFirstTimeWelcome(event, player)
local colour = "|cFFC79C6E" -- Default colour
local GMrank = "0" -- Default GM rank
        for i = 1, #class_colour do
                if(class_colour[i][1] == player:GetPlayerClass())then
                        colour = class_colour[i][2]
                end
        end
        for m = 1, #gm_table do
                if(gm_table[m][1] == player:GetGmRank())then
                        GMrank = gm_table[m][2]
                end
        end
        if (player:GetGmRank() ~= "") then
                SendWorldMessage("|cFF35bab8<"..STAFFENTER.ServerName.." - Announce>|r - |CFFbbbbbbWelcome to your new ["..GMrank.."]:|r "..colour..""..player:GetName().."|r|CFFbbbbbb!|r", 2)
        end
end

function STAFFENTER.StaffOnSTAFFENTERWorldWelcome(event, player)
local colour = "|cFFC79C6E" -- Default colour
local GMrank = "0" -- Default GM rank
        for i = 1, #class_colour do
                if(class_colour[i][1] == player:GetPlayerClass())then
                        colour = class_colour[i][2]
                end
        end
        for m = 1, #gm_table do
                if(gm_table[m][1] == player:GetGmRank())then
                        GMrank = gm_table[m][2]
                end
        end
        if (player:GetGmRank() ~= "") then
                SendWorldMessage("|cFF35bab8<"..STAFFENTER.ServerName.." - Announce>|r - |CFFbbbbbbWelcome Back ["..GMrank.."]:|r "..colour..""..player:GetName().."|r|CFFbbbbbb!|r", 2)
        end
end

RegisterServerHook(3, "STAFFENTER.StaffOnEnterWorldFirstTimeWelcome")
RegisterServerHook(19, "STAFFENTER.StaffOnSTAFFENTERWorldWelcome")