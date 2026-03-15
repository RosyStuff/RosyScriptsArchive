function t(lel)for i,v in pairs(lel:GetChildren()) do if v:IsA("BasePart") then Instance.new("Fire",v)end t(v) end end t(game.Workspace)
