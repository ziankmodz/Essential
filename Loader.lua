repeat task.wait() until game:IsLoaded()

local library = {}
local spawnConnections = {}
local utils = {}


local canLoadAether = true--getgenv().EOIFHEIUFHu0e98fekwjfbnweiurghfueiyrgy9re088ug
local user = "Developer"
local hurttime = 0

if not canLoadAether then return end

Players = game:GetService("Players")
Lighting = game:GetService("Lighting")
local CollectionService = game:GetService("CollectionService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
UserInputService = game:GetService("UserInputService")
LocalPlayer = Players.LocalPlayer
Character = LocalPlayer.Character
Humanoid = Character.Humanoid
PrimaryPart = Character.PrimaryPart
PlayerGui = LocalPlayer.PlayerGui
PlayerScripts = LocalPlayer.PlayerScripts
Camera = workspace.Camera
CurrentCamera = workspace.CurrentCamera
RunService = game["Run Service"]
TweenService = game.TweenService
local inventory = workspace[LocalPlayer.Name].InventoryFolder.Value
local CollectionService = game:GetService("CollectionService")
local netmanaged = ReplicatedStorage.rbxts_include.node_modules["@rbxts"].net.out._NetManaged
local PurchaseItemRemote = ReplicatedStorage:WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem")
local ResetCharacterRemote = ReplicatedStorage:WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("ResetCharacter")


local function StopAnim()
local plr = game.Players.LocalPlayer
	plr.Character.Animate.Disabled = false
    local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
    for i, track in pairs (animtrack) do
        track:Stop()
    end
end

local config = {
	Buttons = {},
	Toggles = {},
	Options = {},
	Keybinds = {}
}

local config = {
	Buttons = {},
	Toggles = {},
	Options = {},
	Keybinds = {}
}

function newChat(msg)
	local args = {
		[1] = msg,
		[2] = "All"
	}
	game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(args))
end

local function saveConfig()
	local encrypt = game:GetService("HttpService"):JSONEncode(config); if isfile("Essential/config.json") then delfile("Essential/config.json"); end
	writefile("Essential/config.json",encrypt)
end

local function loadConfig()
	local decrypt = game:GetService("HttpService"):JSONDecode(readfile("Essential/config.json"))
	config = decrypt
end

if not isfile("Essential/config.json") then
	makefolder("Essential")
	saveConfig()
end

loadConfig()

local function raycast(start,dir)
	local p = RaycastParams.new()
	p.FilterType = Enum.RaycastFilterType.Exclude
	p.FilterDescendantsInstances = {LocalPlayer.Character,workspace.CurrentCamera}

	local ray = workspace:Raycast(start,dir,p)

	return ray
end

LocalPlayer.CharacterAdded:Connect(function(char)
	repeat task.wait() until char ~= nil

	Character = char
	Humanoid = char.Humanoid
	PrimaryPart = char.PrimaryPart
	Camera = workspace.Camera
	CurrentCamera = workspace.CurrentCamera
	
	Character.Archivable = true

	for i,v in next, spawnConnections do
		task.spawn(function() v(char) end)
	end
end)

local onMobile = UserInputService.TouchEnabled

table.insert(spawnConnections,function(char)
	task.wait(1)
	inventory = workspace[LocalPlayer.Name].InventoryFolder.Value
end)

utils.onGround = function()
	return Humanoid.FloorMaterial ~= Enum.Material.Air
end
utils.isMoving = function()
	
	if onMobile then
		return Humanoid.MoveDirection ~= Vector3.zero
	end
	
	return UserInputService:IsKeyDown("W") or UserInputService:IsKeyDown("A") or UserInputService:IsKeyDown("S") or UserInputService:IsKeyDown("D")
end

library.WindowCount = 0

local Key = "Essential | .gg/nvl" --DONT CHANGE OR SCRIPT WILL BREAK

library.Array = {}
library.Array.Background = true
library.Array.SortMode = "TextLength"
library.Array.BlurEnabled = true
library.Array.Bold = true
library.Array.BackgroundTransparency = 0.6
library.Array.TextTransparency = 0
library.Array.Rounded = true

library.Array.Font = 14


library.Color = Color3.fromRGB(158, 146, 175)
library.KeyBind = Enum.KeyCode.RightShift

library.Modules = {}

library.Modules.Rotations = false

local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.ResetOnSpawn = false

local arrayFrame = Instance.new("Frame",ScreenGui)
arrayFrame.Size = UDim2.fromScale(0.3,1)
arrayFrame.Position = UDim2.fromScale(0.7,0)
arrayFrame.BackgroundTransparency = 1
local sort = Instance.new("UIListLayout",arrayFrame)
sort.SortOrder = Enum.SortOrder.LayoutOrder

local arrayStuff = {}

local id = "http://www.roblox.com/asset/?id=7498352732"

local arrayListFrame = Instance.new("Frame",ScreenGui)
arrayListFrame.Size = UDim2.fromScale(0.2,1)
arrayListFrame.Position = UDim2.fromScale(0.780,0.03)
arrayListFrame.BackgroundTransparency = 1
arrayListFrame.Name = "ArrayList"
local sort = Instance.new("UIListLayout",arrayListFrame)
sort.SortOrder = Enum.SortOrder.LayoutOrder
sort.HorizontalAlignment = Enum.HorizontalAlignment.Right

	
	label = Instance.new("TextLabel",ScreenGui)
	label.Text = Key
	label.BackgroundColor3 = Color3.fromRGB(0,0,0)
	label.BorderSizePixel = 0
	label.TextColor3 = Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255))
	label.BackgroundTransparency = 1
	label.Size = UDim2.fromScale(0.335,0.105)
	label.Position = UDim2.fromScale(-0.008,0.01)
	label.Name = "Mark"
    label.Font = 25
    label.ZIndex = 0
    label.TextScaled = true
    local stroke = Instance.new("UIStroke",label)
    stroke.Thickness = 2

    local rgb = true

local imageId = "http://www.roblox.com/asset/?id=5857213084"
local arrayItems = {}

local arraylist = {
	Create = function(o)
		local item = Instance.new("TextLabel",arrayListFrame)
		item.Text = o
		item.BackgroundTransparency = 0.3
		item.BorderSizePixel = 0
		item.BackgroundColor3 = Color3.fromRGB(0,0,0)
		item.Size = UDim2.new(0,0,0,0)
		item.TextColor3 = Color3.fromRGB(255,255,255)
        item.Font = 14
		local glow = Instance.new("ImageLabel",item)
		glow.Size = UDim2.fromScale(4,4)
		glow.BackgroundTransparency = 1
		glow.Image = imageId
		glow.ImageTransparency = 0.3
		glow.Position = UDim2.fromScale(-1,-1.5)
		glow.ZIndex = -10

		
		if library.Array.Rounded then
			local round = Instance.new("UICorner",item)
		end

		local size = UDim2.new(0,game.TextService:GetTextSize(o,28,Enum.Font.FredokaOne,Vector2.new(0,0)).X,0.033,0)
		TweenService:Create(item,TweenInfo.new(0.4),{
			Size = size,
		}):Play()

		item.BackgroundTransparency = library.Array.Background and 0.3 or 1

		item.TextTransparency = 0

		if (library.Array.Bold) then
			item.RichText = true
			item.Text = "<b>"..item.Text.."</b>"
		end

		if library.Array.SortMode == "TextLength" then
			table.insert(arrayItems,item)
			table.sort(arrayItems,function(a,b) return game.TextService:GetTextSize(a.Text.."  ",100,Enum.Font.SourceSans,Vector2.new(0,0)).X > game.TextService:GetTextSize(b.Text.."  ",100,Enum.Font.SourceSans,Vector2.new(0,0)).X end)
			for i,v in ipairs(arrayItems) do
				v.LayoutOrder = i
			end
		end

		if library.Array.SortMode == "ReverseTextLength" then
			table.insert(arrayItems,item)
			table.sort(arrayItems,function(a,b) return game.TextService:GetTextSize(a.Text.."  ",100,Enum.Font.SourceSans,Vector2.new(0,0)).X < game.TextService:GetTextSize(b.Text.."  ",100,Enum.Font.SourceSans,Vector2.new(0,0)).X end)
			for i,v in ipairs(arrayItems) do
				v.LayoutOrder = i
			end
		end

		if library.Array.SortMode == "None" then
			sort.SortOrder = Enum.SortOrder.LayoutOrder
		end

		if library.Array.BlurEnabled then

		end

	end,
	Remove = function(o)
		for i,v in pairs(arrayItems) do
			if v.Text == o or v.Text == "<b>"..o.."</b>" then
				v:Destroy()
				table.remove(arrayItems,i)
			end
		end

		if library.Array.SortMode == "TextLength" then
			table.sort(arrayItems,function(a,b) return game.TextService:GetTextSize(a.Text.."  ",100,Enum.Font.SourceSans,Vector2.new(0,0)).X > game.TextService:GetTextSize(b.Text.."  ",100,Enum.Font.SourceSans,Vector2.new(0,0)).X end)
			for i,v in ipairs(arrayItems) do
				v.LayoutOrder = i
			end
		end

		if library.Array.SortMode == "ReverseTextLength" then
			table.sort(arrayItems,function(a,b) return game.TextService:GetTextSize(a.Text.."  ",100,Enum.Font.SourceSans,Vector2.new(0,0)).X < game.TextService:GetTextSize(b.Text.."  ",100,Enum.Font.SourceSans,Vector2.new(0,0)).X end)
			for i,v in ipairs(arrayItems) do
				v.LayoutOrder = i
			end
		end

		if library.Array.SortMode == "Name" then
			table.sort(arrayItems,function(a,b) return game.TextService:GetTextSize(a.Text.."  ",100,Enum.Font.SourceSans,Vector2.new(0,0)).X < game.TextService:GetTextSize(b.Text.."  ",100,Enum.Font.SourceSans,Vector2.new(0,0)).X end)
			for i,v in ipairs(arrayItems) do
				v.LayoutOrder = math.random(1,100)
			end
		end
	end,
}

local function refreshArray()
	local temp = {}

	for i,v in pairs(arrayItems) do
		table.insert(temp,v.Text)
		arraylist.Remove(v.Text)
	end

	for i,v in pairs(temp) do
		arraylist.Create(v)
	end
end

library.NewWindow = function(name)

	local textlabel = Instance.new("TextLabel", ScreenGui)
	textlabel.Position = UDim2.fromScale(0.1 + (library.WindowCount / 8), 0.1)
	textlabel.Size = UDim2.fromScale(0.1, 0.0425)
	textlabel.Text = name
	textlabel.Name = name
	textlabel.BorderSizePixel = 2
    textlabel.TextSize = 15
	textlabel.BackgroundColor3 = Color3.fromRGB(35,35,35)
	textlabel.TextColor3 = Color3.fromRGB(255,255,255)
    textlabel.Font = 11
	textlabel.ZIndex = 2

	local modules = Instance.new("Frame", textlabel)
	modules.Size = UDim2.fromScale(1, 5)
	modules.Position = UDim2.fromScale(0,1)
	modules.BackgroundTransparency = 1
	modules.BorderSizePixel = 0

	local sortmodules = Instance.new("UIListLayout", modules)
	sortmodules.SortOrder = Enum.SortOrder.Name

	UserInputService.InputBegan:Connect(function(k, g)
		if g then return end
		if k == nil then return end
		if k.KeyCode == library.KeyBind then
			textlabel.Visible = not textlabel.Visible
		end
	end)

	library.WindowCount += 1

	local lib = {}

	lib.NewButton = function(Table)

		library.Modules[Table.Name] = {
			Keybind = Table.Keybind,
		}

		if config.Buttons[Table.Name] == nil then
			config.Buttons[Table.Name] = {
				Enabled = false,
			}
		else
			saveConfig()
		end

		if config.Keybinds[Table.Name] == nil then
			config.Keybinds[Table.Name] = tostring(Table.Keybind):split(".")[3] or "Unknown"
		end

		library.Modules[Table.Name].Keybind = Enum.KeyCode[config.Keybinds[Table.Name]]

		local enabled = false
		local textbutton = Instance.new("TextButton", modules)
		textbutton.Size = UDim2.fromScale(1, 0.2)
		textbutton.Position = UDim2.fromScale(0,0)
		textbutton.BackgroundColor3 = Color3.fromRGB(60,60,60)
		textbutton.BorderSizePixel = 1
        textbutton.TextSize = 14
		textbutton.Text = Table.Name
		textbutton.Name = Table.Name
        textbutton.Font = 11
		textbutton.TextColor3 = Color3.fromRGB(255,255,255)

		local dropdown = Instance.new("Frame", textbutton)
		dropdown.Position = UDim2.fromScale(0,1)
        dropdown.Name = "DropDown"
		dropdown.Size = UDim2.fromScale(1,5)
		dropdown.BackgroundTransparency = 1
		dropdown.Visible = false

		local dropdownsort = Instance.new("UIListLayout", dropdown)
		dropdownsort.SortOrder = Enum.SortOrder.Name

		local lib2 = {}
		lib2.Enabled = false

		lib2.ToggleButton = function(v)
			if v then
				enabled = true
			else
				enabled = not enabled
			end

			if (enabled) then
				arraylist.Create(Table.Name)
			else
				arraylist.Remove(Table.Name)
			end

			lib2.Enabled = enabled
			task.spawn(function()
				Table.Function(enabled)
			end)

			textbutton.BackgroundColor3 = (textbutton.BackgroundColor3 == Color3.fromRGB(60,60,60) and library.Color or Color3.fromRGB(60,60,60))
			config.Buttons[Table.Name].Enabled = enabled
			saveConfig()
		end

		lib2.NewToggle = function(v)
			local Enabled = false

			if config.Toggles[v.Name.."_"..Table.Name] == nil then 
				config.Toggles[v.Name.."_"..Table.Name] = {Enabled = false}
			end

			local textbutton2 = Instance.new("TextButton", dropdown)
			textbutton2.Size = UDim2.fromScale(1, 0.15)
			textbutton2.Position = UDim2.fromScale(0,0)
			textbutton2.BackgroundColor3 = Color3.fromRGB(60,60,60)
			textbutton2.BorderSizePixel = 0
			textbutton2.Text = v.Name
			textbutton2.Name = v.Name
			textbutton2.TextColor3 = Color3.fromRGB(255,255,255)
            textbutton2.Font = 11

			local v2 = {}
			v2.Enabled = Enabled

			v2.ToggleButton = function(v3)
				if v3 then
					Enabled = v3
				else
					Enabled = not Enabled
				end
				v2.Enabled = Enabled
				task.spawn(function()
					v["Function"](Enabled)
				end)
				textbutton2.BackgroundColor3 = (textbutton2.BackgroundColor3 == Color3.fromRGB(60,60,60) and library.Color or Color3.fromRGB(60,60,60))
				config.Toggles[v.Name.."_"..Table.Name].Enabled = Enabled
				saveConfig()
			end

			textbutton2.MouseButton1Down:Connect(function()	
				v2.ToggleButton()
			end)

			if config.Toggles[v.Name.."_"..Table.Name].Enabled then
				v2.ToggleButton()
			end

			return v2
		end

		lib2.NewPicker = function(v)
			local Enabled = false

			if config.Options[v.Name.."_"..Table.Name] == nil then
				config.Options[v.Name.."_"..Table.Name] = {Option = v.Options[1]}
			end

			local textbutton2 = Instance.new("TextButton", dropdown)
			textbutton2.Size = UDim2.fromScale(1, 0.15)
			textbutton2.Position = UDim2.fromScale(0,0)
			textbutton2.BackgroundColor3 = Color3.fromRGB(10,60,5)
			textbutton2.BorderSizePixel = 0
			textbutton2.Text = v.Name.." - "..v.Options[1]
			textbutton2.Name = v.Name
			textbutton2.TextColor3 = Color3.fromRGB(255,255,255)
            textbutton2.Font = 11

			local v2 = {
				Option = v.Options[1]
			}

			local index = 0
			textbutton2.MouseButton1Down:Connect(function()
				index += 1

				if index > #v.Options then
					index = 1
				end

				v2.Option = v.Options[index]
				textbutton2.Text = v.Name.." - "..v2.Option

				config.Options[v.Name.."_"..Table.Name].Option = v.Options[index]
				saveConfig()
			end)

			textbutton2.MouseButton2Down:Connect(function()
				index -= 1

				if index < #v.Options then
					index = 1
				end

				v2.Option = v.Options[index]

				textbutton2.Text = v.Name.." - "..v2.Option
				config.Options[v.Name.."_"..Table.Name].Option = v.Options[index]
				saveConfig()
			end)

			local option = config.Options[v.Name.."_"..Table.Name].Option
			v2.Option = option
			textbutton2.Text = v.Name.." - "..option


			return v2
		end

        lib2.NewToggle = function(v)
			local Enabled = false

			if config.Toggles[v.Name.."_"..Table.Name] == nil then 
				config.Toggles[v.Name.."_"..Table.Name] = {Enabled = false}
			end

			local textbutton2 = Instance.new("TextButton", dropdown)
			textbutton2.Size = UDim2.fromScale(1, 0.15)
			textbutton2.Position = UDim2.fromScale(0,0)
			textbutton2.BackgroundColor3 = Color3.fromRGB(60,60,60)
			textbutton2.BorderSizePixel = 0
			textbutton2.Text = v.Name
			textbutton2.Name = v.Name
			textbutton2.TextColor3 = Color3.fromRGB(255,255,255)
            textbutton2.Font = 11

			local v2 = {}
			v2.Enabled = Enabled

			v2.ToggleButton = function(v3)
				if v3 then
					Enabled = v3
				else
					Enabled = not Enabled
				end
				v2.Enabled = Enabled
				task.spawn(function()
					v["Function"](Enabled)
				end)
				textbutton2.BackgroundColor3 = (textbutton2.BackgroundColor3 == Color3.fromRGB(60,60,60) and library.Color or Color3.fromRGB(60,60,60))
				config.Toggles[v.Name.."_"..Table.Name].Enabled = Enabled
				saveConfig()
			end

			textbutton2.MouseButton1Down:Connect(function()	
				v2.ToggleButton()
			end)

			if config.Toggles[v.Name.."_"..Table.Name].Enabled then
				v2.ToggleButton()
			end

			return v2
		end


			local Box = Instance.new("TextBox", dropdown)
			Box.Size = UDim2.fromScale(1, 0.15)
			Box.Position = UDim2.fromScale(0,0)
			Box.BackgroundColor3 = Color3.fromRGB(110,80,180)
			Box.BorderSizePixel = 0
			Box.Text = ""
            Box.PlaceholderText = "Keybind"
            Box.Visible = false
			Box.Name = "KeybindBox"
			Box.TextColor3 = Color3.fromRGB(255,255,255)
           Box.Font = 11
		


		textbutton.MouseButton1Down:Connect(function()
			lib2.ToggleButton()
		end)

		textbutton.MouseButton2Down:Connect(function()
			dropdown.Visible = not dropdown.Visible
			for i,v in pairs(modules:GetChildren()) do
				if v.Name == Table.Name then continue end
				if v:IsA("UIListLayout") then continue end
				v.Visible = not v.Visible
			end
		end)

		UserInputService.InputBegan:Connect(function(k, g)
			if g then return end
			if k == nil then return end
			if k.KeyCode == library.Modules[Table.Name].Keybind and k.KeyCode ~= Enum.KeyCode.Unknown then
				lib2.ToggleButton()
			end
		end)

		if config.Buttons[Table.Name].Enabled then
			lib2.ToggleButton()
		end

		return lib2
	end

	return lib

end

Combat = library.NewWindow("Combat")
Player = library.NewWindow("Player")
Motion = library.NewWindow("Motion")
Visuals = library.NewWindow("Visuals")
Misc = library.NewWindow("Misc")
Exploit = library.NewWindow("Exploit")
Legit = library.NewWindow("Legit")

if onMobile then
	local tglbtn = Instance.new("TextButton", ScreenGui)
	tglbtn.Position = UDim2.fromScale(0, 0.99)
	tglbtn.Size = UDim2.fromScale(0.05, 0.03)
	tglbtn.BorderSizePixel = 0
    tglbtn.TextScaled = true
	tglbtn.BackgroundColor3 = library.Color
	tglbtn.Name = "ToggleUi"
    tglbtn.Dragabble = true
	tglbtn.Text = "Essential"
    tglbtn.Font = 23
	

	local corner = Instance.new("UICorner", tglbtn)

	tglbtn.MouseButton1Down:Connect(function()
		for i,v in pairs(ScreenGui:GetChildren()) do
			if v.Name == "ArrayList" or v.Name == "Logo" or v.Name == "Stats" or v.Name == "ToggleUi" then
				continue
			end 
			v.Visible = not v.Visible
		end
	end)
end

local weaponMeta = {
	{"rageblade", 100},
	{"emerald_sword", 99},
	{"deathbloom", 99},
	{"glitch_void_sword", 98},
	{"sky_scythe", 98},
	{"diamond_sword", 97}, 
	{"iron_sword", 96},
	{"stone_sword", 95},
	{"wood_sword", 94},
	{"emerald_dao", 93},
	{"diamond_dao", 99},
	{"diamond_dagger", 99},
	{"diamond_great_hammer", 99},
	{"diamond_scythe", 99},
	{"iron_dao", 97},
	{"iron_scythe", 97},
	{"iron_dagger", 97},
	{"iron_great_hammer", 97},
	{"stone_dao", 96},
	{"stone_dagger", 96},
	{"stone_great_hammer", 96},
	{"stone_scythe", 96},
	{"wood_dao", 95},
	{"wood_scythe", 95},
	{"wood_great_hammer", 95},
	{"wood_dagger", 95},
	{"frosty_hammer", 1},
}

local function hasItem(item)
	if inventory:FindFirstChild(item) then
		return true, 1
	end
	return false
end

local function getBestWeapon()
	local bestSword
	local bestSwordMeta = 0
	for i, sword in ipairs(weaponMeta) do
		local name = sword[1]
		local meta = sword[2]
		if meta > bestSwordMeta and hasItem(name) then
			bestSword = name
			bestSwordMeta = meta
		end
	end
	return inventory:FindFirstChild(bestSword)
end

local function getNearestPlayer(range)
	local nearest
	local nearestDist = 9e9
	for i,v in pairs(game.Players:GetPlayers()) do
		pcall(function()
			if v == LocalPlayer or v.Team == LocalPlayer.Team then return end
			if v.Character.Humanoid.health > 0 and (v.Character.PrimaryPart.Position - LocalPlayer.Character.PrimaryPart.Position).Magnitude < nearestDist and (v.Character.PrimaryPart.Position - LocalPlayer.Character.PrimaryPart.Position).Magnitude <= range then
				nearest = v
				nearestDist = (v.Character.PrimaryPart.Position - LocalPlayer.Character.PrimaryPart.Position).Magnitude
			end
		end)
	end
	return nearest
end

local function getRemote(name)
	local remote
	for i,v in pairs(game:GetDescendants()) do
		if v.Name == name then
			remote = v
			break
		end
	end
	return remote
end

local SetInvItem = getRemote("SetInvItem")
local function spoofHand(item)
	if hasItem(item) then
		SetInvItem:InvokeServer({
			["hand"] = inventory:WaitForChild(item)
		})
	end
end

local knitRecieved, knit
knitRecieved, knit = pcall(function()
	repeat task.wait()
		return debug.getupvalue(require(game:GetService("Players")[LocalPlayer.Name].PlayerScripts.TS.knit).setup, 6)
	until knitRecieved
end)

local function getController(name)
	return knit.Controllers[name]
end

local AuraRemote = getRemote("SwordHit")

local viewmodel = Camera.Viewmodel.RightHand.RightWrist
local weld = viewmodel.C0
local oldweld = viewmodel.C0

local animRunning = true
local reverseTween

local animAuraTab = {}

local auraAnimations = {
	["Smooth"] = {
		{CFrame = CFrame.new(0.69, -0.7, 0.1) * CFrame.Angles(math.rad(-65), math.rad(55), math.rad(-51)), Timer = 0.1},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(-179), math.rad(54), math.rad(33)), Timer = 0.16},
	},
	["Spin"] = {
		{CFrame = CFrame.new(0.69, -0.7, 0.1) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.69, -0.7, 0.1) * CFrame.Angles(math.rad(-145), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(-180), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(-220), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(-270), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(-310), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(-360), math.rad(0), math.rad(0)), Timer = 0.05},
	},
	["Reverse Spin"] = {
		{CFrame = CFrame.new(0.69, -0.7, 0.1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.69, -0.7, 0.1) * CFrame.Angles(math.rad(145), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(220), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(270), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(310), math.rad(0), math.rad(0)), Timer = 0.05},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(360), math.rad(0), math.rad(0)), Timer = 0.05},
	},
	["Swoosh"] = {
		{CFrame = CFrame.new(0.69, -0.7, 0.1) * CFrame.Angles(math.rad(-65), math.rad(55), math.rad(-51)), Timer = 0.1},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(-179), math.rad(94), math.rad(33)), Timer = 0.16},
	},
	["Swang"] = {
		{CFrame = CFrame.new(0.69, -0.7, 0.1) * CFrame.Angles(math.rad(-65), math.rad(55), math.rad(-51)), Timer = 0.1},
		{CFrame = CFrame.new(0.16, -1.16, 0.5) * CFrame.Angles(math.rad(-199), math.rad(74), math.rad(43)), Timer = 0.16},
	},
	["Zoom"] = {
		{CFrame = CFrame.new(0.69, -2, 0.1) * CFrame.Angles(math.rad(-65), math.rad(55), math.rad(-51)), Timer = 0.1},
		{CFrame = CFrame.new(0.16, -0.1, -1) * CFrame.Angles(math.rad(-179), math.rad(94), math.rad(33)), Timer = 0.16},
	},
	["Classic"] = {
		{CFrame = CFrame.new(0.69, -1, 0.1) * CFrame.Angles(math.rad(-16), math.rad(12), math.rad(-21)), Timer = 0.1},
		{CFrame = CFrame.new(0.69, -2, 0.1) * CFrame.Angles(math.rad(-72), math.rad(21), math.rad(-35)), Timer = 0.07},
		{CFrame = CFrame.new(0.69, -0.6, 0.1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), Timer = 0.07},
	},
    ["Astral"] = {
        {CFrame = CFrame.new(0.8, -0.6, 0.6) * CFrame.Angles(math.rad(-16), math.rad(60), math.rad(-80)), Time = 0},
        {CFrame = CFrame.new(0.8, -0.6, 0.6) * CFrame.Angles(math.rad(-16), math.rad(60), math.rad(-80)), Time = 0.10},
        {CFrame = CFrame.new(0.96, -1.06, -2.25) * CFrame.Angles(math.rad(-179), math.rad(61), math.rad(80)), Time = 0.20}
    },
	["Other Spin"] = {
		{CFrame = CFrame.new(0.69, -2, 0.1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), Timer = 0.1},
		{CFrame = CFrame.new(0.16, -0.1, -1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(180)), Timer = 0.1},
		{CFrame = CFrame.new(0.16, -0.1, -1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(270)), Timer = 0.1},
		{CFrame = CFrame.new(0.16, -0.1, -1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(360)), Timer = 0.1},
	},
	["Corrupt"] = {
		{CFrame = CFrame.new(0.69, -2, 0.1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), Timer = 0.1},
		{CFrame = CFrame.new(0.69, -2, 0.1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(60)), Timer = 0.3},
	},
}

local funAnimations = {
	PLAYER_VACUUM_SUCK = "rbxassetid://9671620809",
	WINTER_BOSS_SPAWN = "rbxassetid://11843861791",
	GLUE_TRAP_FLYING = "rbxassetid://11466075174",
	VOID_DRAGON_TRANSFORM = "rbxassetid://10967424821",
	SIT_ON_DODO_BIRD = "http://www.roblox.com/asset/?id=2506281703",
	DODO_BIRD_FALL = "rbxassetid://7617326953",
	SWORD_SWING = "rbxassetid://7234367412",
}

local swingAnim
local auraConnection
local targetInfo = Instance.new("TextLabel",ScreenGui)
Killaura = Combat.NewButton({
	Name = "Killaura",
	Function = function(callback)
		if callback then
			auraConnection = RunService.Heartbeat:Connect(function()
				local nearest = getNearestPlayer(22)

				if nearest ~= nil then
					if DragonAnimation.Enabled then
				 game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.DragonBreath:FireServer("")
					end
					local nearestCharacter = nearest.Character
					local nearestPrimaryPartPosition = nearestCharacter.PrimaryPart.Position
					local selfPrimaryPartPosition = PrimaryPart.Position
					local weapon = getBestWeapon()

					if not ToolCheck.Enabled then
						spoofHand(weapon.Name)
					end

					task.spawn(function()
						AuraRemote:FireServer({
							chargedAttack = {
								chargeRatio = 0
							},
							entityInstance = nearestCharacter,
							validate = {
								raycast = {
									cameraPosition = CurrentCamera,
									cursorDirection = CFrame.LookVector
								},
								targetPosition = {
									value = nearestPrimaryPartPosition
								},
								selfPosition = {
									value = selfPrimaryPartPosition
								},
							},
							weapon = weapon
						})
					end)
				end
			end)

			task.spawn(function()
				repeat task.wait()
					if getNearestPlayer(22) ~= nil then
						pcall(function()
							local animation = auraAnimations[auraAnimation.Option]
							local allTime = 0
							task.spawn(function()
								if CustomAnimation.Enabled then
									animRunning = true
									for i,v in pairs(animation) do allTime += v.Timer end
									for i,v in pairs(animation) do
										local tween = game.TweenService:Create(viewmodel,TweenInfo.new(v.Timer),{C0 = oldweld * v.CFrame})
										tween:Play()
										task.wait(v.Timer - 0)
									end
									animRunning = false
									game.TweenService:Create(viewmodel,TweenInfo.new(1),{C0 = oldweld}):Play()
								end
							end)
							task.wait(allTime)
						end)
					end
				until (not Killaura.Enabled)
			end)

			task.spawn(function()
				repeat
					local nearest = getNearestPlayer(22)

					if nearest ~= nil then
						local isWinning = function()
							return nearest.Character.Humanoid.Health > Humanoid.Health
						end

						if targetInfo == nil then
							targetInfo = Instance.new("TextLabel",ScreenGui)
						end

						if TargetHudMode.Option == "Basic" then
							pcall(function()
								targetInfo.Size = UDim2.fromScale(.12, .05)
								targetInfo.BackgroundColor3 = Color3.fromRGB(25,25,25)
								targetInfo.BorderSizePixel = 0
								targetInfo.AnchorPoint = Vector2.new(0.5,0.5)
								targetInfo.Position = UDim2.fromScale(0.6,0.5)
								targetInfo.TextColor3 = Color3.fromRGB(255,255,255)
								targetInfo.Text = "  "..nearest.DisplayName.. " - IsWinning: ".. tostring(isWinning())
								targetInfo.TextXAlignment = Enum.TextXAlignment.Left

								local hp = Instance.new("Frame", targetInfo)
								hp.Position = UDim2.fromScale(0, .9)
								hp.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
								hp.BorderSizePixel = 0

								TweenService:Create(hp,TweenInfo.new(1),{
									Size = UDim2.fromScale(0.01 * nearest.Character.Humanoid.Health,0.1)
								}):Play()
							end)	
						end

						if TargetHudMode.Option == "Basic2" then
							pcall(function()
								TweenService:Create(targetInfo,TweenInfo.new(1),{
									Size = UDim2.fromScale(0.001 * nearest.Character.Humanoid.Health,0.04)
								}):Play()
								targetInfo.BackgroundColor3 = library.Color
								targetInfo.BorderSizePixel = 0
								targetInfo.AnchorPoint = Vector2.new(0.5,0.5)
								targetInfo.Position = UDim2.fromScale(0.6,0.5)
								targetInfo.TextColor3 = Color3.fromRGB(255,255,255)
								targetInfo.Text = "  "..nearest.DisplayName
								targetInfo.TextScaled = true
								targetInfo.TextXAlignment = Enum.TextXAlignment.Left
							end)	
						end

					else
						pcall(function()
							targetInfo:Remove()

							targetInfo = nil
						end)
					end
					task.wait()
				until (not Killaura.Enabled)
			end)
		else
			pcall(function()
				auraConnection:Disconnect()
			end)
		end
	end,
})

local animAuraTab = {}
for i,v in pairs(auraAnimations) do table.insert(animAuraTab,i) end

auraAnimation = Killaura.NewPicker({
	Name = "Animations",
	Options = animAuraTab
})
CustomAnimation = Killaura.NewToggle({
	Name = "Animations",
	Function = function() end
})
TargetHudMode = Killaura.NewPicker({
	Name = "TargetHud",
	Options = {"None", "Basic", "Basic2"}
})
ToolCheck = Killaura.NewToggle({
	Name = "ToolCheck",
	Function = function() end
})
DragonAnimation = Killaura.NewToggle({Name = "DragonAnimation", Function = function() end})


local box5 = ScreenGui.Combat.Frame.Killaura.DropDown.KeybindBox
box5.Visible = true
box5.Text = config.Keybinds.Killaura
box5.Changed:Connect(function()
if box5.Text ~= nil then
    local uptext = box5.Text:upper()
    box5.Text = uptext
  library.Modules.Killaura.Keybind = Enum.KeyCode[box5.Text]
end
end)


table.insert(spawnConnections,function(char)
	task.wait(1)
	viewmodel = workspace.Camera.Viewmodel.RightHand.RightWrist
end)

table.insert(spawnConnections,function(char)
	task.wait(1)
	viewmodel = workspace.Camera.Viewmodel.RightHand.RightWrist
end)

ImageESP = Visuals.NewButton({
	Name = "ImageESP",
	Function = function(callback)
		if callback then

			task.spawn(function()
				repeat
					pcall(function()
						for i,v in pairs(Players:GetPlayers()) do
							if not (v.Character.PrimaryPart:FindFirstChild("nein")) then
								if v ~= LocalPlayer and ImageESP.Enabled then
									local e = Instance.new("BillboardGui",v.Character.PrimaryPart)
									local image = Instance.new("ImageLabel",e)
									image.Size = UDim2.fromScale(10,10)
									image.Position = UDim2.fromScale(-3,-4)
									if ImageESPStyle.Option == "Sus" then
										image.Image = "http://www.roblox.com/asset/?id=9145833727"
									end

									if ImageESPStyle.Option == "Damc" then
										image.Image = "rbxassetid://16930990336"
									end

									if ImageESPStyle.Option == "Springs" then
										image.Image = "rbxassetid://16930908008"
									end

									if ImageESPStyle.Option == "Xylex" then
										image.Image = "rbxassetid://16930961099"
									end

									if ImageESPStyle.Option == "Alsploit" then
										image.Image = "http://www.roblox.com/asset/?id=12772788813"
									end
									image.BackgroundTransparency = 1
									e.Size = UDim2.fromScale(0.5,0.5)
									e.AlwaysOnTop = true
									e.Name = "nein"
								end
							end
						end
					end)
					task.wait()
				until not ImageESP.Enabled
			end)

		else
			pcall(function()
				for i,v in pairs(Players:GetPlayers()) do
					if (v.Character.PrimaryPart:FindFirstChild("nein")) then
						if v ~= LocalPlayer then
							v.Character.PrimaryPart:FindFirstChild("nein"):Destroy()
						end
					end
				end
			end)
		end
	end,
})

ImageESPStyle = ImageESP.NewPicker({
	Name = "Style",
	Options = {"Sus", "Springs","Damc", "Xylex","Alsploit"}
})

local infFlyPart
InfiniteFly = Motion.NewButton({
	Name = "InfiniteFly",
    Keybind = Enum.KeyCode.H,
	Function = function(callback)
		if callback then
			infFlyPart = Instance.new("Part",workspace)
			infFlyPart.Anchored = true
			infFlyPart.CanCollide = true
			infFlyPart.CFrame = PrimaryPart.CFrame
			infFlyPart.Size = Vector3.new(.5 ,.5, .5)
            if RootPartShow.Enabled then
                infFlyPart.Transparency = 0
            elseif not RootPartShow.Enabled then
			    infFlyPart.Transparency = 1
            end
			PrimaryPart.CFrame += Vector3.new(0,1000000,0)
			CurrentCamera.CameraSubject = infFlyPart
			repeat task.wait()
				if PrimaryPart.Position.Y < infFlyPart.Position.Y then
					PrimaryPart.CFrame += Vector3.new(0,1000000,0)
				end

				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					infFlyPart.CFrame += Vector3.new(0,0.45,0)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
					infFlyPart.CFrame += Vector3.new(0,-0.45,0)
				end

				infFlyPart.CFrame = CFrame.new(PrimaryPart.CFrame.X,infFlyPart.CFrame.Y,PrimaryPart.CFrame.Z)
			until not InfiniteFly.Enabled

		else
			pcall(function()

				for i = 1,10 do task.wait(0.01)
					PrimaryPart.Velocity = Vector3.new(0,0,0)
					PrimaryPart.CFrame = infFlyPart.CFrame
				end

				infFlyPart:Remove()
			end)

			CurrentCamera.CameraSubject = Character
		end
	end,
})
RootPartShow = InfiniteFly.NewToggle({
	Name = "ShowRoot",
	Function = function() end
})
local box2 = ScreenGui.Motion.Frame.InfiniteFly.DropDown.KeybindBox
box2.Visible = true
box2.Text = config.Keybinds.InfiniteFly
box2.Changed:Connect(function()
if box2.Text ~= nil then
    local uptext = box2.Text:upper()
    box2.Text = uptext
  library.Modules.InfiniteFly.Keybind = Enum.KeyCode[box2.Text]
end
end)


local targetInfo = Instance.new("TextLabel",ScreenGui)
TargetInfo = Visuals.NewButton({
	Name = "TargetInfo",
	Function = function(callback)
		if callback then
			task.spawn(function()
				repeat task.wait()
					local nearest = getNearestPlayer(22)
					
					if nearest ~= nil then
						local isWinning = function()
							if nearest.Character.Humanoid.Health > Humanoid.Health then
								return false
							end
							return true
						end
						
						if targetInfo == nil then
							targetInfo = Instance.new("TextLabel",ScreenGui)
						end
						
						if TargetIntoStyle.Option == "Simple" then
							pcall(function()
								TweenService:Create(targetInfo,TweenInfo.new(1),{
									Size = UDim2.fromScale(0.001 * nearest.Character.Humanoid.Health,0.04)
								}):Play()
								targetInfo.BackgroundColor3 = library.Color
								targetInfo.BorderSizePixel = 0
								targetInfo.AnchorPoint = Vector2.new(0.5,0.5)
								targetInfo.Position = UDim2.fromScale(0.6,0.5)
								targetInfo.TextColor3 = Color3.fromRGB(255,255,255)
								targetInfo.Text = "  "..nearest.DisplayName
								targetInfo.TextScaled = true
								targetInfo.TextXAlignment = Enum.TextXAlignment.Left
							end)	
						end
						
						if TargetIntoStyle.Option == "Essential" then
							pcall(function()
								targetInfo.Size = UDim2.fromScale(.12, .05)
								targetInfo.BackgroundColor3 = Color3.fromRGB(85,95,115)
								targetInfo.BorderSizePixel = 0
								targetInfo.AnchorPoint = Vector2.new(0.5,0.5)
								targetInfo.Position = UDim2.fromScale(0.6,0.5)
								targetInfo.TextColor3 = Color3.fromRGB(255,255,255)
								targetInfo.Text = "  "..nearest.DisplayName.. " - IsWinning: ".. tostring(isWinning())
								targetInfo.TextXAlignment = Enum.TextXAlignment.Left
								
								local hp = Instance.new("Frame", targetInfo)
								TweenService:Create(hp,TweenInfo.new(1),{
									Size = UDim2.fromScale(0.01 * nearest.Character.Humanoid.Health,0.1)
								}):Play()
								hp.Position = UDim2.fromScale(0, .9)
								hp.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
								hp.BorderSizePixel = 0
							end)	
						end
						
					else
						pcall(function()
							targetInfo:Remove()

							targetInfo = nil
						end)
					end
				until not TargetInfo.Enabled
			end)
		else
			pcall(function()
				targetInfo:Remove()
			end)
			
			targetInfo = nil
		end
	end,
})
TargetIntoStyle = TargetInfo.NewPicker({
	Name = "Style",
	Options = {"Simple", "Essential"}
})

local ViewmodelConnection
Viewmodel = Visuals.NewButton({
	Name = "Viewmodel",
	Function = function(callback)
		if callback then
			ViewmodelConnection = workspace.CurrentCamera.Viewmodel.ChildAdded:Connect(function(child)
				if child:IsA("Accessory") then
					task.spawn(function()
						repeat task.wait() until child:FindFirstChild("Handle")
						for i,v in pairs(child:GetDescendants()) do
							v.Size /= 1.5
						end
					end)
				end
			end) 
		else
			pcall(function()
				ViewmodelConnection:Disconnect()
			end)
		end
	end,
})

local strength
MotionBlur = Visuals.NewButton({
	Name = "MotionBlur",
	Function = function(callback)
		if callback then
			task.spawn(function()
				local blur = Instance.new("BlurEffect",game.Lighting)
				blur.Size = 0

				strength = 4

				local lastCamX = Camera.CFrame.X
				local lastCamZ = Camera.CFrame.Z

				repeat task.wait()

					local change = (lastCamX - Camera.CFrame.X) + (lastCamZ - Camera.CFrame.Z)

					if change < 0 then
						change *= -1
					end

					if change > 0.1 then
						game.TweenService:Create(blur,TweenInfo.new(1),{
							Size = change * strength
						}):Play()
					else
						game.TweenService:Create(blur,TweenInfo.new(1),{
							Size = 0
						}):Play()
					end

					lastCamX = Camera.CFrame.X
					lastCamZ = Camera.CFrame.Z
				until not MotionBlur.Enabled
			end)
		end
	end,
})
Strong = MotionBlur.NewToggle({
	Name = "Strong",
	Function = function(v)
		strength = (v == true and 8 or 4)
	end,
})

local HUDScreen = Instance.new("ScreenGui",PlayerGui)
HUDScreen.ResetOnSpawn = false

local HUDS = {}

HUDS[1] = function()
	local text = "Essential V1.0"
	local id = "http://www.roblox.com/asset/?id=7498352732"
	local lplr = game.Players.LocalPlayer
	label = Instance.new("TextLabel",HUDScreen)
	label.Text = text
	label.BackgroundColor3 = Color3.fromRGB(0,0,0)
	label.BorderSizePixel = 0
	label.TextColor3 = Color3.fromRGB(255,255,255)
	label.BackgroundTransparency = 1
	label.Size = UDim2.fromScale(0.075,0.035)
	label.Position = UDim2.fromScale(0,0)
	label.Name = "Logo"
	local glow = Instance.new("ImageLabel",label)
	glow.Size = UDim2.fromScale(1.8,1.5)
	glow.Position = UDim2.fromScale(-0.35,-0.2)
	glow.Image = id
	glow.ImageTransparency = 0.5
	glow.BackgroundTransparency = 1
	glow.ImageColor3 = Color3.fromRGB(0,0,0)
	glow.ZIndex = -10
end
HUDS[2] = function()
	local text = "Essential"

	frame = Instance.new("TextLabel",HUDScreen)
	frame.Size = UDim2.fromScale(0.17,0.04)
	frame.Position = UDim2.fromScale(0.02,0)
	frame.BorderSizePixel = 0
	frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
	frame.Text = text .. " | Build ".."1.2"
	frame.TextColor3 = Color3.fromRGB(255,255,255)
	frame.Size = UDim2.fromScale(0.1,0.035)
	frame.TextScaled = true
	frame.Name = "Logo"
	local frameTop = Instance.new("Frame",frame)
	frameTop.Size = UDim2.fromScale(1,0.08)
	frameTop.BorderSizePixel = 0
	frameTop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
end

HUD = Visuals.NewButton({
	Name = "HUD",
	Function = function(callback)
		if callback then
			task.spawn(function()
				task.wait(0.5)
				HUDScreen = Instance.new("ScreenGui",PlayerGui)
				HUDScreen.ResetOnSpawn = false
				if HUDStyle.Option == "Essential 1" then
					HUDS[1]()
				elseif HUDStyle.Option == "Essential 2" then
					HUDS[2]()
				end
				library.Array.SortMode = ArraySortStyle.Option
				library.Array.BackgroundTransparency = 0.3
				library.Array.TextTransparency = 0
				refreshArray()
			end)
		else
			pcall(function()
				HUDScreen:Remove()
			end)
		end
	end,
})
HUDStyle = HUD.NewPicker({
	Name = "Logo Style",
	Options = {"Essential 1", "Essential 2"}
})
ArrayStyle = HUD.NewPicker({
	Name = "Array Style",
	Options = {"Normal", "Gay","Space"}
})

task.spawn(function()
	repeat
		task.wait()

		for i = 1, #arrayItems, 10 do
			local endIndex = math.min(i + 9, #arrayItems)
			for j = i, endIndex do
				local v = arrayItems[j]
				if ArrayStyle.Option == "Normal" then
					v.TextColor3 = Color3.fromRGB(255, 255, 255)
				end

				if ArrayStyle.Option == "Gay" then
					local red = math.floor(math.sin(j / 10) * 127 + 128)
					local green = math.floor(math.sin(j / 10 + 2) * 127 + 128)
					local blue = math.floor(math.sin(j / 10 + 4) * 127 + 128)
					v.TextColor3 = Color3.fromRGB(red, green, blue)
				end

				if ArrayStyle.Option == "Space" then
					local red = math.floor(math.sin(j / 10) * 127 + 128)
					local blue = math.floor(math.sin(j / 10 + 2) * 127 + 128)
					v.TextColor3 = Color3.fromRGB(red, 0, blue)
				end
			end
		end
	until false
end)


ArraySortStyle = HUD.NewPicker({
	Name = "Sort Style",
	Options = {"TextLength","ReverseTextLength", "None"}
})
ArrayBlur = HUD.NewToggle({
	Name = "ArrayBlur",
	Function = function(v)
		library.Array.BlurEnabled = v
	end
})
ArrayBackground = HUD.NewToggle({
	Name = "ArrayBackground",
	Function = function(v)
		library.Array.Background = v
		refreshArray()
	end
})

ArrayRounded = HUD.NewToggle({
	Name = "ArrayRounded",
	Function = function(v)
		library.Array.Rounded = v
		refreshArray()
	end
})
--[[ArrayBold = HUD.NewToggle({
	Name = "ArrayBold",
	Function = function(v)
		library.Array.Bold = v
	end
})
ArrayBackgroundTransparency = HUD.NewPicker({
	Name = "ArrayBackground Transparency",
	Options = {"0", "0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9"}
})
ArrayTextTransparency = HUD.NewPicker({
	Name = "ArrayText Transparency",
	Options = {"0", "0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9"}
})--]]
local timeRemaining = 2.3
local flying = false
local flycon
Fly = Motion.NewButton({
	Name = "Fly",
	Keybind = Enum.KeyCode.R,
	Function = function(callback)
		if callback then
			flycon = RunService.Heartbeat:Connect(function()
            flying = true
				local velo = PrimaryPart.Velocity
				PrimaryPart.Velocity = Vector3.new(velo.X, 2.04, velo.Z)

				if UserInputService:IsKeyDown("Space") then
					PrimaryPart.Velocity = Vector3.new(velo.X, 50, velo.Z)
				end
				if UserInputService:IsKeyDown("LeftShift") then
					PrimaryPart.Velocity = Vector3.new(velo.X, -50, velo.Z)
				end
			end)

		else
			pcall(function()
            flying = false
				flycon:Disconnect()
			end)

		end
	end,
})
local box = ScreenGui.Motion.Frame.Fly.DropDown.KeybindBox
box.Visible = true
box.Text = config.Keybinds.Fly
box.Changed:Connect(function()
if box.Text ~= nil then
    local uptext = box.Text:upper()
    box.Text = uptext
  library.Modules.Fly.Keybind = Enum.KeyCode[box.Text]
end
end)


local strafecon
Strafe = Motion.NewButton({
	Name = "Strafe",
	Function = function(callback)
		if callback then
			strafecon = RunService.Heartbeat:Connect(function()
				local dir = Humanoid.MoveDirection
				local speed = Humanoid.WalkSpeed

				PrimaryPart.Velocity = Vector3.new((dir * speed).X,PrimaryPart.Velocity.Y,(dir * speed).Z)
			end)
		else
			pcall(function()
				strafecon:Disconnect()
			end)
		end
	end,
})

local fpscon
local fpscount = 0
local statsxd


local speedcon
local tickxd = 0
Speed = Motion.NewButton({
	Name = "Speed",
	Function = function(callback)
		if callback then
			speedcon = RunService.Heartbeat:Connect(function()
				tickxd += 1
				local dir = Humanoid.MoveDirection
				local speed = 0.3

				if SpeedMode.Option == "Vanilla" then
					game.Players.Localplayer.Character.Humanoid.WalkSpeed = 23
				end

				if SpeedMode.Option == "Heatseeker" then
					speed = Character:GetAttribute("SpeedBoost") and 0.07 or 0.016
				end

				if SpeedMode.Option == "HeatseekerBoost" then
					if tickxd > 180 then
						speed = 3
						tickxd = 0
					else
						speed = 0
					end
				end
				
				if SpeedMode.Option == "HeatseekerTeleport" then
					Humanoid.WalkSpeed = 10
					if tickxd > 275 then
						PrimaryPart.CFrame += PrimaryPart.CFrame.LookVector * 12.5
						tickxd = 0
					else
						speed = 0
					end
				end

				if SpeedMode.Option ~= "HeatseekerTeleport" then
					PrimaryPart.CFrame += dir * speed
				end
			end)
		else
			pcall(function()
				speedcon:Disconnect()
			end)
		end
	end,
})
SpeedMode = Speed.NewPicker({
	Name = "Mode",
	Options = {"Heatseeker", "Vanilla", "HeatseekerBoost", "HeatseekerTeleport"}
})

NoSlowDown = Motion.NewButton({
	Name = "NoSlowDown",
	Function = function(callback)
		if callback then
			repeat task.wait()
            if not Speed.Enabled then
				Humanoid.WalkSpeed = 23
            end
			until not NoSlowDown.Enabled
		end
	end,
})

Phase = Player.NewButton({
	Name = "Phase",
	Function = function(callback)
		if callback then
			repeat task.wait()
				local forwardRay = raycast(PrimaryPart.Position,Humanoid.MoveDirection * 2)

				if forwardRay then
					local inst = forwardRay.Instance
					local dir = Humanoid.MoveDirection
					local speed = (inst.Size.X + inst.Size.Z) / 1.25
					PrimaryPart.CFrame += dir * speed
				end
			until not Phase.Enabled
		end
	end,
})

local AirJumpCon
AirJump = Motion.NewButton({
	Name = "AirJump",
	Function = function(callback)
		if callback then
			AirJumpCon = UserInputService.InputBegan:Connect(function(k, g)
				if g then return end
				if k == nil then return end
				if InfiniteFly.Enabled then return end
				if k.KeyCode == Enum.KeyCode.Space then
					Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end)
		else
			pcall(function()
				AirJumpCon:Disconnect()
			end)
		end
	end,
})

Spider = Motion.NewButton({
	Name = "Spider",
	Function = function(callback)
		if callback then
			repeat
				local raycastxd = raycast(PrimaryPart.Position,Humanoid.MoveDirection * 2)
				local velo = PrimaryPart.Velocity

				if raycastxd and not UserInputService:IsKeyDown("S") then
					PrimaryPart.Velocity = Vector3.new(velo.X, 58, velo.Z)
				end

				task.wait()
			until not Spider.Enabled
		end
	end,
})

local JumpCirclesCon
JumpPlates = Visuals.NewButton({
	Name = "JumpPlates",
	Function = function(callback)
		if callback then
			task.spawn(function()
				repeat task.wait()
					local state = Humanoid:GetState()

					if state == Enum.HumanoidStateType.Jumping then
						local plate = Instance.new("Part",workspace)
						plate.Anchored = true
						plate.CanCollide = false
						plate.CastShadow = false
						plate.Size = Vector3.new(0,0,0)
						plate.CFrame = PrimaryPart.CFrame
						plate.Material = Enum.Material.Neon
						plate.Color = library.Color

						game.TweenService:Create(plate,TweenInfo.new(0.6),{
							Size = Vector3.new(4,1,4),
							CFrame = plate.CFrame - Vector3.new(0,2,0),
							Transparency = 1
						}):Play()

						game.Debris:AddItem(plate,0.6)
					end
				until not JumpPlates.Enabled
			end)
		end
	end,
})

local lastpos
Antifall = Motion.NewButton({
	Name = "Antifall",
	Function = function(callback)
		if callback then
			repeat
				local velo = PrimaryPart.Velocity
				if PrimaryPart.Position.Y < -5 then
					PrimaryPart.Velocity = Vector3.new(velo.X, 120, velo.Z)
				end

				task.wait()
			until not Antifall.Enabled
		end
	end,
})

local nofallremote = getRemote("GroundHit")
Nofall = Misc.NewButton({
	Name = "Nofall",
	Function = function(callback)
		if callback then
			repeat
				nofallremote:FireServer()
				task.wait(0.5)
			until not Nofall.Enabled
		end
	end,
})

local ProjectileFire = getRemote("ProjectileFire")
local function shoot(bow, pos)
	local args = {}
	local shootFormulaStart = pos + Vector3.new(0,1,0)
	local shootFormulaDirection = Vector3.new(0,-100,0)
	if bow.Name == "fireball" then
		args = {
			[1] = bow,
			[2] = "fireball",
			[3] = "fireball",
			[4] = pos,
			[5] = shootFormulaStart,
			[6] = Vector3.new(0,-2,0),
			[7] = tostring(game:GetService("HttpService"):GenerateGUID(true)),
			[8] = {
				["drawDurationSeconds"] = 1,
				["shotId"] = tostring(game:GetService("HttpService"):GenerateGUID(false))
			},
			[9] =  workspace:GetServerTimeNow() - 0.04
		}
	elseif bow.Name == "snowball" then
		args = {
			[1] = bow,
			[2] = "snowball",
			[3] = "snowball",
			[4] = pos,
			[5] = shootFormulaStart,
			[6] = Vector3.new(0,-5,0),
			[7] = tostring(game:GetService("HttpService"):GenerateGUID(true)),
			[8] = {
				["drawDurationSeconds"] = 1,
				["shotId"] = tostring(game:GetService("HttpService"):GenerateGUID(false))
			},
			[9] =  workspace:GetServerTimeNow() - 0.045
		}
	else
		args = {
			[1] = bow,
			[2] = "arrow",
			[3] = "arrow",
			[4] = pos,
			[5] = shootFormulaStart,
			[6] = Vector3.new(0,-5,0),
			[7] = tostring(game:GetService("HttpService"):GenerateGUID(true)),
			[8] = {
				["drawDurationSeconds"] = 1,
				["shotId"] = tostring(game:GetService("HttpService"):GenerateGUID(false))
			},
			[9] =  workspace:GetServerTimeNow() - 0.045
		}
	end
	ProjectileFire:InvokeServer(unpack(args))
end

local function getAllBows()
	local bows = {}
	for i,v in pairs(inventory:GetChildren()) do
		if v.Name:find("bow") or v.Name:find("fireball") or v.Name:find("snowball") then
			table.insert(bows,v)
		end
	end
	return bows
end


local ConsumeRemote = getRemote("ConsumeItem")
AutoPot = Player.NewButton({
	["Name"] = "AutoPot",
	Function = function(callback)
		if callback then
			task.spawn(function()
				repeat task.wait()
					if hasItem("speed_potion") then
						ConsumeRemote:InvokeServer({
							["item"] = inventory:WaitForChild("speed_potion")
						})
					end
					if hasItem("pie") then
						ConsumeRemote:InvokeServer({
							["item"] = inventory:WaitForChild("pie")
						})
					end
				until (not AutoPot.Enabled)
			end)
		end
	end
})

local msgs = {".gg/nvl Get Essential Now!","Even without Essential i wouldve still won.","Essential On Top⭐","Imagine being legit in 2024","Get Essential to win lol!",".gg/nvl to become good"}
Chatspammer = Misc.NewButton({
	Name = "Chatspammer",
	Function = function(callback)
		if callback then
			repeat
				newChat(msgs[math.random(1,6)])
				task.wait(3)
			until not Chatspammer.Enabled
		end
	end,
})


local oldskybox = {
	SkyboxBk = Lighting.Sky.SkyboxBk,
	SkyboxDn = Lighting.Sky.SkyboxDn,
	SkyboxFt = Lighting.Sky.SkyboxFt,
	SkyboxLf = Lighting.Sky.SkyboxLf,
	SkyboxRt = Lighting.Sky.SkyboxRt,
	SkyboxUp = Lighting.Sky.SkyboxUp,
}
Skybox = Visuals.NewButton({
	Name = "Skybox",
	Function = function(callback)
		if callback then
			task.wait(1)
			local assetId = ""
			if SkyboxStyle.Option == "Sus" then
				assetId = "http://www.roblox.com/asset/?id=9145833727"
			end

			if SkyboxStyle.Option == "Damc" then
				assetId = "rbxassetid://16930990336"
			end

			if SkyboxStyle.Option == "Springs" then
				assetId = "rbxassetid://16930908008"
			end

			if SkyboxStyle.Option == "Xylex" then
				assetId = "rbxassetid://16930961099"
			end

			if SkyboxStyle.Option == "Alsploit" then
				assetId = "http://www.roblox.com/asset/?id=12772788813"
			end
			if SkyboxStyle.Option == "Matrix" then
				assetId = "http://www.roblox.com/asset/?id=1412150157"
			end
			if SkyboxStyle.Option == "Covid" then
				assetId = "http://www.roblox.com/asset/?id=8518879821"
			end
			if SkyboxStyle.Option == "Space" then
				assetId = "http://www.roblox.com/asset/?id=2609221356"
			end
			if SkyboxStyle.Option == "Windows" then
				assetId = "http://www.roblox.com/asset/?id=472001646"
			end
			if SkyboxStyle.Option == "Trol" then
				assetId = "http://www.roblox.com/asset/?id=6403436054"
			end
			if SkyboxStyle.Option == "Cat" then
				assetId = "http://www.roblox.com/asset/?id=14841615129"
			end
			if SkyboxStyle.Option == "Furry" then
				assetId = "http://www.roblox.com/asset/?id=14831068996"
			end
			for i,v in pairs(oldskybox) do
				Lighting.Sky[i] = assetId
			end
		else
			for i,v in pairs(oldskybox) do
				Lighting.Sky[i] = v
			end
		end
	end,
})

SkyboxStyle = Skybox.NewPicker({
	Name = "Style",
	Options = {"Sus", "Springs","Damc", "Xylex","Alsploit","Matrix","Covid","Space","Windows","Trol","Cat","Furry"}
})


local oldsky = {
	amb = Lighting.Ambient,
	outdooramb = Lighting.OutdoorAmbient,
}

local function placeBlock(pos,block)
	local blockenginemanaged = game.ReplicatedStorage.rbxts_include.node_modules:WaitForChild("@easy-games"):WaitForChild("block-engine").node_modules:WaitForChild("@rbxts").net.out:WaitForChild("_NetManaged")
	local args = { [1] = { ['blockType'] = block, ['position'] = Vector3.new(pos.X / 3,pos.Y / 3,pos.Z / 3), ['blockData'] = 0 } }
	blockenginemanaged.PlaceBlock:InvokeServer(unpack(args))
end

local function getWool()
	for i,v in pairs(inventory:GetChildren()) do
		if v.Name:lower():find("wool") then
			return v.Name
		end
	end
end

local scaffoldBlockInst = Instance.new("Part",workspace)
scaffoldBlockInst.Size = Vector3.new(3,3,3)
scaffoldBlockInst.CFrame = CFrame.new(1000,0,0)
scaffoldBlockInst.Transparency = 0.5
scaffoldBlockInst.Material = Enum.Material.SmoothPlastic
scaffoldBlockInst.Color = library.Color

local scaffoldRun
Scaffold = Misc.NewButton({
	Name = "Scaffold",
	Keybind = Enum.KeyCode.G,
	Function = function(callback)
		if callback then
			task.spawn(function()
				scaffoldRun = game["Run Service"].RenderStepped:Connect(function()
					local block = getWool()
					if game.UserInputService:IsKeyDown(Enum.KeyCode.Space) then
						local velo = PrimaryPart.Velocity
						if ScaffoldMode3.Option == "Slow" then
							PrimaryPart.Velocity = Vector3.new(velo.X,15,velo.Z)
							for i = 1, 8 do
								placeBlock((PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector * 1) - Vector3.new(0,i + 4.5,0),block)
								placeBlock((PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector) - Vector3.new(0,i + 4.5,0),block)
							end
						end
						if ScaffoldMode3.Option == "Normal" then
							PrimaryPart.Velocity = Vector3.new(velo.X,30,velo.Z)
							for i = 1, 8 do
								placeBlock((PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector * 1) - Vector3.new(0,i + 4.5,0),block)
								placeBlock((PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector) - Vector3.new(0,i + 4.5,0),block)
							end
						end
						if ScaffoldMode3.Option == "Fast" then
							PrimaryPart.Velocity = Vector3.new(velo.X,50,velo.Z)
							for i = 1, 8 do
								placeBlock((PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector * 1) - Vector3.new(0,i + 4.5,0),block)
								placeBlock((PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector) - Vector3.new(0,i + 4.5,0),block)
							end
						end
					end
					if ScaffoldMode1.Option == "Normal" then
						if not Scaffold.Enabled then return end
						placeBlock((PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector * 1) - Vector3.new(0,4.5,0),block)
					end
					if ScaffoldMode1.Option == "Expand" then
						for i = 1, 8 do
							if not Scaffold.Enabled then return end
							if TowerExpand.Enabled and i ~= 1 then return end
							placeBlock((PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector * i) - Vector3.new(0,4.5,0),block)
						end
					end
					if ScaffoldMode2.Option == "NoSprint" and Sprint.Enabled then
						Sprint.ToggleButton(false)
						sprintController:stopSprinting()
					elseif ScaffoldMode2.Option == "Sprint" and not Sprint.Enabled then
							Sprint.ToggleButton(true)
					end
				end)
			end)
		else
			pcall(function()
				scaffoldRun:Disconnect()
			end)
		end
	end,
})
ScaffoldMode1 = Scaffold.NewPicker({
	Name = "Place Mode",
	Options = {"Normal", "Expand"}
})
ScaffoldMode2 = Scaffold.NewPicker({
	Name = "Sprint Mode",
	Options = {"Sprint", "NoSprint"}
})
ScaffoldMode3 = Scaffold.NewPicker({
	Name = "Tower Mode",
	Options = {"Slow", "Normal", "Fast", "None"}
})
TowerExpand = Scaffold.NewToggle({
	Name = "Tower Expand",
	Function = function() end
})
local box4 = ScreenGui.Misc.Frame.Scaffold.DropDown.KeybindBox
box4.Visible = true
box4.Text = config.Keybinds.Scaffold
box4.Changed:Connect(function()
if box4.Text ~= nil then
    local uptext = box4.Text:upper()
    box4.Text = uptext
  library.Modules.Scaffold.Keybind = Enum.KeyCode[box4.Text]
end
end)


local theanimmethod

local invisMethod2 = {
	["1"] = "rbxassetid://11335949902",
	["2"] = "rbxassetid://11360825341"
}

InvisibleExploit = Exploit.NewButton({
	Name = "InvisibleExploit",
	Function = function(callback)
		local track
		local theanimmethod
		if callback then
			theanimmethod = Instance.new("Animation")
			theanimmethod.AnimationId = invisMethod2[InvisMethod.Option]
			track = Humanoid.Animator:LoadAnimation(theanimmethod)
			repeat
				track:Play()
				task.wait()
			until not InvisibleExploit.Enabled
		else
			pcall(function()
				theanimmethod:Remove()
			end)
			pcall(function()
				track:Remove()
			end)
		end
	end,
})
InvisMethod = InvisibleExploit.NewPicker({
	Name = "Method",
	Options = {"2", "1"}
})

local AntiHitSafe = false
AntiHit = Motion.NewButton({
	Name = "AntiHit",
	Function = function(callback)
		if callback then
			local lastHit = tick()
			repeat
				
				local nearest = getNearestPlayer(14)
				
				if (hurttime <= 50) and nearest then
					
					if (AntiHitSafe and tick() - lastHit > 0.4) then
						PrimaryPart.CFrame = nearest.Character.PrimaryPart.CFrame + nearest.Character.PrimaryPart.CFrame.LookVector * -6+ Vector3.new(0,2,0)

						lastHit = tick()
					else
						PrimaryPart.CFrame = nearest.Character.PrimaryPart.CFrame + nearest.Character.PrimaryPart.CFrame.LookVector * -6 + Vector3.new(0,2,0)
					end
					
				end

				lastHP = Humanoid.Health
				task.wait()
			until not DamageBoost.Enabled
		end
	end,
})
AntiHitSafe = AntiHit.NewToggle({
	Name = "Safe",
	Function = function(v)
		AntiHitSafe = v
	end
})

AutoDip = Misc.NewButton({
	Name = "AutoDip",
	Function = function(callback)
		if callback then
			local lastHit = tick()
			local wasDisabled = false
			repeat task.wait()
				local nearest = getNearestPlayer(9e9)
				if Humanoid.Health > 0 and Humanoid.Health < 30 and nearest.Character.Humanoid.Health > Humanoid.Health and not InfiniteFly.Enabled then
					InfiniteFly.ToggleButton(true)
					wasDisabled = true
				end
				
				if Humanoid.Health > 50 and InfiniteFly.Enabled and wasDisabled then
					wasDisabled = false
					InfiniteFly.ToggleButton(false)
				end
			until not AutoDip.Enabled
		else
			InfiniteFly.ToggleButton(false)
		end
	end,
})

local AltDetectorcon
AltDetector = Player.NewButton({
	Name = "AltDetector",
	Function = function(callback)
		if callback then
			AltDetectorcon = game.Players.PlayerAdded:Connect(function(plr)
				if plr.AccountAge < 16 then
                    	label = Instance.new("TextLabel",ScreenGui)

	label.Text = plr.Name .. " is an alt account."
	label.BackgroundColor3 = Color3.fromRGB(0,0,0)
	label.BorderSizePixel = 0
	label.TextColor3 = Color3.fromRGB(155,39,45)
	label.BackgroundTransparency = 1
	label.Size = UDim2.fromScale(0.335,0.105)
	label.Position = UDim2.fromScale(-0.005,0.04)
	label.TextScaled = true
	label.Name = "Alt"
    label.ZIndex = 0
    local stroke = Instance.new("UIStroke",label)

					print(plr.Name .. " is an alt account.")
                    task.wait(3)
                    label:Destroy()
				end
			end)
		else
			pcall(function()
				AltDetectorcon:Disconnect()
			end)
		end
	end,
})

local function getGroupRank(plr:Player)
	return plr:GetRankInGroup(5774246)
end
 
local staffdetectorcon
StaffDetector = Player.NewButton({
	Name = "StaffDetector",
	Function = function(callback)
		if callback then
			task.wait(10)

			staffdetectorcon = game.Players.PlayerAdded:Connect(function(plr)

				if getGroupRank(plr) > 10 then
					writefile("Staff_Detection_GroupID", plr.Name)
					newChat("/lobby")
				end
			end)
		else
			pcall(function()
				staffdetectorcon:Disconnect()
			end)
		end
	end,
})

local TrollageConnection
RemoteTrollage = Exploit.NewButton({
	Name = "RemoteTrollage",
	Function = function(callback)
		if callback then
           task.spawn(function()
              TrollageConnection = RunService.Heartbeat:Connect(function()
                    task.wait()
                    if DragonSound.Enabled then
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.DragonBreath:FireServer("")
                end
                    if PartyPopper.Enabled then
                        game:GetService("ReplicatedStorage")["events-@easy-games/game-core:shared/game-core-networking@getEvents.Events"].useAbility:FireServer("PARTY_POPPER")
                    end
                    if YuziDash.Enabled then
                        game:GetService("ReplicatedStorage"):FindFirstChild("events-@easy-games/game-core:shared/game-core-networking@getEvents.Events").useAbility:FireServer("dash")
                    end
                end)
            end)
		else
            pcall(function()
                if TrollageConnection then
                    TrollageConnection:Disconnect()
                    TrollageConnection = nil
                end
           end)
     end
	end,
})
DragonSound = RemoteTrollage.NewToggle({
	Name = "DragonBreath",
	Function = function() end
})
PartyPopper = RemoteTrollage.NewToggle({
	Name = "PartyPopper",
	Function = function() end
})
YuziDash = RemoteTrollage.NewToggle({
	Name = "YuziDash",
	Function = function() end
})

local lastHP = 100
DamageBoost = Motion.NewButton({
	Name = "DamageBoost",
	Function = function(callback)
		if callback then
			repeat

				if (hurttime <= 50) then
					PrimaryPart.CFrame += Humanoid.MoveDirection * 0.26
				end

				lastHP = Humanoid.Health
				task.wait()
			until not DamageBoost.Enabled
		end
	end,
})

local lastHPHurt = 100
task.spawn(function()
	repeat task.wait()
		if (Humanoid.Health < lastHPHurt) then
			hurttime = 0
		end

		lastHPHurt = Humanoid.Health
		hurttime += 1
	until false
end)

local chests = {}
for i,v in pairs(workspace:GetChildren()) do
	if v.Name == "chest" then
		table.insert(chests,v)
	end
end
Stealer = Player.NewButton({
	Name = "Stealer",
	Function = function(callback)
		if callback then
			task.spawn(function()
				repeat task.wait()
					task.wait(0.075)
					task.spawn(function()
						for i, v in pairs(chests) do
							local Magnitude = (v.Position - PrimaryPart.Position).Magnitude
							if Magnitude <= 30 then
								for _, item in pairs(v.ChestFolderValue.Value:GetChildren()) do
									if item:IsA("Accessory") then
										task.wait()
										game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("Inventory/ChestGetItem"):InvokeServer(v.ChestFolderValue.Value, item)
									end
								end
							end
						end
					end)
				until not Stealer.Enabled
			end)
		end
	end,
})


local newfire
local newsparkles
Playereffects = Visuals.NewButton({
	Name = "Playereffects",
	Function = function(callback)
		if callback then
			task.wait(1)
			if EffectsStyle.Option == "Fire" then
				newfire = Instance.new("Fire", PrimaryPart)
				newfire.Size = 5.5
				newfire.Heat = 5
				newfire.TimeScale = 1
				newfire.Color = library.Color
				newfire.Enabled = true
				newfire.SecondaryColor = Color3.fromRGB(50,50,50)
			end

			if EffectsStyle.Option == "Sparkles" then
				newsparkles = Instance.new("Sparkles", PrimaryPart)
				newsparkles.TimeScale = 1
				newsparkles.SparkleColor = library.Color
				newsparkles.Enabled = true
			end

		else
			pcall(function()
				newfire:Remove()
			end)
			pcall(function()
				newsparkles:Remove()
			end)
		end
	end,
})
EffectsStyle = Playereffects.NewPicker({
	Name = "Style",
	Options = {"Fire", "Sparkles"}
})

HighJump = Motion.NewButton({
	Name = "HighJump",
	Function = function(callback)
		if callback then
			for i = 1, 44 do
				if not HighJump.Enabled then return end
				PrimaryPart.Velocity += Vector3.new(0, 45, 0)
				task.wait(0.2)
			end
			HighJump.ToggleButton(false)
		else
			PrimaryPart.Velocity = Vector3.new(0, 50, 0)
		end
	end,
})

local CameraModificationCon
local oldFOV = CurrentCamera.FieldOfView
Camera = Visuals.NewButton({
	Name = "Camera",
	Function = function(callback)
		if callback then
			CameraModificationCon = RunService.Heartbeat:Connect(function()
				CurrentCamera.FieldOfView = 120
			end)
            if CameraZoom.Enabled then
                game.Players.LocalPlayer.CameraMaxZoomDistance = CameraZoom.Value
            else
                game.Players.LocalPlayer.CameraMaxZoomDistance = 13
            end
		else
			CameraModificationCon:Disconnect()
			CurrentCamera.FieldOfView = oldFOV
		end
	end,
})
CameraZoom = Camera.NewToggle({
	Name = "CameraZoom",
	Function = function() end
})

TexturePack = Visuals.NewButton({
	Name = "TexturePack",
	Function = function(callback)
		local func
		if callback then
			task.spawn(function()
				local objs = game:GetObjects("rbxassetid://14033898270")
				local import = objs[1]
				import.Parent = ReplicatedStorage
				local index = {
					{
						name = "wood_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
						model = import:WaitForChild("Wood_Sword"),
					},	
					{
						name = "stone_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
						model = import:WaitForChild("Stone_Sword"),
					},
					{
						name = "iron_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
						model = import:WaitForChild("Iron_Sword"),
					},
					{
						name = "diamond_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
						model = import:WaitForChild("Diamond_Sword"),
					},
					{
						name = "emerald_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
						model = import:WaitForChild("Emerald_Sword"),
					},
					{
						name = "wood_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
						model = import:WaitForChild("Wood_Pickaxe"),
					},
					{
						name = "stone_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
						model = import:WaitForChild("Stone_Pickaxe"),
					},
					{
						name = "iron_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
						model = import:WaitForChild("Iron_Pickaxe"),
					},
					{
						name = "diamond_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(80), math.rad(-95)),
						model = import:WaitForChild("Diamond_Pickaxe"),
					},	
					{
						name = "wood_axe",
						offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
						model = import:WaitForChild("Wood_Axe"),
					},	
					{
						name = "stone_axe",
						offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
						model = import:WaitForChild("Stone_Axe"),
					},	
					{
						name = "iron_axe",
						offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
						model = import:WaitForChild("Iron_Axe"),
					},	
					{
						name = "diamond_axe",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(-95)),
						model = import:WaitForChild("Diamond_Axe"),
					},	
					{
						name = "fireball",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
						model = import:WaitForChild("Fireball"),
					},	
					{
						name = "telepearl",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
						model = import:WaitForChild("Telepearl"),
					},
				}
				func = CurrentCamera.Viewmodel.ChildAdded:Connect(function(tool)	
					if not tool:IsA("Accessory") then return end	
					for _, v in ipairs(index) do	
						if v.name == tool.Name then		
							for _, part in ipairs(tool:GetDescendants()) do
								if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
									part.Transparency = 1
								end			
							end		
							local model = v.model:Clone()
							model.CFrame = tool:WaitForChild("Handle").CFrame * v.offset
							model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
							model.Parent = tool			
							local weld = Instance.new("WeldConstraint", model)
							weld.Part0 = model
							weld.Part1 = tool:WaitForChild("Handle")			
							local tool2 = Players.LocalPlayer.Character:WaitForChild(tool.Name)			
							for _, part in ipairs(tool2:GetDescendants()) do
								if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
									part.Transparency = 1				
								end			
							end			
							local model2 = v.model:Clone()
							model2.Anchored = false
							model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
							model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
							if v.name:match("sword") or v.name:match("blade") then
								model2.CFrame *= CFrame.new(.5, 0, -1.1) - Vector3.new(0, 0, -.3)
							elseif v.name:match("axe") and not v.name:match("pickaxe") and v.name:match("diamond") then
								model2.CFrame *= CFrame.new(.08, 0, -1.1) - Vector3.new(0, 0, -.9)
							elseif v.name:match("axe") and not v.name:match("pickaxe") and not v.name:match("diamond") then
								model2.CFrame *= CFrame.new(-.2, 0, -2.4) + Vector3.new(0, 0, 2.12)
							else
								model2.CFrame *= CFrame.new(.2, 0, -.09)
							end
							model2.Parent = tool2
							local weld2 = Instance.new("WeldConstraint", model)
							weld2.Part0 = model2
							weld2.Part1 = tool2:WaitForChild("Handle")
						end
					end
				end)
			end)
		else
			pcall(function()
				func:Disconnect()
			end)
		end
	end,
})
TxtpackMode = TexturePack.NewPicker({
	Name = "Mode",
	Options = {"64x"}
})

local DisablerConnection = nil
local lplr = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local humanoid = lplr.Character and lplr.Character:FindFirstChildOfClass("Humanoid")
lplr.CharacterAdded:Connect(function(character)
task.wait(.2)
Character = character
    PrimaryPart = character.PrimaryPart
    Humanoid =  character:FindFirstChildOfClass("Humanoid")
    humanoid = character:FindFirstChildOfClass("Humanoid")
    character.ChildAdded:Connect(function(child)
        if child:IsA("Humanoid") then
            humanoid = child
        end
    end)
end)

Disabler = Exploit.NewButton({
    Name = "Disabler",
    Function = function(callback)
        if callback then
            task.spawn(function()
                DisablerConnection = RunService.Heartbeat:Connect(function()
                    if humanoid then
                        if DisablerMethod.Option == "State" then
                            humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                            humanoid:ChangeState(Enum.HumanoidStateType.Running)
                            humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                            humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                        elseif DisablerMethod.Option == "State2" then
                            humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                            humanoid:ChangeState(Enum.HumanoidStateType.Seated)
                            humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                            humanoid:ChangeState(Enum.HumanoidStateType.Running)
                            humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                            humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
                            humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                            humanoid:ChangeState(Enum.HumanoidStateType.Running)
                        elseif DisablerMethod.Option == "State3" then
                            humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                            task.wait(0.025)
                            humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                        end
                    end
                end)
            end)
        else
            if DisablerConnection then
                DisablerConnection:Disconnect()
                DisablerConnection = nil
            end
        end
    end,
})
DisablerMethod = Disabler.NewPicker({
    Name = "StateBypassMethod",
    Options = {"State", "State2", "State3"}
})

local plr = game.Players.LocalPlayer
local humanoid = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
local AnimPacks = Player.NewButton({
    Name = "AnimationPack",
    Function = function(callback)
        if callback then
            task.spawn(function()     
                    if humanoid then
                        if Animation.Option == "Vampire" then
                         	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
    
                            elseif Animation.Option == "Toy" then
                                	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
    elseif Animation.Option == "Levitation" then
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
        elseif Animation.Option == "Ninja" then
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
    elseif Animation.Option == "Mage" then
        	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
    elseif Animation.Option == "Pirate" then
        	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
    elseif Animation.Option == "Elderly" then
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
                                end
                            end
                    
                    end)
                    end
                    
            end,
})
Animation = AnimPacks.NewPicker({
    Name = "Animation",
    Options = {"Vampire","Toy","Levitation","Ninja","Mage","Pirate","Elderly"}
})

local animtab = {
	Size = function(newpart)
		TweenService:Create(newpart, TweenInfo.new(1), {
			Size = Vector3.new(0,0,0)
		}):Play()
	end,
	YPos = function(newpart)
		TweenService:Create(newpart, TweenInfo.new(1), {
			CFrame = CFrame.new(newpart.CFrame.X,-10,newpart.CFrame.Z)
		}):Play()
	end,
	Transparency = function(newpart)
		TweenService:Create(newpart, TweenInfo.new(1), {
			Transparency = 1
		}):Play()
	end
}
Trails = Visuals.NewButton({
	Name = "Trails",
	Function = function(callback)
		if callback then
			spawn(function()
				repeat
					spawn(function()
						local newpart = Instance.new("Part", workspace)
						newpart.Shape = Enum.PartType[TrailsPart.Option]
						newpart.Material = Enum.Material[TrailsMaterial.Option]
						newpart.Size = Vector3.new(.65,.65,.65)
						newpart.Anchored = true
						newpart.CanCollide = false
						newpart.CFrame = PrimaryPart.CFrame
						newpart.Rotation = PrimaryPart.Rotation
						newpart.Color = library.Color
						task.delay(1.5, function()
							animtab[TrailsTweenMode.Option](newpart)
							task.delay(1, function()
								newpart:Remove()
							end)
						end)
					end)
					task.wait(.15)
				until not Trails.Enabled
			end)
		end
	end,
})
TrailsPart = Trails.NewPicker({
	Name = "Trail Part", 
	Options = {"Ball", "Block", "Cylinder", "Wedge", "CornerWedge"},
	Default = "Ball"
})
TrailsMaterial = Trails.NewPicker({
	Name = "Trail Material",
	Options = {"Neon", "Plastic", "SmoothPlastic", "DiamondPlate"},
	Default = "Neon"
})
TrailsTweenMode = Trails.NewPicker({
	Name = "Trail Delete",
	Options = { "Size", "YPos", "Transparency"},
	Default = "Size"
})

lastPosOnGround = PrimaryPart.CFrame

spawn(function()
	repeat
		if utils.onGround() then
			lastPosOnGround = PrimaryPart.CFrame
		end
		task.wait()
	until false
end)

LongJump = Motion.NewButton({
	Name = "LongJump",
	Keybind = Enum.KeyCode.J,
	Function = function(callback)
		if callback then
			if LongJumpMethod.Option == "Boost" then
				TweenService:Create(PrimaryPart, TweenInfo.new(2.2), {
					CFrame = PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector * 50 + Vector3.new(0, 5, 0)
				}):Play()
				task.delay(0.8, function()
					LongJump.ToggleButton(false)
				end)
			end
			if LongJumpMethod.Option == "Gravity" then
				workspace.Gravity = 5
				task.delay(0.01, function()
					Humanoid:ChangeState(3)
				end)
			end

			if LongJumpMethod.Option == "Test" then
				workspace.Gravity = 16
				if utils.onGround() then
					Humanoid:ChangeState(3)
					for i = 1, 50 do
						PrimaryPart.CFrame = PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector * 0.3
						task.wait()
					end
				end
			end

			if LongJumpMethod.Option == "Kit" then
				ReplicatedStorage:FindFirstChild("events-@easy-games/game-core:shared/game-core-networking@getEvents.Events").useAbility:FireServer("dash")
				workspace.Gravity = 0
				if utils.onGround() then
					for i = 1, 120 do
						PrimaryPart.CFrame += PrimaryPart.CFrame.LookVector * 2
						task.wait()
					end
					workspace.Gravity = 196.2
				end
			end
		else
			workspace.Gravity = 196.2
			task.delay(0.1, function()
				PrimaryPart.Velocity = Vector3.zero
			end)
		end
	end,
})
LongJumpMethod = LongJump.NewPicker({
	Name = "Mode",
	Options = {"Boost", "Gravity", "Kit", "Test"}
})
local box3 = ScreenGui.Motion.Frame.LongJump.DropDown.KeybindBox
box3.Visible = true
box3.Text = config.Keybinds.LongJump
box3.Changed:Connect(function()
if box3.Text ~= nil then
    local uptext = box3.Text:upper()
    box3.Text = uptext
  library.Modules.LongJump.Keybind = Enum.KeyCode[box3.Text]
end
end)



BridgeInstant = Exploit.NewButton({
    Name = "BridgeInstaWin",
    Function = function(callback)
        if callback then
            repeat
                task.wait(.1)
                for i,v in workspace:GetDescendants() do
                    if v:IsA('TouchTransmitter') then
                        firetouchinterest(game.Players.LocalPlayer.Character.PrimaryPart, v.Parent, 1)
                    end
                end
                until not BridgeInstant.Enabled
        end
    end,
})


function IsAlive(Player)
	Player = Player or LocalPlayer

	if not Player.Character then return false end
	if not Player.Character:FindFirstChild("Humanoid") then return false end
	if Player.Character:GetAttribute("Health") <= 0 then return false end
	if not Player.Character.PrimaryPart then return false end	

	return true
end	

local function GetServerPosition(Position)
	local X = math.round(Position.X / 3)
	local Y = math.round(Position.Y / 3)
	local Z = math.round(Position.Z / 3)

	return Vector3.new(X, Y, Z)
end

function FindNearestBed(MaxDistance)
	local MaxDistance = MaxDistance or math.huge
	local NearestBed = nil

	for i, v in next, CollectionService:GetTagged("bed")do
		if v:FindFirstChild("Blanket").BrickColor ~= LocalPlayer.Team.TeamColor then			
			if v:GetAttribute("BedShieldEndTime") then 				
				if v:GetAttribute("BedShieldEndTime") < Workspace:GetServerTimeNow() then
					local Distance = (v.Position - LocalPlayer.Character.PrimaryPart.Position).Magnitude

					if Distance < MaxDistance then
						MaxDistance = Distance
						NearestBed = v
					end
				end
			end

			if not v:GetAttribute("BedShieldEndTime") then
				local Distance = (v.Position - LocalPlayer.Character.PrimaryPart.Position).Magnitude

				if Distance < MaxDistance then
					MaxDistance = Distance
					NearestBed = v
				end
			end
		end
	end

	return NearestBed
end

local DamageBlockRemote = game.ReplicatedStorage:WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@easy-games"):WaitForChild("block-engine"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("DamageBlock")
local NearestBedFound = false
local CanSeeNearestBed = false

local function Nuker(NearestBed)
	task.spawn(function()
		if NearestBed then
			NearestBedFound = true

			local NukerRaycastParameters = RaycastParams.new()
			local TargetBlock = nil

			NukerRaycastParameters.FilterType = Enum.RaycastFilterType.Exclude
			NukerRaycastParameters.FilterDescendantsInstances = {LocalPlayer.Character}
			NukerRaycastParameters.IgnoreWater = true

			local RaycastResult = game.Workspace:Raycast(NearestBed.Position + Vector3.new(0, 30, 0), Vector3.new(0, -35, 0), NukerRaycastParameters)

			task.spawn(function()
				if RaycastResult then
					if RaycastResult.Instance then
						TargetBlock = RaycastResult.Instance
					end

					if not RaycastResult.Instance then
						TargetBlock = NearestBed
					end

					DamageBlockRemote:InvokeServer({
						blockRef = {
							blockPosition = GetServerPosition(TargetBlock.Position)
						},

						hitPosition = GetServerPosition(TargetBlock.Position),
						hitNormal = GetServerPosition(TargetBlock.Position)
					})
				end
			end)			

			task.spawn(function()
				local _, Value = CurrentCamera:WorldToScreenPoint(NearestBed.Position)

				CanSeeNearestBed = Value
			end)
		end
	end)
end

Nuke = Exploit.NewButton({
	Name = "BedNuker",
	Function = function(callback)
         task.spawn(function()
            repeat
				task.wait(0.1)

				if IsAlive(LocalPlayer) then
					local NearestBed = FindNearestBed(35) or nil
						if NearestBed then
							Nuker(NearestBed)
						end
				end
            until not Nuke.Enabled
    end)
end
})


function FindNearestPlayer(MaxDistance)
	local NearestPlayerDistance = MaxDistance or math.huge
	local NearestPlayer

	for i, v in next, game:GetService("Players"):GetPlayers() do
		if IsAlive(v) and v ~= LocalPlayer and IsAlive(LocalPlayer) and v.Team ~= LocalPlayer.Team then
			local Distance = (v.Character.PrimaryPart.Position - LocalPlayer.Character.PrimaryPart.Position).Magnitude

			if Distance < NearestPlayerDistance then
				NearestPlayerDistance = Distance
				NearestPlayer = v				
			end
		end
	end

	return NearestPlayer, NearestPlayerDistance
end

local function RecallPlayerTweenToNearestPlayer()
	if IsAlive(LocalPlayer) then
		local NearestPlayer = FindNearestPlayer()

		if NearestPlayer then
			local TweenInformation = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)	
			local PlayerTpTween = TweenService:Create(LocalPlayer.Character.PrimaryPart, TweenInformation, {CFrame = NearestPlayer.Character.PrimaryPart.CFrame + Vector3.new(0, 5, 0)})

			PlayerTpTween:Play()
		end
	end
end

function RecallPlayer()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "C" , false , game)
    
    task.wait(6.3)     
    
    RecallPlayerTweenToNearestPlayer()
end


RecallTp = Combat.NewButton({
	Name = "RecallPlrTP",
	Function = function(callback)
		if callback then
RecallPlayer()
		end
	end,
})
	
FastFall = Misc.NewButton({
	Name = "FastFall",
	Function = function(callback)
		if Character and PrimaryPart then
            if callback then
                if FallMode.Option == "Velocity" then
                    PrimaryPart.Velocity = Vector3.new(0, -999, 0)
                elseif FallMode.Option == "Gravity" then
                    workspace.Gravity = 999
                end
            else
                workspace.Gravity = 196.2
            end
		end
	end,
})
LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    PrimaryPart = newCharacter:WaitForChild("PrimaryPart")
    if not FastFall.Enabled then
        workspace.Gravity = 196.2
    end
end)

LocalPlayer.CharacterRemoving:Connect(function()
    Character = nil
    PrimaryPart = nil
    workspace.Gravity = 196.2
end)

FallMode = FastFall.NewPicker({
    Name = "Mode",
    Options = {"Velocity", "Gravity"}
})


local canjump = true
AntiDeath = Misc.NewButton({
	Name = "AntiDeath",
	Function = function(callback)
		if callback then
			local lastHit = tick()
			local wasDisabled = false
			repeat task.wait()
				local nearest = getNearestPlayer(9e9)
				if Humanoid.Health > 0 and Humanoid.Health < 30 and nearest.Character.Humanoid.Health > Humanoid.Health and canjump == true then
					LocalPlayer.Character.PrimaryPart.Velocity = LocalPlayer.Character.PrimaryPart.Velocity + Vector3.new(0, 300, 0)
                    canjump = false
                    task.wait(6)
                    canjump = true
				end
			until not AntiDeath.Enabled
		end
	end,
})

Uninject = Misc.NewButton({
	Name = "Uninject",
	Function = function(callback)
		if callback then
			ScreenGui:Destroy(library.Modules)
            Uninject.ToggleButton(false)
		end
	end,
})

local oldsky = {
	amb = Lighting.Ambient,
	outdooramb = Lighting.OutdoorAmbient,
}
local AmbienceTable = {
	Purple = Color3.fromRGB(100, 0, 255),
	Blue = Color3.fromRGB(0, 20, 255),
	Green = Color3.fromRGB(0, 255, 30),
	Yellow = Color3.fromRGB(255, 255, 0),
	Orange = Color3.fromRGB(255, 140, 25),
	Red = Color3.fromRGB(255, 0, 0),
	Brown = Color3.fromRGB(120, 40, 15),
}
local ambtableoption = {}
for i,v in pairs(AmbienceTable) do
	table.insert(ambtableoption, i)
end
local dayTime = Lighting.TimeOfDay
Ambience = Visuals.NewButton({
	Name = "Ambience",
	Function = function(callback)
		if callback then
			repeat
				Lighting.Ambient = AmbienceTable[AmbienceStyle.Option]
				Lighting.OutdoorAmbient = AmbienceTable[AmbienceStyle.Option]

				Lighting.TimeOfDay = (AmbienceTime.Option == "Day" and dayTime or "24:00:00")
				task.wait()
			until not Ambience.Enabled
		else
			Lighting.TimeOfDay = dayTime
			Lighting.Ambient = oldsky.amb
			Lighting.OutdoorAmbient = oldsky.outdooramb
		end
	end,
})
AmbienceStyle = Ambience.NewPicker({
	Name = "Style",
	Options = ambtableoption
})
AmbienceTime = Ambience.NewPicker({
	Name = "Time",
	Options = {"Day", "Night"}
})


local assetTable = {
	Sus = "http://www.roblox.com/asset/?id=9145833727",
	Damc = "rbxassetid://16930990336",
	Springs = "rbxassetid://16930908008",
	Xylex = "rbxassetid://16930961099",
	Alsploit = "http://www.roblox.com/asset/?id=12772788813",
	Matrix = "http://www.roblox.com/asset/?id=1412150157",
	Covid = "http://www.roblox.com/asset/?id=8518879821",
	Space = "http://www.roblox.com/asset/?id=2609221356",
	Windows = "http://www.roblox.com/asset/?id=472001646",
	Trol = "http://www.roblox.com/asset/?id=6403436054",
	Cat = "http://www.roblox.com/asset/?id=14841615129",
	Furry = "http://www.roblox.com/asset/?id=14831068996",
}

local stylesofskybox = {}
for i,v in pairs(assetTable) do
	table.insert(stylesofskybox, i)
end

SelfESP = Visuals.NewButton({
	Name = "SelfESP",
	Function = function(callback)
		if callback then
			local e = Instance.new("BillboardGui",LocalPlayer.Character.PrimaryPart)
			local image = Instance.new("ImageLabel",e)
			image.Size = UDim2.fromScale(10,10)
			image.Position = UDim2.fromScale(-3,-4)

			image.BackgroundTransparency = 1
			e.Size = UDim2.fromScale(0.5,0.5)
			e.AlwaysOnTop = true
			e.Name = "nein"

			task.spawn(function()
				repeat task.wait()
					image.Image = assetTable[SelfESPStyle.Option]
				until not SelfESP.Enabled
			end)

		else
			pcall(function()
				LocalPlayer.Character.PrimaryPart.nein:Destroy()
			end)
		end
	end,
})
SelfESPStyle = SelfESP.NewPicker({
	Name = "Style",
	Options = stylesofskybox
})

local toxic = false
Toxic = Misc.NewButton({
	Name = "AutoToxic",
	Function = function(callback)
		if callback then
                toxic = true
            else
            toxic = false
		end
	end,
})

LocalPlayer.leaderstats:FindFirstChild("Kills").Changed:Connect(function()
if toxic == true then
    local msgs = {"Dying in a BLOCK game is sad","Why bother when Essential exists","LOL HOW DO YOU LOSE IN A BED GAME","Essential IS JUST BETTER","IVE NEVER LOST WITH Essential LOL"}
		newChat(msgs[math.random(1,5)])
    end
end)


local sound = Instance.new("Sound")
sound.Volume = 0
sound.Looped = true


Music = Player.NewButton({
	Name = "MusicPlayer",
	Function = function(callback)
		if callback then
            local sound = Instance.new("Sound")
            sound.Volume = 0
            if Loop.Enabled then
                sound.Looped = true
            else
                sound.Looped = false
            end
            local Music = sound:Clone()
            Music.Parent = game.Workspace
            Music.Name = "Music"

            if Song.Option == "Simulator" then
                Music.SoundId = "rbxassetid://1841647093"
                Music:Play()
            elseif Song.Option == "Beat" then
                Music.SoundId = "rbxassetid://1836965951"
                Music:Play()
            elseif Song.Option == "Beat2" then
                Music.SoundId = "rbxassetid://1840843086"      
                Music:Play()        
            elseif Song.Option == "Goofy" then
                Music.SoundId = "rbxassetid://1846332554"
                Music:Play()
            elseif Song.Option == "CrabRave" then
                Music.SoundId = "rbxassetid://5410086218"
                Music:Play()
            elseif Song.Option == "SkibidiRizz" then
                Music.SoundId = "rbxassetid://16190757458"
                Music:Play()
            elseif Song.Option == "Uptown" then
                Music.SoundId = "rbxassetid://1845554017"
                Music:Play()
            elseif Song.Option == "PLAY" then
                Music.SoundId = "rbxassetid://5410085763"
                Music:Play()
            elseif Song.Option == "RainingTacos" then
                Music.SoundId = "rbxassetid://142376088"
                Music:Play()
            end
                
            if Volume.Option == "Low" then 
                Music.Volume = 0.5
            elseif Volume.Option == "Mid" then 
                    Music.Volume = 1.5
            elseif Volume.Option == "High" then 
                Music.Volume = 5
            end
        else
            game.Workspace.Music:Destroy()
        end
	end,
})
Song = Music.NewPicker({
    Name = "Song",
    Options = {"Simulator","Beat","Beat2","Goofy","CrabRave", "SkibidiRizz", "Uptown", "PLAY", "RainingTacos"}
})
Volume = Music.NewPicker({
    Name = "Volume",
    Options = {"Low","Mid","High"}
})
Loop = Music.NewToggle({
	Name = "LoopMusic",
	Function = function() end
})

Godmode = Combat.NewButton({
	Name = "MelodyGodMode",
	Function = function(callback)
		if callback then
            repeat
            task.wait(.1)
local args = {
    [1] = {
        ["healTarget"] = game.Players.LocalPlayer
    }
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("PlayGuitar"):FireServer(unpack(args))
until not Godmode.Enabled
		end
	end,
})



Projectileaura = Combat.NewButton({
	Name = "Projectileaura",
	Function = function(callback)
		if callback then
			task.spawn(function()
				repeat task.wait()
					local target = getNearestPlayer(9e9)
					if target then
						local bows = getAllBows()
						for i,v in pairs(bows) do
							spoofHand(v.Name)
							task.wait()
							if v.Name == "fireball" or v.Name == "snowball" or v.Name == "lasso" then
								if not AllProjectiles.Enabled then continue end
							end
							shoot(v,target.Character.PrimaryPart.Position)
						end
					end
				until not Projectileaura.Enabled
			end)
		else

		end
	end,
})

AllProjectiles = Projectileaura.NewToggle({
	Name = "AllProjectiles",
	Function = function() end
})

local function Buystonesword()
    local args = {
        [1] = {
            ["shopItem"] = {
                ["ignoredByKit"] = {
                    [1] = "barbarian",
                    [2] = "dasher",
                    [3] = "frost_hammer_kit",
                    [4] = "tinker"
                },
                ["itemType"] = "stone_sword",
                ["price"] = 70,
                ["superiorItems"] = {
                    [1] = "iron_sword",
                },
                ["currency"] = "iron",
                ["amount"] = 1,
                ["lockAfterPurchase"] = true,
                ["category"] = "Combat",
                ["disabledInQueue"] = {
                    [1] = "tnt_wars"
                }
            },
            ["shopId"] = "1_item_shop"
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end

local function Buyironsword()
    local args = {
        [1] = {
            ["shopItem"] = {
                ["ignoredByKit"] = {
                    [1] = "barbarian",
                    [2] = "dasher",
                    [3] = "frost_hammer_kit",
                    [4] = "tinker"
                },
                ["itemType"] = "iron_sword",
                ["price"] = 70,
                ["superiorItems"] = {
                    [1] = "diamond_sword",
                },
                ["currency"] = "iron",
                ["amount"] = 1,
                ["lockAfterPurchase"] = true,
                ["category"] = "Combat",
                ["disabledInQueue"] = {
                    [1] = "tnt_wars"
                }
            },
            ["shopId"] = "1_item_shop"
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end

local function BuyDiamondsword()
    local args = {
        [1] = {
            ["shopItem"] = {
                ["ignoredByKit"] = {
                    [1] = "barbarian",
                    [2] = "dasher",
                    [3] = "frost_hammer_kit",
                    [4] = "tinker"
                },
                ["itemType"] = "diamond_sword",
                ["price"] = 70,
                ["superiorItems"] = {
                    [1] = "emerald_sword",
                },
                ["currency"] = "emerald",
                ["amount"] = 1,
                ["lockAfterPurchase"] = true,
                ["category"] = "Combat",
                ["disabledInQueue"] = {
                    [1] = "tnt_wars"
                }
            },
            ["shopId"] = "1_item_shop"
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end

local function BuyleatherArmor()
    local args = {
        [1] = {
            ["shopItem"] = {
                ["lockAfterPurchase"] = true,
                ["itemType"] = "leather_chestplate",
                ["price"] = 50,
                ["customDisplayName"] = "Leather Armor",
                ["superiorItems"] = {
                    [1] = "iron_chestplate"
                },
                ["currency"] = "iron",
                ["amount"] = 1,
                ["category"] = "Combat",
                ["ignoredByKit"] = {
                    [1] = "bigman",
                    [2] = "tinker"
                },
                ["spawnWithItems"] = {
                    [1] = "leather_helmet",
                    [2] = "leather_chestplate",
                    [3] = "leather_boots"
                },
                ["nextTier"] = "iron_chestplate"
            },
            ["shopId"] = "1_item_shop"
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end

local function BuyIronArmor()
    local args = {
        [1] = {
            ["shopItem"] = {
                ["lockAfterPurchase"] = true,
                ["itemType"] = "iron_chestplate",
                ["price"] = 120,
                ["prevTier"] = "leather_chestplate",
                ["customDisplayName"] = "Iron Armor",
                ["currency"] = "iron",
                ["ignoredByKit"] = {
                    [1] = "bigman",
                    [2] = "tinker"
                },
                ["category"] = "Combat",
                ["tiered"] = true,
                ["nextTier"] = "diamond_chestplate",
                ["spawnWithItems"] = {
                    [1] = "iron_helmet",
                    [2] = "iron_chestplate",
                    [3] = "iron_boots"
                },
                ["amount"] = 1
            },
            ["shopId"] = "1_item_shop"
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end

local function BuyDiamondArmor()
    local args = {
        [1] = {
            ["shopItem"] = {
                ["lockAfterPurchase"] = true,
                ["itemType"] = "Diamond_chestplate",
                ["price"] = 8,
                ["customDisplayName"] = "Diamond Armor",
                ["superiorItems"] = {
                    [1] = "iron_chestplate"
                },
                ["currency"] = "iron",
                ["amount"] = 1,
                ["category"] = "Combat",
                ["ignoredByKit"] = {
                    [1] = "bigman",
                    [2] = "tinker"
                },
                ["spawnWithItems"] = {
                    [1] = "diamond_helmet",
                    [2] = "diamond_chestplate",
                    [3] = "diamond_boots"
                },
                ["nextTier"] = "diamond_chestplate"
            },
            ["shopId"] = "1_item_shop"
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end

AutoBuy = Player.NewButton({
	Name = "AutoBuy",
	Function = function(callback)
		if callback then
			task.spawn(function()
				repeat task.wait(0.1)
					if hasItem("wood_sword") then
						Buystonesword()
					end
                    if hasItem("stone_sword") and not hasItem("iron_chestplate") and not hasItem("diamond_chestplate") and not hasItem("emerald_chestplate") then
                        BuyleatherArmor()
                    end
                    if hasItem("leather_chestplate") then
				        BuyIronArmor()
			        end
                    if hasItem("iron_sword") or hasItem("stone_sword") or hasItem("wood_sword") then
				        BuyDiamondsword()
			        end
                    if hasItem("iron_chestplate") then
				        BuyDiamondArmor()
			        end
				until not AutoBuy.Enabled
			end)
		end
	end,
})



local ESPboxes = {}

local function isVisible(targetPos)
    local targetScreenPos, onScreen = CurrentCamera:WorldToScreenPoint(targetPos)
    return onScreen and targetScreenPos.Z > 0
end

local function CreateOutline(Player)
    local BillBoard = Instance.new("BillboardGui")

    BillBoard.Size = UDim2.new(4, 0, 4, 0)
    BillBoard.AlwaysOnTop = true
    BillBoard.Name = "Esp"

    local Frame = Instance.new("Frame")

    Frame.Size = UDim2.new(1, 0, 1.5, 0)
    Frame.Position = UDim2.new(0, 0, -Player.Character.LowerTorso.Size.Y / 2 or -Player.PrimaryPart.Size.Y / 2, 0)
    Frame.BackgroundTransparency = 1

    local Stroke = Instance.new("UIStroke")

    Stroke.Thickness = 2.5
    Stroke.Color = Color3.new(1, 0.666667, 0)
    Stroke.Transparency = 0

    task.spawn(function()
        repeat
            task.wait(0.001)
            Stroke.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        until not Stroke
    end)

    local UICorner = Instance.new("UICorner")

    UICorner.Parent = Frame
    UICorner.CornerRadius = UDim.new(0, 3)

    Stroke.Parent = Frame
    Frame.Parent = BillBoard
    BillBoard.Parent = Player.Character.PrimaryPart

    ESPboxes[Player] = BillBoard
end

local function RemoveOutline(Player)
    if ESPboxes[Player] then
        ESPboxes[Player]:Destroy()
        ESPboxes[Player] = nil
    end
end

local function updateESP()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = player.Character.HumanoidRootPart.Position
            if isVisible(targetPosition) then
                if not ESPboxes[player] then
                    CreateOutline(player)
                end
            else
                RemoveOutline(player)
            end
        else
            RemoveOutline(player)
        end
    end
end

ESP = Visuals.NewButton({
    Name = "BoxESP",
    Function = function(callback)
        if callback then
            RunService:BindToRenderStep("ESPUpdate", Enum.RenderPriority.Camera.Value + 1, updateESP)
        else
            RunService:UnbindFromRenderStep("ESPUpdate")
            for _, player in pairs(game.Players:GetPlayers()) do
                RemoveOutline(player)
            end
        end
    end,
})


AutoUpgradeEra = Player.NewButton({
	Name = "AutoUpgradeEra",
	Function = function(callback)
		if callback then
				repeat task.wait(0.1)
                    local args = {
                        [1] = {
                            ["era"] = "iron_era"
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("RequestPurchaseEra"):InvokeServer(unpack(args))
                    local args = {
                        [1] = {
                            ["era"] = "diamond_era"
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("RequestPurchaseEra"):InvokeServer(unpack(args))

                    local args = {
                        [1] = {
                            ["era"] = "emerald_era"
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("RequestPurchaseEra"):InvokeServer(unpack(args))
				until not AutoUpgradeEra.Enabled
		end
	end,
})



ScytheDisabler = Exploit.NewButton({
    Name = "ScytheDisabler",
    Function = function(callback)
        if callback then
            local Bypassmode = Bypassmode.Value
            task.spawn(function()
                repeat task.wait()
                    if Bypassmode == "Heatseeker" then
                        local args = {
                            [1] = {
                                ["direction"] = Vector3.new(0.46722307801246643, -1.769954627306447e-09, -0.8841394782066345)
                            }
                        }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ScytheDash:FireServer(unpack(args))
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 40

                        task.wait(0.15)
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ScytheDash:FireServer(unpack(args))
                        
                        task.wait(0.15)
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ScytheDash:FireServer(unpack(args))
                        
                        task.wait(0.15)
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ScytheDash:FireServer(unpack(args))
                        
                        task.wait(0.15)
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ScytheDash:FireServer(unpack(args))
                        
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 18.5
                        
                        task.wait(0.175)
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ScytheDash:FireServer(unpack(args))
                        
                        task.wait(0.175)
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ScytheDash:FireServer(unpack(args))
                        
                        task.wait(0.175)
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ScytheDash:FireServer(unpack(args))
                        
                        task.wait(0.175)
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ScytheDash:FireServer(unpack(args))
                    elseif Bypassmode == "CFrame" then
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 28
                        local args = {
                            [1] = {
                                ["direction"] = Vector3.new(0.46722307801246643, -1.769954627306447e-09, -0.8841394782066345)
                            }
                        }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ScytheDash:FireServer(unpack(args))
                    end
                until not ScytheDisabler.Enabled
                resetSpeed()
            end)
        end
    end,
})
Bypassmode = ScytheDisabler.NewPicker({
	Name = "Mode",
	Options = {"Heatseeker", "CFrame"}
})



Fortune = Exploit.NewButton({
    Name = "FortuneExploit",
    Function = function(callback)
        if callback then
            enchanttoggled = callback
            task.spawn(function()
                repeat
                    task.wait(0.1)
                    
                    local cloneref = cloneref or function(data)
                        return data
                    end
                    
                    local getservice = function(service)
                        return cloneref(game:FindService(service))
                    end
                    
                    local getrandomvalue = function(tab)
                        return #tab > 0 and tab[math.random(1, #tab)] or ''
                    end
                    
                    local remote = getservice('ReplicatedStorage'):WaitForChild('rbxts_include'):WaitForChild('node_modules'):WaitForChild('@rbxts'):WaitForChild('net'):WaitForChild('out'):WaitForChild('_NetManaged'):WaitForChild('RequestFortuneCashOut')
                    remote:FireServer({
                        statusEffectType = 'fortune_1',
                        fortuneStacks = getrandomvalue({999999, 9e9})
                    })
                until not Fortune.Enabled
            end)
        else
        end
    end,
})

jellyfishExploit = Exploit.NewButton({
	Name = "jellyfishExploit",
	Function = function(callback)
		if callback then
			task.spawn(function()
				
				repeat task.wait(0.2)
					local args = {
                        [1] = "electrify_jellyfish"
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("events-@easy-games/game-core:shared/game-core-networking@getEvents.Events"):WaitForChild("useAbility"):FireServer(unpack(args))
				until (not jellyfishExploit.Enabled)
			end)
		end
	end,
})

local function teleportToRandomPlayer()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    wait(0.2)

    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local lplr = Players.LocalPlayer

    local function checkHealth()
        repeat
            wait()
        until lplr.Character and lplr.Character:FindFirstChild("Humanoid") and lplr.Character.Humanoid.Health >= 100

        local availablePlayers = {}

        for _, player in pairs(Players:GetPlayers()) do
            if player.TeamColor ~= lplr.TeamColor then
                table.insert(availablePlayers, player)
            end
        end

        if #availablePlayers > 0 then
            local selectedPlayer = availablePlayers[math.random(1, #availablePlayers)]
            local part = selectedPlayer.Character.PrimaryPart
            local duration = 0.4 

            local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
            local tween = TweenService:Create(lplr.Character.PrimaryPart, tweenInfo, {CFrame = part.CFrame * CFrame.new(0, 5, 0)})
            tween:Play()
            tween.Completed:Wait()
        else
        end
    end

    checkHealth()
end


DeathPlayerTp = Combat.NewButton({
    Name = "DeathPlayerTp",
    Function = function(callback)
        if callback then
            
            task.spawn(function()
                    task.wait()

                    teleportToRandomPlayer()
            end)
        else   
        end
    end,
})

BlockingAnimation = Visuals.NewButton({
	Name = "BlockingAnimation",
	Function = function(callback)
		if callback then
			LocalPlayer:GetMouse().Button2Down:Connect(function()
				viewmodel.C0 = oldweld * CFrame.new(0.7, -0.4, 0.1) * CFrame.Angles(math.rad(-65), math.rad(55), math.rad(-50))
			end)
			LocalPlayer:GetMouse().Button2Up:Connect(function()
				viewmodel.C0 = oldweld
			end)
		end
	end,
})

local swingAnim2
local auraConnection2
local targetInfo = Instance.new("TextLabel",ScreenGui)
SemiAura = Legit.NewButton({
	Name = "SilentAura",
	Function = function(callback)
		if callback then
            auraConnection2 = RunService.Heartbeat:Connect(function()
                local nearest = getNearestPlayer(12)

                if nearest ~= nil then
                    local nearestCharacter = nearest.Character
                    local nearestPrimaryPartPosition = nearestCharacter.PrimaryPart.Position
                    local selfPrimaryPartPosition = PrimaryPart.Position
                    local weapon = getBestWeapon()
                    
                    if ToolCheck.Enabled then
                        print('enabled 🤑')
                    else
                        spoofHand(weapon.Name)
                    end

                    task.spawn(function()
                        for i = 1, 1 do
                            AuraRemote:FireServer({
                                chargedAttack = {
                                    chargeRatio = 0
                                },
                                entityInstance = nearestCharacter,
                                validate = {
                                    raycast = {
                                        cameraPosition = CurrentCamera,
                                        cursorDirection = CFrame.LookVector
                                    },
                                    targetPosition = {
                                        value = nearestPrimaryPartPosition
                                    },
                                    selfPosition = {
                                        value = selfPrimaryPartPosition
                                    },
                                },
                                weapon = weapon
                            })
                        end
                    end)
                end
            end)

			task.spawn(function()
				repeat task.wait(.5)
					if getNearestPlayer(12) ~= nil then
						pcall(function()
							local animation = auraAnimations[auraAnimation.Option]
							local allTime = 0
							task.spawn(function()
								if CustomAnimation.Enabled then
									animRunning = true
									for i,v in pairs(animation) do allTime += v.Timer end
									for i,v in pairs(animation) do
										local tween = game.TweenService:Create(viewmodel,TweenInfo.new(v.Timer),{C0 = oldweld * v.CFrame})
										tween:Play()
										task.wait(v.Timer - 0)
									end
									animRunning = false
									game.TweenService:Create(viewmodel,TweenInfo.new(1),{C0 = oldweld}):Play()
								end
							end)
							task.wait(allTime)
						end)
					end
				until (not Killaura.Enabled)
			end)

			task.spawn(function()
				repeat
					local nearest = getNearestPlayer(12)

					if nearest ~= nil then
						local isWinning = function()
							return nearest.Character.Humanoid.Health > Humanoid.Health
						end

						if targetInfo == nil then
							targetInfo = Instance.new("TextLabel",ScreenGui)
						end

						if TargetHudMode.Option == "Basic" then
							pcall(function()
								targetInfo.Size = UDim2.fromScale(.12, .05)
								targetInfo.BackgroundColor3 = Color3.fromRGB(25,25,25)
								targetInfo.BorderSizePixel = 0
								targetInfo.AnchorPoint = Vector2.new(0.5,0.5)
								targetInfo.Position = UDim2.fromScale(0.6,0.5)
								targetInfo.TextColor3 = Color3.fromRGB(255,255,255)
								targetInfo.Text = "  "..nearest.DisplayName.. " - IsWinning: ".. tostring(isWinning())
								targetInfo.TextXAlignment = Enum.TextXAlignment.Left

								local hp = Instance.new("Frame", targetInfo)
								hp.Position = UDim2.fromScale(0, .9)
								hp.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
								hp.BorderSizePixel = 0
								
								TweenService:Create(hp,TweenInfo.new(1),{
									Size = UDim2.fromScale(0.01 * nearest.Character.Humanoid.Health,0.1)
								}):Play()
							end)	
						end

						if TargetHudMode.Option == "Basic2" then
							pcall(function()
								TweenService:Create(targetInfo,TweenInfo.new(1),{
									Size = UDim2.fromScale(0.001 * nearest.Character.Humanoid.Health,0.04)
								}):Play()
								targetInfo.BackgroundColor3 = library.Color
								targetInfo.BorderSizePixel = 0
								targetInfo.AnchorPoint = Vector2.new(0.5,0.5)
								targetInfo.Position = UDim2.fromScale(0.6,0.5)
								targetInfo.TextColor3 = Color3.fromRGB(255,255,255)
								targetInfo.Text = "  "..nearest.DisplayName
								targetInfo.TextScaled = true
								targetInfo.TextXAlignment = Enum.TextXAlignment.Left
							end)	
						end

					else
						pcall(function()
							targetInfo:Remove()

							targetInfo = nil
						end)
					end
					task.wait()
				until (not SemiAura.Enabled)
			end)
		else
			pcall(function()
				swingAnim2:Destroy()
			end)
			pcall(function()
				auraConnection:Disconnect()
			end)
		end
	end,
})

local animAuraTab = {}
for i,v in pairs(auraAnimations) do table.insert(animAuraTab,i) end

auraAnimation = SemiAura.NewPicker({
	Name = "Animations",
	Options = animAuraTab
})
CustomAnimation = SemiAura.NewToggle({
	Name = "Animations",
	Function = function() end
})
TargetHudMode = SemiAura.NewPicker({
	Name = "TargetHud",
	Options = {"None", "Basic", "Basic2"}
})
ToolCheck = SemiAura.NewToggle({
	Name = "ToolCheck",
	Function = function() end
})

AutoReset = Legit.NewButton({
	Name = "AutoReset",
	Function = function(callback)
		if callback then
            repeat
            task.wait()
            if Speed.Option == "Fast" then
                if game.Players.LocalPlayer.Character.PrimaryPart.CFrame.Y <= 0 then 
                    game.Players.LocalPlayer.Character.Humanoid.Health = 0    
                end
                elseif Speed.Option == "Delayed" then 
                    if game.Players.LocalPlayer.Character.PrimaryPart.CFrame.Y <= -35 then 
                    game.Players.LocalPlayer.Character.Humanoid.Health = 0    
                end   
                end
            until not AutoReset.Enabled
		end
	end,
})
Speed = AutoReset.NewPicker({
	Name = "Speed",
	Options = {"Fast", "Delayed"}
})


function setCameraToPlayer(target)
    local player = game.Players.LocalPlayer
    local camera = game.Workspace.CurrentCamera
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = target.Character.HumanoidRootPart.Position
        camera.CFrame = CFrame.new(camera.CFrame.Position, targetPosition)
    end
end

AimAssist = Combat.NewButton({
	Name = "AimAssist",
    Keybind = Enum.KeyCode.B,
	Function = function(callback)
		if callback then
            task.spawn(function()
                repeat task.wait(0)
                    local Entity = getNearestPlayer(20)
                    if Entity then
                        setCameraToPlayer(Entity)
                    end
                until (not AimAssist.Enabled)
            end)
        end
    end,
})
local box6 = ScreenGui.Combat.Frame.AimAssist.DropDown.KeybindBox
box6.Visible = true
box6.Text = config.Keybinds.AimAssist
box6.Changed:Connect(function()
if box6.Text ~= nil then
    local uptext = box6.Text:upper()
    box6.Text = uptext
  library.Modules.AimAssist.Keybind = Enum.KeyCode[box6.Text]
end
end)


Gravity = Player.NewButton({
	Name = "Gravity",
	Function = function(callback)
		if callback then
            repeat 
            task.wait(2)
            if GravMode.Option == "1" then 
                workspace.Gravity = 120
                elseif GravMode.Option == "2" then 
                workspace.Gravity = 90
                elseif GravMode.Option == "3" then 
                workspace.Gravity = 40
                elseif GravMode.Option == "4" then 
                workspace.Gravity = 250
            end
            until not Gravity.Enabled
            else
            workspace.Gravity = 196.2
        end
    end,
})
GravMode = Gravity.NewPicker({
	Name = "Mode",
	Options = {"1", "2","3","4"}
})
