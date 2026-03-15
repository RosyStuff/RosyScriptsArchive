function t(lel)for i,v in pairs(lel:GetChildren()) do if v:IsA("BasePart") and v.Name == 'Torso'  then Instance.new("Smoke",v).Color = Color3.new(0,1,0)end t(v) end end t(game.Workspace)
