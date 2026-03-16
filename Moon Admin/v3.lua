-- From RosyExploits --
local bannedfolder = Instance.new('Folder', game.Players)
local banned = {}
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
		["msg"] = function(text, dur, parent) hok=Instance.new("Message", parent)    hok.Text = text wait(dur) hok.Parent = nil end,
		['removebannedplayersfromserver'] = function() for i,v in pairs(banned) do game.Players[v]:Kick("Banned By Moon Admin\n Reason:", banned[i]["reason"]) end end,
		['tobool'] = function(str) if type(str) == "string" then if str == "true" then return true elseif str == "false" then return false end end end,
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
			functions['msg']("Commands:\nmoon!help\nmoon!kill [plr]\nmoon!kick [plr]\nmoon!ff [plr]\nmoon!god\nmoon!ws [plr] [speed]\nmoon!jp [plr] [power]\nmoon!tp [plr1] [plr2]\nmoon!toggleanchor [plr] [1 or 0]\nmoon!invis [plr]\nmoon!visible [plr]\nmoon!commands\nmoon!canicopymoon\n For more commands, see the Commands table in the code", 7, player.PlayerGui)
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
				if v.ClassName == "BasePart" and v.Name ~= "HumanoidRootPart" then
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
		end,
		['moon!chat'] = function(target,msg) 
			local color = "Blue"
			game.Chat:Chat(target, msg, color)
		end,

		['moon!bringall'] = function(player)
			for i,prl in pairs(game.Players:GetChildren()) do
				workspace[prl.Name]:MoveTo(workspace[player].Torso.Position)
			end
		end,
		['moon!noclip'] = function(player, istrue)
			if istrue == "1" then
				local c = workspace[player]
				for i,v in pairs(c:GetChildren()) do
					if v:IsA("BasePart") then
						v.Anchored = false
						v.CanCollide = false
					end
				end
			end
			if istrue == "0" then
				local c = workspace[player]
				for i,v in pairs(c:GetChildren()) do
					if v:IsA("BasePart") then
						v.Anchored = false
						v.CanCollide = true
					end
				end
			end
		end,
		['moon!ban'] = function (player, reason)
			local userid = game.Players:GetUserIdFromNameAsync(player)
			local banneduser = Instance.new("NumberValue", bannedfolder)
			banneduser.Name = userid
			banneduser.Value = reason
		end,
		['moon!unban'] = function (player)
			local userid = game.Players:GetUserIdFromNameAsync(player)
			bannedfolder:FindFirstChild(userid):Destroy()
		end,
		['moon!btools'] = function(player)
			if not player then
				-- it means self
				local p = game.Players.LocalPlayer
				Instance.new("HopperBin", p.Backpack).BinType = 1
				Instance.new("HopperBin", p.Backpack).BinType = 2
				Instance.new("HopperBin", p.Backpack).BinType = 3
				Instance.new("HopperBin", p.Backpack).BinType = 4
			elseif player == "all" then
				for i,plr in pairs(game.Players:GetChildren()) do
					Instance.new("HopperBin", plr.Backpack).BinType = 1
					Instance.new("HopperBin", plr.Backpack).BinType = 2
					Instance.new("HopperBin", plr.Backpack).BinType = 3
					Instance.new("HopperBin", plr.Backpack).BinType = 4
				end
			elseif player == "others" then
				for i,plr in pairs(game.Players:GetChildren()) do
					if plr ~= game.Players.LocalPlayer then
						Instance.new("HopperBin", plr.Backpack).BinType = 1
						Instance.new("HopperBin", plr.Backpack).BinType = 2
						Instance.new("HopperBin", plr.Backpack).BinType = 3
						Instance.new("HopperBin", plr.Backpack).BinType = 4
					end
				end
			else
				Instance.new("HopperBin", game.Players[player].Backpack).BinType = 1
				Instance.new("HopperBin", game.Players[player].Backpack).BinType = 2
				Instance.new("HopperBin", game.Players[player].Backpack).BinType = 3
				Instance.new("HopperBin", game.Players[player].Backpack).BinType = 4
			end
		end,
		['moon!fling'] = function(plr,x,y,z)
			local c = workspace[plr]
			for i,v in pairs(c:GetChildren()) do
				if v:IsA("BasePart") then
					v.Velocity = Vector3.new(x,y,z)
					
				end
			end
		end,
		['moon!audio'] = function(id,vol,pitch,loop)
			local s = Instance.new("Sound", workspace)
			s.SoundId = "rbxassetid://"..id
			s.Volume = vol or 1
			s.Pitch = tonumber(pitch) or 1
			s.Looped = functions['tobool'](loop)
			s:Play()
		end,
		['moon!spin'] = function(plr,speed)
			Instance.new("BodyAngularVelocity", workspace[plr].Torso).AngularVelocity = Vector3.new(0, speed, 0)
		end,
		['moon!stealtools'] = function(plr)
			--time to rob your backpack xd the cops wont know
			for i,crap in pairs(game.Players[plr].Backpack:GetChildren() and workspace[plr]) do
				if crap.ClassName == "HopperBin" or crap.ClassName == "Tool"  then
					crap.Parent = player.Backpack
					print('stole:',crap.Name)
				end
			end 
		end,
		['moon!getalltools'] = function()
			function recursive(obj)
				for i,v in pairs(obj:GetChildren()) do
					if v.ClassName == "Tool" or v.ClassName == "HopperBin" then
						print(v.Name)
						-- steal
						v.Parent = player.Backpack
					end
				end
			end
			recursive(workspace)
		end,
		['moon!deletetools'] = function(plr)
			for i,crap in pairs(game.Players[plr].Backpack:GetChildren() and workspace[plr]) do
				if crap.ClassName == "HopperBin" or crap.ClassName == "Tool"  then
					crap:Destroy()
				end
			end 

		end,
		['moon!view'] = function(plr)
			player.CameraSubject = workspace[plr].Humanoid
		end,
		['moon!unview'] = function(plr)
			player.CameraSubject = player.Character.Humanoid
		end,
		-- workspace commands
		['moon!clear'] = function()
			for i,v in pairs(workspace:GetChildren()) do
				v:Destroy()
			end
		end,
		['moon!color'] = function(color1,color2,color3)
			function recursive(obj)
				for i,v in pairs(obj:GetChildren()) do
					if v.ClassName == "BasePart" then
						v.BrickColor = BrickColor.new(color1,color2,color3)
					end
					recursive(v)
				end
				
			end
			recursive(workspace)
		end,
		['moon!rbx7'] = function()
			-- rbx7 is currently available in github.com/RosyStuff/RosyScripts
			print('rbx7 is currently available in github.com//RosyStuff//RosyScripts only')
			functions['msg']('rbx7 is currently available in github.com//RosyStuff//RosyScripts',3,player.PlayerGui)
		end,
	}

	player.Chatted:Connect(function(msg)

		local args = split(msg, " ") -- yo
		local cmd = commands[args[1]:lower()]

		if cmd then
			cmd(args[2], args[3]) -- tp
		end
		functions['removebannedplayersfromserver']()

	end)


else
	print("bro plz run in player client, if your running in studio instead replace localplayer to your username")
end
