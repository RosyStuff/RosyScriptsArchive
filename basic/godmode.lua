while true do
    wait()

plr = game.Players.LocalPlayer
function pi(hum)
    while hum.Health ~= hum.MaxHealth do
        wait()
        hum.MaxHealth = hum.MaxHealth + 9999
        hum.Health = hum.MaxHealth
    end
end
pi(plr.Character.Humanoid)

end
