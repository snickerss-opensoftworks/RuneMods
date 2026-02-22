local Docs = {}

local function dumper(s)
	if typeof(s) == "Instance" then
		if s:IsA("LocalScript") or s:IsA("ModuleScript") then
			local fn = rawget(_G, "getscriptbytecode")
			if fn then
				local success, bytecode = pcall(fn, s)
				if success then
					return bytecode
				end
			end
		end
	end
	return nil
end

local function getScriptBytecode(s)
	local bytecode = dumper(s)
	if bytecode then
		return bytecode
	end
	return nil
end

local function getScriptSource(s)
	if typeof(s) == "Instance" then
		if s:IsA("LocalScript") or s:IsA("ModuleScript") then
			return s.Source
		end
	end
	return nil
end

local function getScriptName(s)
	if typeof(s) == "Instance" then
		return s.Name
	end
	return nil
end

local function getScriptParent(s)
	if typeof(s) == "Instance" then
		return s.Parent
	end
	return nil
end

local function getScriptChildren(s)
	if typeof(s) == "Instance" then
		return s:GetChildren()
	end
	return {}
end

local function getScriptDescendants(s)
	if typeof(s) == "Instance" then
		return s:GetDescendants()
	end
	return {}
end

local function getScriptAttribute(s, key)
	if typeof(s) == "Instance" then
		return s:GetAttribute(key)
	end
	return nil
end

local function getScriptAttributes(s)
	if typeof(s) == "Instance" then
		return s:GetAttributes()
	end
	return {}
end

local function getScriptTag(s, tag)
	if typeof(s) == "Instance" then
		return s:HasTag(tag)
	end
	return false
end

local function getScriptAncestor(s, depth)
	if typeof(s) == "Instance" then
		local current = s
		for i = 1, depth do
			current = current.Parent
			if not current then
				return nil
			end
		end
		return current
	end
	return nil
end

local function getScriptDescendant(s, depth)
	if typeof(s) == "Instance" then
		local current = s
		for i = 1, depth do
			current = current.Parent
			if not current then
				return nil
			end
		end
		return current
	end
	return nil
end

Docs = {
	["RuneAPI"] = {
		["say"] = print,
		["Say"] = print,
		["error"] = function(...)
			local m = table.concat({...}, " ")
			game:GetService("TestService"):Message(m)
		end,
		["Error"] = function(...)
			local m = table.concat({...}, " ")
			game:GetService("TestService"):Message(m)
		end,
		-- idk what to put here
		-- uhhh
		-- HELP ME
		["gameid"] = game.GameId,
		["Gameid"] = game.GameId,
		["placeid"] = game.PlaceId,
		["Placeid"] = game.PlaceId,
		["jobid"] = game.JobId,
		["Jobid"] = game.JobId,
		["user"] = game.Players.LocalPlayer,
		["User"] = game.Players.LocalPlayer,
		["players"] = game.Players,
		["Players"] = game.Players,
		["new"] = Instance.new,
		["New"] = Instance.new,
		["workspace"] = game:GetService("Workspace"),
		["Workspace"] = game:GetService("Workspace"),
		["wait"] = task.wait,
		["Wait"] = task.wait,
		["gamename"] = game.Name,
		["Gamename"] = game.Name,
		-- alr thats it for today guys!
		-- nvm i got bored.
		["get"] = function(s)
			return game:GetService(s)
		end,
		["Get"] = function(s)
			return game:GetService(s)
		end,
		["dump"] = dumper,
		["Dump"] = dumper,
		["mouse"] = function()
			return game.Players.LocalPlayer:GetMouse()
		end,
		["Mouse"] = function()
			return game.Players.LocalPlayer:GetMouse()
		end,
		["keydown"] = function(k)
			return game:GetService("UserInputService"):IsKeyDown(k)
		end,
		["Keydown"] = function(k)
			return game:GetService("UserInputService"):IsKeyDown(k)
		end,
		["tween"] = function(o, i, g)
			local t = game:GetService("TweenService"):Create(o, i, g)
			t:Play()
			return t
		end,
		["Tween"] = function(o, i, g)
			local t = game:GetService("TweenService"):Create(o, i, g)
			t:Play()
			return t
		end,
		["var"] = _G or "local",
		["Var"] = _G or "local",
		["fenv"] = function()
			return getfenv(2)
		end,
		["Fenv"] = function()
			return getfenv(2)
		end,
		["time"] = os.time,
		["Time"] = os.time,
		["tick"] = tick,
		["Tick"] = tick,
		["rand"] = math.random,
		["Rand"] = math.random,
		["floor"] = math.floor,
		["Floor"] = math.floor,
		["ceil"] = math.ceil,
		["Ceil"] = math.ceil,
		["abs"] = math.abs,
		["Abs"] = math.abs,
		["clamp"] = math.clamp,
		["Clamp"] = math.clamp,
		["round"] = math.round,
		["Round"] = math.round,
		["sqrt"] = math.sqrt,
		["Sqrt"] = math.sqrt,
		["pow"] = math.pow,
		["Pow"] = math.pow,
		["max"] = math.max,
		["Max"] = math.max,
		["min"] = math.min,
		["Min"] = math.min,
		["insert"] = table.insert,
		["Insert"] = table.insert,
		["remove"] = table.remove,
		["Remove"] = table.remove,
		["find"] = table.find,
		["Find"] = table.find,
		["clear"] = table.clear,
		["Clear"] = table.clear,
		["clone"] = table.clone,
		["Clone"] = table.clone,
		["split"] = string.split,
		["Split"] = string.split,
		["lower"] = string.lower,
		["Lower"] = string.lower,
		["upper"] = string.upper,
		["Upper"] = string.upper,
		["sub"] = string.sub,
		["Sub"] = string.sub,
		["len"] = string.len,
		["Len"] = string.len,
		["str"] = tostring,
		["Str"] = tostring,
		["num"] = tonumber,
		["Num"] = tonumber,
		["pairs"] = pairs,
		["Pairs"] = pairs,
		["ipairs"] = ipairs,
		["Ipairs"] = ipairs,
		["unpack"] = unpack,
		["Unpack"] = unpack,
		["select"] = select,
		["Select"] = select,
		["cf"] = CFrame.new,
		["Cf"] = CFrame.new,
		["v3"] = Vector3.new,
		["V3"] = Vector3.new,
		["v2"] = Vector2.new,
		["V2"] = Vector2.new,
		["ud2"] = UDim2.new,
		["Ud2"] = UDim2.new,
		["color"] = Color3.new,
		["Color"] = Color3.new,
		["spawn"] = task.spawn,
		["Spawn"] = task.spawn,
		["delay"] = task.delay,
		["Delay"] = task.delay,
		["defer"] = task.defer,
		["Defer"] = task.defer,
		["char"] = function()
			return game.Players.LocalPlayer.Character
		end,
		["Char"] = function()
			return game.Players.LocalPlayer.Character
		end,
		["hum"] = function()
			local c = game.Players.LocalPlayer.Character
			return c and c:FindFirstChildOfClass("Humanoid")
		end,
		["Hum"] = function()
			local c = game.Players.LocalPlayer.Character
			return c and c:FindFirstChildOfClass("Humanoid")
		end,
		["notif"] = function(t, ti, d)
			local p = game.Players.LocalPlayer
			local g = p:FindFirstChildOfClass("PlayerGui")
			if not g then return end

			_G.__rune_notif_hide = _G.__rune_notif_hide or {}
			_G.__rune_notif_stack = _G.__rune_notif_stack or {}

			if _G.__rune_notif_hide[ti] then
				return
			end

			local ts = game:GetService("TweenService")

			local sg = Instance.new("ScreenGui")
			sg.Name = "RuneNotif"
			sg.ResetOnSpawn = false
			sg.Parent = g

			local idx = #_G.__rune_notif_stack + 1
			table.insert(_G.__rune_notif_stack, sg)

			local f = Instance.new("Frame")
			f.Size = UDim2.new(0, 340, 0, 170)
			f.Position = UDim2.new(1, 400, 1, -200 - ((idx-1)*190))
			f.BackgroundColor3 = Color3.fromRGB(18,18,22)
			f.BorderSizePixel = 0
			f.Parent = sg

			local u = Instance.new("UICorner")
			u.CornerRadius = UDim.new(0,10)
			u.Parent = f

			local st = Instance.new("UIStroke")
			st.Color = Color3.fromRGB(40,40,50)
			st.Thickness = 1
			st.Parent = f

			local tl = Instance.new("TextLabel")
			tl.Size = UDim2.new(1, -20, 0, 30)
			tl.Position = UDim2.new(0, 10, 0, 12)
			tl.BackgroundTransparency = 1
			tl.Text = ti
			tl.TextColor3 = Color3.new(1,1,1)
			tl.TextSize = 18
			tl.Font = Enum.Font.GothamBold
			tl.TextXAlignment = Enum.TextXAlignment.Left
			tl.Parent = f

			local dl = Instance.new("TextLabel")
			dl.Size = UDim2.new(1, -20, 0, 65)
			dl.Position = UDim2.new(0, 10, 0, 45)
			dl.BackgroundTransparency = 1
			dl.TextWrapped = true
			dl.Text = d
			dl.TextColor3 = Color3.fromRGB(200,200,210)
			dl.TextSize = 14
			dl.Font = Enum.Font.Gotham
			dl.TextXAlignment = Enum.TextXAlignment.Left
			dl.TextYAlignment = Enum.TextYAlignment.Top
			dl.Parent = f

			local bf = Instance.new("Frame")
			bf.Size = UDim2.new(1, -20, 0, 35)
			bf.Position = UDim2.new(0, 10, 1, -45)
			bf.BackgroundTransparency = 1
			bf.Parent = f

			local function animIn()
				ts:Create(f, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Position = UDim2.new(1, -360, 1, -200 - ((idx-1)*190))
				}):Play()
			end

			local function animOut()
				local tw = ts:Create(f, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					Position = UDim2.new(1, 400, 1, f.Position.Y.Offset)
				})
				tw:Play()
				tw.Completed:Wait()
				sg:Destroy()
				for i,v in ipairs(_G.__rune_notif_stack) do
					if v == sg then
						table.remove(_G.__rune_notif_stack, i)
						break
					end
				end
				for i,v in ipairs(_G.__rune_notif_stack) do
					local fr = v:FindFirstChildOfClass("Frame")
					if fr then
						ts:Create(fr, TweenInfo.new(0.25), {
							Position = UDim2.new(1, -360, 1, -200 - ((i-1)*190))
						}):Play()
					end
				end
			end

			local function btn(txt, pos)
				local b = Instance.new("TextButton")
				b.Size = UDim2.new(0.48, 0, 1, 0)
				b.Position = pos
				b.BackgroundColor3 = Color3.fromRGB(30,30,35)
				b.TextColor3 = Color3.new(1,1,1)
				b.TextSize = 14
				b.Font = Enum.Font.Gotham
				b.Text = txt
				b.Parent = bf
				local c = Instance.new("UICorner")
				c.CornerRadius = UDim.new(0,6)
				c.Parent = b
				return b
			end

			animIn()

			if t == "Question" then
				local y = btn("Yes", UDim2.new(0,0,0,0))
				local n = btn("No", UDim2.new(0.52,0,0,0))
				y.MouseButton1Click:Connect(function()
					animOut()
				end)
				n.MouseButton1Click:Connect(function()
					animOut()
				end)
			elseif t == "Normal" then
				local o = btn("Ok", UDim2.new(0,0,0,0))
				local dsa = btn("Dont Show Again", UDim2.new(0.52,0,0,0))
				o.MouseButton1Click:Connect(function()
					animOut()
				end)
				dsa.MouseButton1Click:Connect(function()
					_G.__rune_notif_hide[ti] = true
					animOut()
				end)
				task.delay(6, function()
					if sg.Parent then
						animOut()
					end
				end)
			elseif t == "Warning" then
				local o = Instance.new("TextButton")
				o.Size = UDim2.new(1, 0, 1, 0)
				o.BackgroundColor3 = Color3.fromRGB(45,40,20)
				o.TextColor3 = Color3.new(1,1,1)
				o.TextSize = 14
				o.Font = Enum.Font.Gotham
				o.Text = "Ok"
				o.Parent = bf
				local c = Instance.new("UICorner")
				c.CornerRadius = UDim.new(0,6)
				c.Parent = o
				o.MouseButton1Click:Connect(function()
					animOut()
				end)
				task.delay(6, function()
					if sg.Parent then
						animOut()
					end
				end)
			elseif t == "Error" then
				local o = Instance.new("TextButton")
				o.Size = UDim2.new(1, 0, 1, 0)
				o.BackgroundColor3 = Color3.fromRGB(60,20,20)
				o.TextColor3 = Color3.new(1,1,1)
				o.TextSize = 14
				o.Font = Enum.Font.Gotham
				o.Text = "Ok"
				o.Parent = bf
				local c = Instance.new("UICorner")
				c.CornerRadius = UDim.new(0,6)
				c.Parent = o
				o.MouseButton1Click:Connect(function()
					animOut()
				end)
				task.delay(8, function()
					if sg.Parent then
						animOut()
					end
				end)
			end
		end,
		["Notif"] = function(t, ti, d)
			return Docs["RuneAPI"]["notif"](t, ti, d)
		end,
		["mtable"] = getmetatable,
		["Mtable"] = getmetatable,
		["setmtable"] = setmetatable,
		["Setmtable"] = setmetatable,
		["identity"] = function(x) return x end,
		["Identity"] = function(x) return x end,
		["gui"] = Instance.new("ScreenGui"),
		["Gui"] = Instance.new("ScreenGui"),
		["frame"] = Instance.new("Frame"),
		["Frame"] = Instance.new("Frame"),
		["tbutton"] = Instance.new("TextButton"),
		["Tbutton"] = Instance.new("TextButton"),
		["ibutton"] = Instance.new("ImageButton"),
		["Ibutton"] = Instance.new("ImageButton"),
		["scrollframe"] = Instance.new("ScrollingFrame"),
		["Scrollframe"] = Instance.new("ScrollingFrame"),
		["canvasgroup"] = Instance.new("CanvasGroup"),
		["Canvasgroup"] = Instance.new("CanvasGroup"),
		["textlabel"] = Instance.new("TextLabel"),
		["Textlabel"] = Instance.new("TextLabel"),
		["imagelabel"] = Instance.new("ImageLabel"),
		["Imagelabel"] = Instance.new("ImageLabel"),
		["textbox"] = Instance.new("TextBox"),
		["Textbox"] = Instance.new("TextBox"),
		["gettext"] = function(x) return x.Text end,
		["Gettext"] = function(x) return x.Text end,
		["settext"] = function(x, y) x.Text = y end,
		["Settext"] = function(x, y) x.Text = y end,
		["cframe"] = CFrame.new,
		["Cframe"] = CFrame.new,
		["printtable"] = function(t)
			for k, v in pairs(t) do
				print(k, ":", v)
			end
		end,
		["Printtable"] = function(t)
			for k, v in pairs(t) do
				print(k, ":", v)
			end
		end,
		["type"] = typeof,
		["Type"] = typeof,
		["waitfor"] = function(instance, child)
			return instance:WaitForChild(child)
		end,
		["Waitfor"] = function(instance, child)
			return instance:WaitForChild(child)
		end,
		["destroy"] = function(instance)
			instance:Destroy()
		end,
		["Destroy"] = function(instance)
			instance:Destroy()
		end,
		["findfirstchild"] = function(instance, name)
			return instance:FindFirstChild(name)
		end,
		["FindFirstChild"] = function(instance, name)
			return instance:FindFirstChild(name)
		end,
		["getchildren"] = function(instance)
			return instance:GetChildren()
		end,
		["GetChildren"] = function(instance)
			return instance:GetChildren()
		end,
		["getdescendants"] = function(instance)
			return instance:GetDescendants()
		end,
		["GetDescendants"] = function(instance)
			return instance:GetDescendants()
		end,
		["setparent"] = function(instance, parent)
			instance.Parent = parent
		end,
		["SetParent"] = function(instance, parent)
			instance.Parent = parent
		end,
		["setproperty"] = function(instance, prop, value)
			instance[prop] = value
		end,
		["SetProperty"] = function(instance, prop, value)
			instance[prop] = value
		end,
		["getproperty"] = function(instance, prop)
			return instance[prop]
		end,
		["GetProperty"] = function(instance, prop)
			return instance[prop]
		end,
		["fireclickdetector"] = function(detector)
			if detector:IsA("ClickDetector") then
				detector:FireClick(0)
			end
		end,
		["FireClickDetector"] = function(detector)
			if detector:IsA("ClickDetector") then
				detector:FireClick(0)
			end
		end,
		["fireproximityprompt"] = function(prompt)
			if prompt:IsA("ProximityPrompt") then
				prompt:InputHoldBegin()
				task.wait()
				prompt:InputHoldEnd()
			end
		end,
		["FireProximityPrompt"] = function(prompt)
			if prompt:IsA("ProximityPrompt") then
				prompt:InputHoldBegin()
				task.wait()
				prompt:InputHoldEnd()
			end
		end,
		["getconnections"] = function(signal)
			return signal:GetConnections()
		end,
		["GetConnections"] = function(signal)
			return signal:GetConnections()
		end,
		["getplayer"] = function(name)
			return game:GetService("Players"):FindFirstChild(name) or game:GetService("Players").LocalPlayer
		end,
		["GetPlayer"] = function(name)
			return game:GetService("Players"):FindFirstChild(name) or game:GetService("Players").LocalPlayer
		end,
		["getallplayers"] = function()
			return game:GetService("Players"):GetPlayers()
		end,
		["GetAllPlayers"] = function()
			return game:GetService("Players"):GetPlayers()
		end,
		["isplayeralive"] = function(player)
			return player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.Health > 0
		end,
		["IsPlayerAlive"] = function(player)
			return player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.Health > 0
		end,
		["httpget"] = function(url)
			return game:HttpGet(url)
		end,
		["HttpGet"] = function(url)
			return game:HttpGet(url)
		end,
		["httppost"] = function(url, data)
			return game:HttpPost(url, data)
		end,
		["HttpPost"] = function(url, data)
			return game:HttpPost(url, data)
		end,
		["jsonencode"] = function(data)
			return game:GetService("HttpService"):JSONEncode(data)
		end,
		["JsonEncode"] = function(data)
			return game:GetService("HttpService"):JSONEncode(data)
		end,
		["jsondecode"] = function(json)
			return game:GetService("HttpService"):JSONDecode(json)
		end,
		["JsonDecode"] = function(json)
			return game:GetService("HttpService"):JSONDecode(json)
		end,
		["rgb"] = function(r, g, b)
			return Color3.fromRGB(r, g, b)
		end,
		["Rgb"] = function(r, g, b)
			return Color3.fromRGB(r, g, b)
		end,
		["hex"] = function(hex)
			return Color3.fromHex(hex)
		end,
		["Hex"] = function(hex)
			return Color3.fromHex(hex)
		end,
		["randomcolor"] = function()
			return Color3.new(math.random(), math.random(), math.random())
		end,
		["RandomColor"] = function()
			return Color3.new(math.random(), math.random(), math.random())
		end,
		["clearchildren"] = function(instance)
			for _, child in ipairs(instance:GetChildren()) do
				child:Destroy()
			end
		end,
		["ClearChildren"] = function(instance)
			for _, child in ipairs(instance:GetChildren()) do
				child:Destroy()
			end
		end,
		["findfirstchildofclass"] = function(instance, className)
			return instance:FindFirstChildOfClass(className)
		end,
		["FindFirstChildOfClass"] = function(instance, className)
			return instance:FindFirstChildOfClass(className)
		end,
		["getclassname"] = function(instance)
			return instance.ClassName
		end,
		["GetClassName"] = function(instance)
			return instance.ClassName
		end,
		["isancestorof"] = function(instance, descendant)
			return instance:IsAncestorOf(descendant)
		end,
		["IsAncestorOf"] = function(instance, descendant)
			return instance:IsAncestorOf(descendant)
		end,
		["isdescendantof"] = function(instance, ancestor)
			return instance:IsDescendantOf(ancestor)
		end,
		["IsDescendantOf"] = function(instance, ancestor)
			return instance:IsDescendantOf(ancestor)
		end,
		["getplayerfromuserid"] = function(userId)
			return game:GetService("Players"):GetPlayerByUserId(userId)
		end,
		["GetPlayerFromUserId"] = function(userId)
			return game:GetService("Players"):GetPlayerByUserId(userId)
		end,
		["getplayercharacter"] = function(player)
			return player.Character
		end,
		["GetPlayerCharacter"] = function(player)
			return player.Character
		end,
		["getplayerhumanoid"] = function(player)
			return player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		end,
		["GetPlayerHumanoid"] = function(player)
			return player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		end,
		["getplayerhealth"] = function(player)
			local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
			return hum and hum.Health or 0
		end,
		["GetPlayerHealth"] = function(player)
			local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
			return hum and hum.Health or 0
		end,
		["getplayerteam"] = function(player)
			return player.Team
		end,
		["GetPlayerTeam"] = function(player)
			return player.Team
		end,
		["v3new"] = Vector3.new,
		["V3New"] = Vector3.new,
		["v3zero"] = Vector3.zero,
		["V3Zero"] = Vector3.zero,
		["v3one"] = Vector3.one,
		["V3One"] = Vector3.one,
		["cfnew"] = CFrame.new,
		["CfNew"] = CFrame.new,
		["cfangles"] = CFrame.Angles,
		["CfAngles"] = CFrame.Angles,
		["cfeuler"] = function(x, y, z)
			return CFrame.fromEulerAnglesXYZ(x, y, z)
		end,
		["CfEuler"] = function(x, y, z)
			return CFrame.fromEulerAnglesXYZ(x, y, z)
		end,
		["distance"] = function(v1, v2)
			return (v1 - v2).Magnitude
		end,
		["Distance"] = function(v1, v2)
			return (v1 - v2).Magnitude
		end,
		["tablelength"] = function(t)
			local count = 0
			for _ in pairs(t) do count = count + 1 end
			return count
		end,
		["TableLength"] = function(t)
			local count = 0
			for _ in pairs(t) do count = count + 1 end
			return count
		end,
		["tablekeys"] = function(t)
			local keys = {}
			for k in pairs(t) do table.insert(keys, k) end
			return keys
		end,
		["TableKeys"] = function(t)
			local keys = {}
			for k in pairs(t) do table.insert(keys, k) end
			return keys
		end,
		["tablevalues"] = function(t)
			local values = {}
			for _, v in pairs(t) do table.insert(values, v) end
			return values
		end,
		["TableValues"] = function(t)
			local values = {}
			for _, v in pairs(t) do table.insert(values, v) end
			return values
		end,
		["tablemerge"] = function(t1, t2)
			local merged = {}
			for k, v in pairs(t1) do merged[k] = v end
			for k, v in pairs(t2) do merged[k] = v end
			return merged
		end,
		["TableMerge"] = function(t1, t2)
			local merged = {}
			for k, v in pairs(t1) do merged[k] = v end
			for k, v in pairs(t2) do merged[k] = v end
			return merged
		end,
		["tablereverse"] = function(t)
			local reversed = {}
			for i = #t, 1, -1 do table.insert(reversed, t[i]) end
			return reversed
		end,
		["TableReverse"] = function(t)
			local reversed = {}
			for i = #t, 1, -1 do table.insert(reversed, t[i]) end
			return reversed
		end,
		["trim"] = function(s)
			return s:match("^%s*(.-)%s*$")
		end,
		["Trim"] = function(s)
			return s:match("^%s*(.-)%s*$")
		end,
		["replace"] = function(s, pattern, replacement)
			return s:gsub(pattern, replacement)
		end,
		["Replace"] = function(s, pattern, replacement)
			return s:gsub(pattern, replacement)
		end,
		["startswith"] = function(s, prefix)
			return s:sub(1, #prefix) == prefix
		end,
		["StartsWith"] = function(s, prefix)
			return s:sub(1, #prefix) == prefix
		end,
		["endswith"] = function(s, suffix)
			return #s >= #suffix and s:sub(-#suffix) == suffix
		end,
		["EndsWith"] = function(s, suffix)
			return #s >= #suffix and s:sub(-#suffix) == suffix
		end,
		["contains"] = function(s, substring)
			return s:find(substring, 1, true) ~= nil
		end,
		["Contains"] = function(s, substring)
			return s:find(substring, 1, true) ~= nil
		end,
		["repeatstr"] = string.rep,
		["RepeatStr"] = string.rep,
		["sign"] = function(x)
			return x > 0 and 1 or x < 0 and -1 or 0
		end,
		["Sign"] = function(x)
			return x > 0 and 1 or x < 0 and -1 or 0
		end,
		["lerp"] = function(a, b, t)
			return a + (b - a) * t
		end,
		["Lerp"] = function(a, b, t)
			return a + (b - a) * t
		end,
		["map"] = function(value, inMin, inMax, outMin, outMax)
			return outMin + (outMax - outMin) * ((value - inMin) / (inMax - inMin))
		end,
		["Map"] = function(value, inMin, inMax, outMin, outMax)
			return outMin + (outMax - outMin) * ((value - inMin) / (inMax - inMin))
		end,
		["isinrange"] = function(value, min, max)
			return value >= min and value <= max
		end,
		["IsInRange"] = function(value, min, max)
			return value >= min and value <= max
		end,
		["average"] = function(...)
			local args = {...}
			local sum = 0
			for _, v in ipairs(args) do sum = sum + v end
			return sum / #args
		end,
		["Average"] = function(...)
			local args = {...}
			local sum = 0
			for _, v in ipairs(args) do sum = sum + v end
			return sum / #args
		end,
		["sleep"] = task.wait,
		["Sleep"] = task.wait,
		["setinterval"] = function(func, interval)
			local connection
			connection = game:GetService("RunService").Heartbeat:Connect(function(dt)
				task.wait(interval)
				func()
			end)
			return connection
		end,
		["SetInterval"] = function(func, interval)
			local connection
			connection = game:GetService("RunService").Heartbeat:Connect(function(dt)
				task.wait(interval)
				func()
			end)
			return connection
		end,
		["settimeout"] = function(func, delay)
			task.delay(delay, func)
		end,
		["SetTimeout"] = function(func, delay)
			task.delay(delay, func)
		end,
		["stoploop"] = function(connection)
			if connection then connection:Disconnect() end
		end,
		["StopLoop"] = function(connection)
			if connection then connection:Disconnect() end
		end,
		["inspect"] = function(value)
			return table.inspect and table.inspect(value) or tostring(value)
		end,
		["Inspect"] = function(value)
			return table.inspect and table.inspect(value) or tostring(value)
		end,
		["getstack"] = function()
			return debug.traceback()
		end,
		["GetStack"] = function()
			return debug.traceback()
		end,
		["uis"] = game:GetService("UserInputService"),
		["Uis"] = game:GetService("UserInputService"),
		["tweenService"] = game:GetService("TweenService"),
		["TweenService"] = game:GetService("TweenService"),
		["httpService"] = game:GetService("HttpService"),
		["HttpService"] = game:GetService("HttpService"),
		["runService"] = game:GetService("RunService"),
		["RunService"] = game:GetService("RunService"),
		["replicatedStorage"] = game:GetService("ReplicatedStorage"),
		["ReplicatedStorage"] = game:GetService("ReplicatedStorage"),
		["serverStorage"] = game:GetService("ServerStorage"),
		["ServerStorage"] = game:GetService("ServerStorage"),
		["serverScriptService"] = game:GetService("ServerScriptService"),
		["ServerScriptService"] = game:GetService("ServerScriptService"),
		["lighting"] = game:GetService("Lighting"),
		["Lighting"] = game:GetService("Lighting"),
		["debris"] = game:GetService("Debris"),
		["Debris"] = game:GetService("Debris"),
		["collectionService"] = game:GetService("CollectionService"),
		["CollectionService"] = game:GetService("CollectionService"),
		["try"] = pcall,
		["Try"] = pcall,
		["xtry"] = xpcall,
		["XTry"] = xpcall,
		["co"] = coroutine.create,
		["Co"] = coroutine.create,
		["cowrap"] = coroutine.wrap,
		["Cowrap"] = coroutine.wrap,
		["coresume"] = coroutine.resume,
		["Coresume"] = coroutine.resume,
		["costatus"] = coroutine.status,
		["Costatus"] = coroutine.status,
		["coyield"] = coroutine.yield,
		["Coyield"] = coroutine.yield,
		["sort"] = table.sort,
		["Sort"] = table.sort,
		["concat"] = table.concat,
		["Concat"] = table.concat,
		["move"] = table.move,
		["Move"] = table.move,
		["freeze"] = table.freeze,
		["Freeze"] = table.freeze,
		["isfrozen"] = table.isfrozen,
		["IsFrozen"] = table.isfrozen,
		["format"] = string.format,
		["Format"] = string.format,
		["byte"] = string.byte,
		["Byte"] = string.byte,
		["schar"] = string.char,
		["Schar"] = string.char,
		["match"] = string.match,
		["Match"] = string.match,
		["gmatch"] = string.gmatch,
		["Gmatch"] = string.gmatch,
		["gsub"] = string.gsub,
		["Gsub"] = string.gsub,
		["rep"] = string.rep,
		["Rep"] = string.rep,
		["rev"] = string.rev,
		["Rev"] = string.rev,
		["sfind"] = string.find,
		["Sfind"] = string.find,
		["rawget"] = rawget,
		["Rawget"] = rawget,
		["rawset"] = rawset,
		["Rawset"] = rawset,
		["rawlen"] = rawlen,
		["Rawlen"] = rawlen,
		["raweq"] = rawequal,
		["Raweq"] = rawequal,
		["req"] = require,
		["Req"] = require,
		["load"] = loadstring,
		["Load"] = loadstring,
		["next"] = next,
		["Next"] = next,
		["pi"] = math.pi,
		["Pi"] = math.pi,
		["huge"] = math.huge,
		["Huge"] = math.huge,
		["sin"] = math.sin,
		["Sin"] = math.sin,
		["cos"] = math.cos,
		["Cos"] = math.cos,
		["tan"] = math.tan,
		["Tan"] = math.tan,
		["log"] = math.log,
		["Log"] = math.log,
		["exp"] = math.exp,
		["Exp"] = math.exp,
		["deg"] = math.deg,
		["Deg"] = math.deg,
		["rad"] = math.rad,
		["Rad"] = math.rad,
		["fmod"] = math.fmod,
		["Fmod"] = math.fmod,
		["modf"] = math.modf,
		["Modf"] = math.modf,
		["noise"] = math.noise,
		["Noise"] = math.noise,
		["clock"] = os.clock,
		["Clock"] = os.clock,
		["date"] = os.date,
		["Date"] = os.date,
		["cam"] = function()
			return workspace.CurrentCamera
		end,
		["Cam"] = function()
			return workspace.CurrentCamera
		end,
		["campos"] = function()
			return workspace.CurrentCamera.CFrame.Position
		end,
		["Campos"] = function()
			return workspace.CurrentCamera.CFrame.Position
		end,
		["viewport"] = function()
			return workspace.CurrentCamera.ViewportSize
		end,
		["Viewport"] = function()
			return workspace.CurrentCamera.ViewportSize
		end,
		["worldtoscreen"] = function(pos)
			return workspace.CurrentCamera:WorldToScreenPoint(pos)
		end,
		["WorldToScreen"] = function(pos)
			return workspace.CurrentCamera:WorldToScreenPoint(pos)
		end,
		["screentoworld"] = function(pos, depth)
			return workspace.CurrentCamera:ScreenPointToRay(pos.X, pos.Y, depth or 0)
		end,
		["ScreenToWorld"] = function(pos, depth)
			return workspace.CurrentCamera:ScreenPointToRay(pos.X, pos.Y, depth or 0)
		end,
		["dupe"] = function(instance, parent)
			local c = instance:Clone()
			if parent then c.Parent = parent end
			return c
		end,
		["Dupe"] = function(instance, parent)
			local c = instance:Clone()
			if parent then c.Parent = parent end
			return c
		end,
		["lookat"] = CFrame.lookAt,
		["LookAt"] = CFrame.lookAt,
		["ti"] = TweenInfo.new,
		["Ti"] = TweenInfo.new,
		["ud"] = UDim.new,
		["Ud"] = UDim.new,
		["bc"] = BrickColor.new,
		["Bc"] = BrickColor.new,
		["rbc"] = BrickColor.Random,
		["Rbc"] = BrickColor.Random,
		["ray"] = Ray.new,
		["Ray"] = Ray.new,
		["enum"] = Enum,
		["Enum"] = Enum,
		["userid"] = function(player)
			return (player or game.Players.LocalPlayer).UserId
		end,
		["UserId"] = function(player)
			return (player or game.Players.LocalPlayer).UserId
		end,
		["fire"] = function(remote, ...)
			remote:FireServer(...)
		end,
		["Fire"] = function(remote, ...)
			remote:FireServer(...)
		end,
		["invoke"] = function(remote, ...)
			return remote:InvokeServer(...)
		end,
		["Invoke"] = function(remote, ...)
			return remote:InvokeServer(...)
		end,
		["tagged"] = function(tag)
			return game:GetService("CollectionService"):GetTagged(tag)
		end,
		["Tagged"] = function(tag)
			return game:GetService("CollectionService"):GetTagged(tag)
		end,
		["onhb"] = function(fn)
			return game:GetService("RunService").Heartbeat:Connect(fn)
		end,
		["OnHb"] = function(fn)
			return game:GetService("RunService").Heartbeat:Connect(fn)
		end,
		["onrs"] = function(fn)
			return game:GetService("RunService").RenderStepped:Connect(fn)
		end,
		["OnRs"] = function(fn)
			return game:GetService("RunService").RenderStepped:Connect(fn)
		end,
		["onstep"] = function(fn)
			return game:GetService("RunService").Stepped:Connect(fn)
		end,
		["OnStep"] = function(fn)
			return game:GetService("RunService").Stepped:Connect(fn)
		end,
		["off"] = function(connection)
			if connection then connection:Disconnect() end
		end,
		["Off"] = function(connection)
			if connection then connection:Disconnect() end
		end,
		["additem"] = function(instance, lifetime)
			game:GetService("Debris"):AddItem(instance, lifetime or 5)
		end,
		["AddItem"] = function(instance, lifetime)
			game:GetService("Debris"):AddItem(instance, lifetime or 5)
		end,
		["getenv"] = getfenv,
		["Getenv"] = getfenv,
		["setenv"] = setfenv,
		["Setenv"] = setfenv,
		["gcinfo"] = gcinfo,
		["Gcinfo"] = gcinfo,
		["newproxy"] = newproxy,
		["Newproxy"] = newproxy,
		["identifyexecutor"] = identifyexecutor or function() return "unknown" end,
		["Identifyexecutor"] = identifyexecutor or function() return "unknown" end,
		["getgenv"] = getgenv,
		["Getgenv"] = getgenv,
		["getrenv"] = getrenv,
		["Getrenv"] = getrenv,
		["getreg"] = getreg,
		["Getreg"] = getreg,
		["getgc"] = getgc,
		["Getgc"] = getgc,
		["getinstances"] = getinstances,
		["Getinstances"] = getinstances,
		["getnilinstances"] = getnilinstances,
		["Getnilinstances"] = getnilinstances,
		["getscripts"] = getscripts,
		["Getscripts"] = getscripts,
		["getrunningscripts"] = getrunningscripts,
		["Getrunningscripts"] = getrunningscripts,
		["getloadedmodules"] = getloadedmodules,
		["Getloadedmodules"] = getloadedmodules,
		["isexecutorclosure"] = isexecutorclosure,
		["Isexecutorclosure"] = isexecutorclosure,
		["checkclosure"] = checkclosure,
		["Checkclosure"] = checkclosure,
		["iscclosure"] = iscclosure,
		["Iscclosure"] = iscclosure,
		["islclosure"] = islclosure,
		["Islclosure"] = islclosure,
		["isourclosure"] = isourclosure,
		["Isourclosure"] = isourclosure,
		["clonefunction"] = clonefunction,
		["Clonefunction"] = clonefunction,
		["hookfunction"] = hookfunction,
		["Hookfunction"] = hookfunction,
		["newcclosure"] = newcclosure,
		["Newcclosure"] = newcclosure,
		["getupvalue"] = debug.getupvalue,
		["Getupvalue"] = debug.getupvalue,
		["setupvalue"] = debug.setupvalue,
		["Setupvalue"] = debug.setupvalue,
		["getupvalues"] = debug.getupvalues,
		["Getupvalues"] = debug.getupvalues,
		["getconstant"] = debug.getconstant,
		["Getconstant"] = debug.getconstant,
		["setconstant"] = debug.setconstant,
		["Setconstant"] = debug.setconstant,
		["getconstants"] = debug.getconstants,
		["Getconstants"] = debug.getconstants,
		["getproto"] = debug.getproto,
		["Getproto"] = debug.getproto,
		["getprotos"] = debug.getprotos,
		["Getprotos"] = debug.getprotos,
		["getinfo"] = debug.getinfo,
		["Getinfo"] = debug.getinfo,
		["setstack"] = debug.setstack,
		["Setstack"] = debug.setstack,
		["getstack"] = debug.getstack,
		["Getstack"] = debug.getstack,
		["traceback"] = debug.traceback,
		["Traceback"] = debug.traceback,
		["decompile"] = decompile or function() return "decompile not supported" end,
		["Decompile"] = decompile or function() return "decompile not supported" end,
		["readfile"] = readfile,
		["Readfile"] = readfile,
		["writefile"] = writefile,
		["Writefile"] = writefile,
		["appendfile"] = appendfile,
		["Appendfile"] = appendfile,
		["listfiles"] = listfiles,
		["Listfiles"] = listfiles,
		["isfile"] = isfile,
		["Isfile"] = isfile,
		["isfolder"] = isfolder,
		["Isfolder"] = isfolder,
		["makefolder"] = makefolder,
		["Makefolder"] = makefolder,
		["delfolder"] = delfolder,
		["Delfolder"] = delfolder,
		["delfile"] = delfile,
		["Delfile"] = delfile,
		["loadfile"] = loadfile,
		["Loadfile"] = loadfile,
		["dofile"] = dofile,
		["Dofile"] = dofile,
		["setclipboard"] = setclipboard,
		["Setclipboard"] = setclipboard,
		["getclipboard"] = getclipboard,
		["Getclipboard"] = getclipboard,
		["setfpscap"] = setfpscap,
		["Setfpscap"] = setfpscap,
		["getfpscap"] = getfpscap,
		["Getfpscap"] = getfpscap,
		["mousemove"] = function(x, y)
			mousemoverel(x, y)
		end,
		["Mousemove"] = function(x, y)
			mousemoverel(x, y)
		end,
		["mouseclick"] = function(btn)
			mouse1click()
		end,
		["Mouseclick"] = function(btn)
			mouse1click()
		end,
		["mouse1down"] = mouse1press,
		["Mouse1down"] = mouse1press,
		["mouse1up"] = mouse1release,
		["Mouse1up"] = mouse1release,
		["mouse2down"] = mouse2press,
		["Mouse2down"] = mouse2press,
		["mouse2up"] = mouse2release,
		["Mouse2up"] = mouse2release,
		["keypress"] = keypress,
		["Keypress"] = keypress,
		["keyrelease"] = keyrelease,
		["Keyrelease"] = keyrelease,
		["screenshot"] = function()
			return game:GetService("StarterGui"):SetCore("TakeScreenshot")
		end,
		["Screenshot"] = function()
			return game:GetService("StarterGui"):SetCore("TakeScreenshot")
		end,
		["notify"] = function(title, text)
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = title,
				Text = text,
				Duration = 5
			})
		end,
		["Notify"] = function(title, text)
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = title,
				Text = text,
				Duration = 5
			})
		end,
		["topbar"] = function(enabled)
			game:GetService("StarterGui"):SetCore("TopbarEnabled", enabled)
		end,
		["Topbar"] = function(enabled)
			game:GetService("StarterGui"):SetCore("TopbarEnabled", enabled)
		end,
		["resetchar"] = function()
			game.Players.LocalPlayer:LoadCharacter()
		end,
		["Resetchar"] = function()
			game.Players.LocalPlayer:LoadCharacter()
		end,
		["respawn"] = function()
			game.Players.LocalPlayer:LoadCharacter()
		end,
		["Respawn"] = function()
			game.Players.LocalPlayer:LoadCharacter()
		end,
		["setspeed"] = function(speed)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum.WalkSpeed = speed end
		end,
		["Setspeed"] = function(speed)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum.WalkSpeed = speed end
		end,
		["setjump"] = function(power)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum.JumpPower = power end
		end,
		["Setjump"] = function(power)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum.JumpPower = power end
		end,
		["sethealth"] = function(health)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum.Health = health end
		end,
		["Sethealth"] = function(health)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum.Health = health end
		end,
		["setgrav"] = function(gravity)
			workspace.Gravity = gravity
		end,
		["Setgrav"] = function(gravity)
			workspace.Gravity = gravity
		end,
		["getgrav"] = function()
			return workspace.Gravity
		end,
		["Getgrav"] = function()
			return workspace.Gravity
		end,
		["tp"] = function(pos)
			local char = game.Players.LocalPlayer.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.CFrame = CFrame.new(pos) end
		end,
		["Tp"] = function(pos)
			local char = game.Players.LocalPlayer.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.CFrame = CFrame.new(pos) end
		end,
		["tpto"] = function(player)
			local target = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			local char = game.Players.LocalPlayer.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if hrp and target then hrp.CFrame = target.CFrame end
		end,
		["Tpto"] = function(player)
			local target = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			local char = game.Players.LocalPlayer.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if hrp and target then hrp.CFrame = target.CFrame end
		end,
		["getpos"] = function()
			local char = game.Players.LocalPlayer.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			return hrp and hrp.Position
		end,
		["Getpos"] = function()
			local char = game.Players.LocalPlayer.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			return hrp and hrp.Position
		end,
		["hrp"] = function()
			local char = game.Players.LocalPlayer.Character
			return char and char:FindFirstChild("HumanoidRootPart")
		end,
		["Hrp"] = function()
			local char = game.Players.LocalPlayer.Character
			return char and char:FindFirstChild("HumanoidRootPart")
		end,
		["head"] = function()
			local char = game.Players.LocalPlayer.Character
			return char and char:FindFirstChild("Head")
		end,
		["Head"] = function()
			local char = game.Players.LocalPlayer.Character
			return char and char:FindFirstChild("Head")
		end,
		["tool"] = function()
			local char = game.Players.LocalPlayer.Character
			return char and char:FindFirstChildOfClass("Tool")
		end,
		["Tool"] = function()
			local char = game.Players.LocalPlayer.Character
			return char and char:FindFirstChildOfClass("Tool")
		end,
		["equip"] = function(tool)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
		end,
		["Equip"] = function(tool)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
		end,
		["unequip"] = function()
			game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
		end,
		["Unequip"] = function()
			game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
		end,
		["backpack"] = function()
			return game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
		end,
		["Backpack"] = function()
			return game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
		end,
		["gettools"] = function()
			return game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()
		end,
		["Gettools"] = function()
			return game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()
		end,
		["pfind"] = function(name)
			for _, p in ipairs(game.Players:GetPlayers()) do
				if p.Name:lower():find(name:lower()) then return p end
			end
		end,
		["Pfind"] = function(name)
			for _, p in ipairs(game.Players:GetPlayers()) do
				if p.Name:lower():find(name:lower()) then return p end
			end
		end,
		["pcount"] = function()
			return #game.Players:GetPlayers()
		end,
		["Pcount"] = function()
			return #game.Players:GetPlayers()
		end,
		["islocalplayer"] = function(player)
			return player == game.Players.LocalPlayer
		end,
		["IsLocalPlayer"] = function(player)
			return player == game.Players.LocalPlayer
		end,
		["getteams"] = function()
			return game:GetService("Teams"):GetTeams()
		end,
		["Getteams"] = function()
			return game:GetService("Teams"):GetTeams()
		end,
		["signal"] = Instance.new("BindableEvent"),
		["Signal"] = Instance.new("BindableEvent"),
		["newfunc"] = Instance.new("BindableFunction"),
		["Newfunc"] = Instance.new("BindableFunction"),
		["re"] = Instance.new("RemoteEvent"),
		["Re"] = Instance.new("RemoteEvent"),
		["rf"] = Instance.new("RemoteFunction"),
		["Rf"] = Instance.new("RemoteFunction"),
		["onclient"] = function(remote, fn)
			return remote.OnClientEvent:Connect(fn)
		end,
		["Onclient"] = function(remote, fn)
			return remote.OnClientEvent:Connect(fn)
		end,
		["onserver"] = function(remote, fn)
			return remote.OnServerEvent:Connect(fn)
		end,
		["Onserver"] = function(remote, fn)
			return remote.OnServerEvent:Connect(fn)
		end,
		["changed"] = function(instance, prop, fn)
			return instance:GetPropertyChangedSignal(prop):Connect(fn)
		end,
		["Changed"] = function(instance, prop, fn)
			return instance:GetPropertyChangedSignal(prop):Connect(fn)
		end,
		["onchange"] = function(instance, fn)
			return instance.Changed:Connect(fn)
		end,
		["Onchange"] = function(instance, fn)
			return instance.Changed:Connect(fn)
		end,
		["onadded"] = function(instance, fn)
			return instance.ChildAdded:Connect(fn)
		end,
		["Onadded"] = function(instance, fn)
			return instance.ChildAdded:Connect(fn)
		end,
		["onremoved"] = function(instance, fn)
			return instance.ChildRemoved:Connect(fn)
		end,
		["Onremoved"] = function(instance, fn)
			return instance.ChildRemoved:Connect(fn)
		end,
		["ondescadded"] = function(instance, fn)
			return instance.DescendantAdded:Connect(fn)
		end,
		["Ondescadded"] = function(instance, fn)
			return instance.DescendantAdded:Connect(fn)
		end,
		["ondescremoved"] = function(instance, fn)
			return instance.DescendantRemoving:Connect(fn)
		end,
		["Ondescremoved"] = function(instance, fn)
			return instance.DescendantRemoving:Connect(fn)
		end,
		["ontouched"] = function(part, fn)
			return part.Touched:Connect(fn)
		end,
		["Ontouched"] = function(part, fn)
			return part.Touched:Connect(fn)
		end,
		["onuntouched"] = function(part, fn)
			return part.TouchEnded:Connect(fn)
		end,
		["Onuntouched"] = function(part, fn)
			return part.TouchEnded:Connect(fn)
		end,
		["onclicked"] = function(detector, fn)
			return detector.MouseClick:Connect(fn)
		end,
		["Onclicked"] = function(detector, fn)
			return detector.MouseClick:Connect(fn)
		end,
		["onprompt"] = function(prompt, fn)
			return prompt.Triggered:Connect(fn)
		end,
		["Onprompt"] = function(prompt, fn)
			return prompt.Triggered:Connect(fn)
		end,
		["onchat"] = function(fn)
			return game.Players.LocalPlayer.Chatted:Connect(fn)
		end,
		["Onchat"] = function(fn)
			return game.Players.LocalPlayer.Chatted:Connect(fn)
		end,
		["onjoin"] = function(fn)
			return game.Players.PlayerAdded:Connect(fn)
		end,
		["Onjoin"] = function(fn)
			return game.Players.PlayerAdded:Connect(fn)
		end,
		["onleave"] = function(fn)
			return game.Players.PlayerRemoving:Connect(fn)
		end,
		["Onleave"] = function(fn)
			return game.Players.PlayerRemoving:Connect(fn)
		end,
		["ondied"] = function(fn)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then return hum.Died:Connect(fn) end
		end,
		["Ondied"] = function(fn)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then return hum.Died:Connect(fn) end
		end,
		["onrespawn"] = function(fn)
			return game.Players.LocalPlayer.CharacterAdded:Connect(fn)
		end,
		["Onrespawn"] = function(fn)
			return game.Players.LocalPlayer.CharacterAdded:Connect(fn)
		end,
		["onstepped"] = function(fn)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then return hum.Stepped:Connect(fn) end
		end,
		["Onstepped"] = function(fn)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then return hum.Stepped:Connect(fn) end
		end,
		["onjumped"] = function(fn)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then return hum.Jumping:Connect(fn) end
		end,
		["Onjumped"] = function(fn)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then return hum.Jumping:Connect(fn) end
		end,
		["onkeydown"] = function(fn)
			return game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
				if not gp then fn(input.KeyCode) end
			end)
		end,
		["Onkeydown"] = function(fn)
			return game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
				if not gp then fn(input.KeyCode) end
			end)
		end,
		["onkeyup"] = function(fn)
			return game:GetService("UserInputService").InputEnded:Connect(function(input, gp)
				if not gp then fn(input.KeyCode) end
			end)
		end,
		["Onkeyup"] = function(fn)
			return game:GetService("UserInputService").InputEnded:Connect(function(input, gp)
				if not gp then fn(input.KeyCode) end
			end)
		end,
		["onmousedown"] = function(fn)
			return game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then fn() end
			end)
		end,
		["Onmousedown"] = function(fn)
			return game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then fn() end
			end)
		end,
		["onmouseup"] = function(fn)
			return game:GetService("UserInputService").InputEnded:Connect(function(input, gp)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then fn() end
			end)
		end,
		["Onmouseup"] = function(fn)
			return game:GetService("UserInputService").InputEnded:Connect(function(input, gp)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then fn() end
			end)
		end,
		["onmousemove"] = function(fn)
			return game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then fn(input.Position) end
			end)
		end,
		["Onmousemove"] = function(fn)
			return game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then fn(input.Position) end
			end)
		end,
		["mousepos"] = function()
			return game:GetService("UserInputService"):GetMouseLocation()
		end,
		["Mousepos"] = function()
			return game:GetService("UserInputService"):GetMouseLocation()
		end,
		["istouching"] = function(part1, part2)
			local touching = part1:GetTouchingParts()
			for _, p in ipairs(touching) do
				if p == part2 then return true end
			end
			return false
		end,
		["Istouching"] = function(part1, part2)
			local touching = part1:GetTouchingParts()
			for _, p in ipairs(touching) do
				if p == part2 then return true end
			end
			return false
		end,
		["getparts"] = function()
			local parts = {}
			for _, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("BasePart") then table.insert(parts, v) end
			end
			return parts
		end,
		["Getparts"] = function()
			local parts = {}
			for _, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("BasePart") then table.insert(parts, v) end
			end
			return parts
		end,
		["raycast"] = function(origin, direction, params)
			return workspace:Raycast(origin, direction, params or RaycastParams.new())
		end,
		["Raycast"] = function(origin, direction, params)
			return workspace:Raycast(origin, direction, params or RaycastParams.new())
		end,
		["rayparams"] = RaycastParams.new,
		["Rayparams"] = RaycastParams.new,
		["blockcast"] = function(cf, size, direction, params)
			return workspace:Blockcast(cf, size, direction, params or RaycastParams.new())
		end,
		["Blockcast"] = function(cf, size, direction, params)
			return workspace:Blockcast(cf, size, direction, params or RaycastParams.new())
		end,
		["spherecast"] = function(origin, radius, direction, params)
			return workspace:Spherecast(origin, radius, direction, params or RaycastParams.new())
		end,
		["Spherecast"] = function(origin, radius, direction, params)
			return workspace:Spherecast(origin, radius, direction, params or RaycastParams.new())
		end,
		["weld"] = function(part0, part1)
			local w = Instance.new("WeldConstraint")
			w.Part0 = part0
			w.Part1 = part1
			w.Parent = part0
			return w
		end,
		["Weld"] = function(part0, part1)
			local w = Instance.new("WeldConstraint")
			w.Part0 = part0
			w.Part1 = part1
			w.Parent = part0
			return w
		end,
		["setanchor"] = function(part, anchored)
			part.Anchored = anchored
		end,
		["Setanchor"] = function(part, anchored)
			part.Anchored = anchored
		end,
		["setcollide"] = function(part, cancollide)
			part.CanCollide = cancollide
		end,
		["Setcollide"] = function(part, cancollide)
			part.CanCollide = cancollide
		end,
		["settrans"] = function(part, trans)
			part.Transparency = trans
		end,
		["Settrans"] = function(part, trans)
			part.Transparency = trans
		end,
		["setcolor"] = function(part, color)
			part.Color = color
		end,
		["Setcolor"] = function(part, color)
			part.Color = color
		end,
		["setmat"] = function(part, mat)
			part.Material = mat
		end,
		["Setmat"] = function(part, mat)
			part.Material = mat
		end,
		["setsize"] = function(part, size)
			part.Size = size
		end,
		["Setsize"] = function(part, size)
			part.Size = size
		end,
		["setcf"] = function(part, cf)
			part.CFrame = cf
		end,
		["Setcf"] = function(part, cf)
			part.CFrame = cf
		end,
		["highlight"] = function(instance, color, outlinecolor)
			local h = Instance.new("SelectionBox")
			h.Adornee = instance
			h.Color3 = color or Color3.new(1,1,0)
			h.LineThickness = 0.05
			h.SurfaceTransparency = 0.7
			h.SurfaceColor3 = outlinecolor or Color3.new(1,1,0)
			h.Parent = instance
			return h
		end,
		["Highlight"] = function(instance, color, outlinecolor)
			local h = Instance.new("SelectionBox")
			h.Adornee = instance
			h.Color3 = color or Color3.new(1,1,0)
			h.LineThickness = 0.05
			h.SurfaceTransparency = 0.7
			h.SurfaceColor3 = outlinecolor or Color3.new(1,1,0)
			h.Parent = instance
			return h
		end,
		["billboard"] = function(adornee, text, size)
			local bb = Instance.new("BillboardGui")
			bb.Adornee = adornee
			bb.Size = size or UDim2.new(0, 100, 0, 40)
			bb.AlwaysOnTop = true
			local tl = Instance.new("TextLabel")
			tl.Size = UDim2.new(1,0,1,0)
			tl.BackgroundTransparency = 1
			tl.Text = text
			tl.TextColor3 = Color3.new(1,1,1)
			tl.TextStrokeTransparency = 0
			tl.TextScaled = true
			tl.Parent = bb
			bb.Parent = adornee
			return bb
		end,
		["Billboard"] = function(adornee, text, size)
			local bb = Instance.new("BillboardGui")
			bb.Adornee = adornee
			bb.Size = size or UDim2.new(0, 100, 0, 40)
			bb.AlwaysOnTop = true
			local tl = Instance.new("TextLabel")
			tl.Size = UDim2.new(1,0,1,0)
			tl.BackgroundTransparency = 1
			tl.Text = text
			tl.TextColor3 = Color3.new(1,1,1)
			tl.TextStrokeTransparency = 0
			tl.TextScaled = true
			tl.Parent = bb
			bb.Parent = adornee
			return bb
		end,
		["makepart"] = function(size, color, anchored, parent)
			local p = Instance.new("Part")
			p.Size = size or Vector3.new(1,1,1)
			p.Color = color or Color3.new(1,1,1)
			p.Anchored = anchored ~= nil and anchored or true
			p.Parent = parent or workspace
			return p
		end,
		["Makepart"] = function(size, color, anchored, parent)
			local p = Instance.new("Part")
			p.Size = size or Vector3.new(1,1,1)
			p.Color = color or Color3.new(1,1,1)
			p.Anchored = anchored ~= nil and anchored or true
			p.Parent = parent or workspace
			return p
		end,
		["sound"] = function(id, parent)
			local s = Instance.new("Sound")
			s.SoundId = "rbxassetid://"..id
			s.Parent = parent or workspace
			s:Play()
			return s
		end,
		["Sound"] = function(id, parent)
			local s = Instance.new("Sound")
			s.SoundId = "rbxassetid://"..id
			s.Parent = parent or workspace
			s:Play()
			return s
		end,
		["stopsound"] = function(sound)
			sound:Stop()
		end,
		["Stopsound"] = function(sound)
			sound:Stop()
		end,
		["anim"] = function(id)
			local a = Instance.new("Animation")
			a.AnimationId = "rbxassetid://"..id
			return a
		end,
		["Anim"] = function(id)
			local a = Instance.new("Animation")
			a.AnimationId = "rbxassetid://"..id
			return a
		end,
		["loadanim"] = function(id)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if not hum then return end
			local a = Instance.new("Animation")
			a.AnimationId = "rbxassetid://"..id
			return hum:LoadAnimation(a)
		end,
		["Loadanim"] = function(id)
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if not hum then return end
			local a = Instance.new("Animation")
			a.AnimationId = "rbxassetid://"..id
			return hum:LoadAnimation(a)
		end,
		["stopallanims"] = function()
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if not hum then return end
			for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
				track:Stop()
			end
		end,
		["Stopallanims"] = function()
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if not hum then return end
			for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
				track:Stop()
			end
		end,
		["getanims"] = function()
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then return hum:GetPlayingAnimationTracks() end
			return {}
		end,
		["Getanims"] = function()
			local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then return hum:GetPlayingAnimationTracks() end
			return {}
		end,
		["vel"] = function(part)
			return part.AssemblyLinearVelocity
		end,
		["Vel"] = function(part)
			return part.AssemblyLinearVelocity
		end,
		["setvel"] = function(part, velocity)
			part.AssemblyLinearVelocity = velocity
		end,
		["Setvel"] = function(part, velocity)
			part.AssemblyLinearVelocity = velocity
		end,
		["push"] = function(part, force)
			part:ApplyImpulse(force)
		end,
		["Push"] = function(part, force)
			part:ApplyImpulse(force)
		end,
		["mass"] = function(part)
			return part:GetMass()
		end,
		["Mass"] = function(part)
			return part:GetMass()
		end,
		["closest"] = function(pos, list)
			local closest, dist = nil, math.huge
			for _, v in ipairs(list) do
				local d = (v.Position - pos).Magnitude
				if d < dist then closest, dist = v, d end
			end
			return closest, dist
		end,
		["Closest"] = function(pos, list)
			local closest, dist = nil, math.huge
			for _, v in ipairs(list) do
				local d = (v.Position - pos).Magnitude
				if d < dist then closest, dist = v, d end
			end
			return closest, dist
		end,
		["closestplayer"] = function()
			local lp = game.Players.LocalPlayer
			local char = lp.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if not hrp then return nil end
			local closest, dist = nil, math.huge
			for _, p in ipairs(game.Players:GetPlayers()) do
				if p ~= lp and p.Character then
					local phrp = p.Character:FindFirstChild("HumanoidRootPart")
					if phrp then
						local d = (phrp.Position - hrp.Position).Magnitude
						if d < dist then closest, dist = p, d end
					end
				end
			end
			return closest, dist
		end,
		["ClosestPlayer"] = function()
			local lp = game.Players.LocalPlayer
			local char = lp.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if not hrp then return nil end
			local closest, dist = nil, math.huge
			for _, p in ipairs(game.Players:GetPlayers()) do
				if p ~= lp and p.Character then
					local phrp = p.Character:FindFirstChild("HumanoidRootPart")
					if phrp then
						local d = (phrp.Position - hrp.Position).Magnitude
						if d < dist then closest, dist = p, d end
					end
				end
			end
			return closest, dist
		end,
		["infront"] = function(cf, dist)
			return cf.Position + cf.LookVector * (dist or 5)
		end,
		["Infront"] = function(cf, dist)
			return cf.Position + cf.LookVector * (dist or 5)
		end,
		["behind"] = function(cf, dist)
			return cf.Position - cf.LookVector * (dist or 5)
		end,
		["Behind"] = function(cf, dist)
			return cf.Position - cf.LookVector * (dist or 5)
		end,
		["above"] = function(cf, dist)
			return cf.Position + cf.UpVector * (dist or 5)
		end,
		["Above"] = function(cf, dist)
			return cf.Position + cf.UpVector * (dist or 5)
		end,
		["below"] = function(cf, dist)
			return cf.Position - cf.UpVector * (dist or 5)
		end,
		["Below"] = function(cf, dist)
			return cf.Position - cf.UpVector * (dist or 5)
		end,
		["setfog"] = function(end_, start, color)
			local l = game:GetService("Lighting")
			l.FogEnd = end_ or 1000
			l.FogStart = start or 0
			l.FogColor = color or Color3.new(0.75, 0.75, 0.75)
		end,
		["Setfog"] = function(end_, start, color)
			local l = game:GetService("Lighting")
			l.FogEnd = end_ or 1000
			l.FogStart = start or 0
			l.FogColor = color or Color3.new(0.75, 0.75, 0.75)
		end,
		["settime"] = function(hour)
			game:GetService("Lighting"):SetMinutesAfterMidnight(hour * 60)
		end,
		["Settime"] = function(hour)
			game:GetService("Lighting"):SetMinutesAfterMidnight(hour * 60)
		end,
		["gettime"] = function()
			return game:GetService("Lighting"):GetMinutesAfterMidnight() / 60
		end,
		["Gettime"] = function()
			return game:GetService("Lighting"):GetMinutesAfterMidnight() / 60
		end,
		["setambient"] = function(color)
			game:GetService("Lighting").Ambient = color
		end,
		["Setambient"] = function(color)
			game:GetService("Lighting").Ambient = color
		end,
		["setbrightness"] = function(val)
			game:GetService("Lighting").Brightness = val
		end,
		["Setbrightness"] = function(val)
			game:GetService("Lighting").Brightness = val
		end,
		["rs"] = game:GetService("ReplicatedStorage"),
		["Rs"] = game:GetService("ReplicatedStorage"),
		["ss"] = game:GetService("ServerStorage"),
		["Ss"] = game:GetService("ServerStorage"),
		["sss"] = game:GetService("ServerScriptService"),
		["Sss"] = game:GetService("ServerScriptService"),
		["sg"] = function()
			return game.Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
		end,
		["Sg"] = function()
			return game.Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
		end,
		["teams"] = game:GetService("Teams"),
		["Teams"] = game:GetService("Teams"),
		["chat_svc"] = game:GetService("Chat"),
		["Chat_svc"] = game:GetService("Chat"),
		["marketplace"] = game:GetService("MarketplaceService"),
		["Marketplace"] = game:GetService("MarketplaceService"),
		["assetinfo"] = function(id)
			return game:GetService("MarketplaceService"):GetProductInfo(id)
		end,
		["AssetInfo"] = function(id)
			return game:GetService("MarketplaceService"):GetProductInfo(id)
		end,
		["ownsasset"] = function(userId, assetId)
			return game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players:GetPlayerByUserId(userId), assetId)
		end,
		["OwnsAsset"] = function(userId, assetId)
			return game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players:GetPlayerByUserId(userId), assetId)
		end,
		["ownsgamepass"] = function(player, gamepassId)
			return game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, gamepassId)
		end,
		["OwnsgamePass"] = function(player, gamepassId)
			return game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, gamepassId)
		end,
		["datastore"] = function(name, scope)
			return game:GetService("DataStoreService"):GetDataStore(name, scope)
		end,
		["Datastore"] = function(name, scope)
			return game:GetService("DataStoreService"):GetDataStore(name, scope)
		end,
		["dsget"] = function(store, key)
			return store:GetAsync(key)
		end,
		["Dsget"] = function(store, key)
			return store:GetAsync(key)
		end,
		["dsset"] = function(store, key, value)
			return store:SetAsync(key, value)
		end,
		["Dsset"] = function(store, key, value)
			return store:SetAsync(key, value)
		end,
		["dsupdate"] = function(store, key, fn)
			return store:UpdateAsync(key, fn)
		end,
		["Dsupdate"] = function(store, key, fn)
			return store:UpdateAsync(key, fn)
		end,
		["dsdel"] = function(store, key)
			return store:RemoveAsync(key)
		end,
		["Dsdel"] = function(store, key)
			return store:RemoveAsync(key)
		end,
		["profile"] = function()
			return game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid
		end,
		["Profile"] = function()
			return game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid
		end,
		["displayname"] = function(player)
			return (player or game.Players.LocalPlayer).DisplayName
		end,
		["DisplayName"] = function(player)
			return (player or game.Players.LocalPlayer).DisplayName
		end,
		["accountage"] = function(player)
			return (player or game.Players.LocalPlayer).AccountAge
		end,
		["AccountAge"] = function(player)
			return (player or game.Players.LocalPlayer).AccountAge
		end,
		["ismobile"] = function()
			return game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").KeyboardEnabled
		end,
		["IsMobile"] = function()
			return game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").KeyboardEnabled
		end,
		["ispc"] = function()
			return game:GetService("UserInputService").KeyboardEnabled
		end,
		["IsPc"] = function()
			return game:GetService("UserInputService").KeyboardEnabled
		end,
		["isgamepad"] = function()
			return game:GetService("UserInputService").GamepadEnabled
		end,
		["IsGamepad"] = function()
			return game:GetService("UserInputService").GamepadEnabled
		end,
		["isvr"] = function()
			return game:GetService("UserInputService").VREnabled
		end,
		["IsVr"] = function()
			return game:GetService("UserInputService").VREnabled
		end,
		["guiinset"] = function()
			return game:GetService("GuiService"):GetGuiInset()
		end,
		["GuiInset"] = function()
			return game:GetService("GuiService"):GetGuiInset()
		end,
		["screensize"] = function()
			return workspace.CurrentCamera.ViewportSize
		end,
		["Screensize"] = function()
			return workspace.CurrentCamera.ViewportSize
		end,
		["isvisible"] = function(part)
			local _, onScreen = workspace.CurrentCamera:WorldToScreenPoint(part.Position)
			return onScreen
		end,
		["IsVisible"] = function(part)
			local _, onScreen = workspace.CurrentCamera:WorldToScreenPoint(part.Position)
			return onScreen
		end,
		["lockmouse"] = function()
			game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCenter
		end,
		["LockMouse"] = function()
			game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCenter
		end,
		["unlockmouse"] = function()
			game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
		end,
		["UnlockMouse"] = function()
			game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
		end,
		["hidemouse"] = function()
			game:GetService("UserInputService").MouseIconEnabled = false
		end,
		["HideMouse"] = function()
			game:GetService("UserInputService").MouseIconEnabled = false
		end,
		["showmouse"] = function()
			game:GetService("UserInputService").MouseIconEnabled = true
		end,
		["ShowMouse"] = function()
			game:GetService("UserInputService").MouseIconEnabled = true
		end
	},
}

return Docs
