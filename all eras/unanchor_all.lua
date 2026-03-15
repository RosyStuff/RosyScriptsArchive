function nokia(obj)
	for i,v in pairs(obj:GetChildren()) do
		if v.ClassName == "Part" or v.ClassName == "MeshPart" then
			v.Anchored = false
		end
		nokia(v)
	end
end
nokia(game.workspace)
-- coded by rosyexploits in roblox studio modern, enjoy
