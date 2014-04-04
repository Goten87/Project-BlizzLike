-- Death Touch KICK Script, it's used to kick players who use Death Touch.
function PlayerDeathTouch(event, plr, spellid)
	if spellid == 5 then
		if plr:GetGmRank() <= 1 then
			plr:SoftDisconnect()
		end
	end
end

RegisterServerHook(5, "PlayerDeathTouch")