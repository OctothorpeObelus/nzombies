function nz.Perks.Functions.UpdateQuickRevive()
	if #player.GetAllPlaying() <= 1 then
		for k,v in pairs(ents.FindByClass("perk_machine")) do
			if v:GetPerkID() == "revive" then
				v:SetPrice(500) -- Price is 500 for Solo variant and always on
				v:TurnOn()
			end
		end
	else
		for k,v in pairs(ents.FindByClass("perk_machine")) do
			if v:GetPerkID() == "revive" then
				v:SetPrice(1500) -- Reset to default 1500 and turn off if power is not on
				if !nz.Elec.Data.Active then
					v:TurnOff()
				else
					v:TurnOn()
				end
			end
		end
	end
end

hook.Add("OnPlayerDropIn", "UpdateRevive", function()
	nz.Perks.Functions.UpdateQuickRevive()
end)

hook.Add("OnPlayerDropOut", "UpdateRevive", function()
	nz.Perks.Functions.UpdateQuickRevive()
end)