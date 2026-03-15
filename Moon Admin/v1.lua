-- From RosyExploits --
-- Archived on march 16 1:33 AM
function split(str, sep)
    if sep == nil then sep = "%s" end -- wsp
    local t = {}
    for s in string.gmatch(str, "([^"..sep.."]+)") do
        table.insert(t, s)
    end
    return t
end
player = game.Players.LocalPlayer
if player ~= nil then -- make sure you exploiter have loaded
    local h = Instance.new("Hint")
    h.Text = "Moon Admin: Loaded, type moon!help the prefix is moon!"
    h.Parent = player.PlayerGui 
    wait(3)
    h:Destroy()
    functions = {
        ["hint"] = function(text, dur, parent) hok=Instance.new("Hint", parent)    hok.Text = text wait(dur) hok.Parent = nil end, 
        ["msg"] = function(text, dur, parent) hok=Instance.new("Message", parent)    hok.Text = text wait(dur) hok.Parent = nil end
    }
    commands = {
        ["moon!help"] = function() functions['hint']("Moon Admin: Made By rosyexploits, your prefix is moon!",3,player.PlayerGui) end,
        ["moon!kill"] = function(plr) workspace[plr].Humanoid.Health = 0 end,
        ["moon!kick"] = function(plr)
            game.Players[plr]:Destroy()
        end,
        ["moon!ff"] = function(plr)
            Instance.new("ForceField",workspace[plr])
        end,
        ["moon!god"] = function(plr)
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
        end,
        ["moon!ws"] = function(plr, ws)
            workspace[plr].Humanoid.WalkSpeed = ws
        end,
        ["moon!jp"] = function(plr, jp)
            workspace[plr].Humanoid.JumpPower = jp
        end,
        ['moon!commands'] = function()
    functions['msg']("Commands:\nmoon!help\nmoon!kill [plr]\nmoon!kick [plr]\nmoon!ff [plr]\nmoon!god\nmoon!ws [plr] [speed]\nmoon!jp [plr] [power]\nmoon!tp [plr1] [plr2]\nmoon!toggleanchor [plr] [1 or 0]\nmoon!invis [plr]\nmoon!visible [plr]\nmoon!commands\nmoon!canicopymoon", 7, player.PlayerGui)
end,


        ['moon!invis'] = function(plr)
            for i,v in pairs(workspace[plr]:GetChildren()) do
if v.ClassName == "BasePart" then
    v.Transparency = 1
end
            end
        end,
        ['moon!visible'] = function(plr)
            for i,v in pairs(workspace[plr]:GetChildren()) do
if v.ClassName == "BasePart" then
    v.Transparency = 0
end
            end
        end,
        ['moon!canicopymoon'] = function()
            functions['msg']('Moon Admin: Can I Copy Moon? YES As long as you credit rosyexploits',3,player.PlayerGui)
        end,
        ['moon!tp'] = function(target1, target2)
            workspace[target1]:MoveTo(workspace[target2].Torso.Position)
        end,
        ['moon!toggleanchor'] = function(plr, num)
            local char = workspace[plr]
            if num == "1" then 
                for i,obj in pairs(char:GetChildren()) do
                    if obj:IsA("BasePart") then
                        obj.Anchored = true
                    end
                end
            elseif num == "0" then 
                for i,obj in pairs(char:GetChildren()) do
                    if obj:IsA("BasePart") then
                        obj.Anchored = false
                    end
                end
            end
        end
    }
    player.Chatted:Connect(function(msg)
        local args = split(msg, " ") -- yo
        local cmd = commands[args[1]:lower()]
        
        if cmd then
            cmd(args[2], args[3]) -- tp
        end
    end)
else
    print("bro plz run in player client, if your running in studio instead replace localplayer to your username")
end
