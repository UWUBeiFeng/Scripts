-- Gui to Lua
-- Version: 3.2

-- Instances:

local BeiFengCenterFollow = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local Close = Instance.new("ImageButton")
local Minimize = Instance.new("ImageButton")
local Content = Instance.new("Frame")
local Cancel = Instance.new("TextButton")
local Start = Instance.new("TextButton")
local UserName = Instance.new("TextBox")

--Properties:

BeiFengCenterFollow.Name = "BeiFengCenterFollow"
BeiFengCenterFollow.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Main.Name = "Main"
Main.Parent = BeiFengCenterFollow
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 1.000
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 260, 0, 250)

TopBar.Name = "TopBar"
TopBar.Parent = Main
TopBar.AnchorPoint = Vector2.new(0.5, 0.5)
TopBar.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0.5, 0, 0.100000001, 0)
TopBar.Size = UDim2.new(0, 260, 0, 48)

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 173, 0, 48)
Title.Font = Enum.Font.Ubuntu
Title.Text = "北风-跟踪玩家"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 28.000

UIPadding.Parent = Title
UIPadding.PaddingBottom = UDim.new(0, 2)

Close.Name = "Close"
Close.Parent = TopBar
Close.AnchorPoint = Vector2.new(1, 0)
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(1.00384617, -12, 0.00800000038, 12)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Image = "rbxassetid://7072725342"

Minimize.Name = "Minimize"
Minimize.Parent = TopBar
Minimize.AnchorPoint = Vector2.new(1, 0)
Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minimize.BackgroundTransparency = 1.000
Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.88846153, -12, 0.00800000038, 12)
Minimize.Size = UDim2.new(0, 20, 0, 20)
Minimize.Image = "rbxassetid://7072719338"

Content.Name = "Content"
Content.Parent = Main
Content.AnchorPoint = Vector2.new(0.5, 0.5)
Content.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
Content.BorderSizePixel = 0
Content.Position = UDim2.new(0.5, 0, 0.55084151, 0)
Content.Size = UDim2.new(0, 260, 0, 202)

Cancel.Name = "Cancel"
Cancel.Parent = Content
Cancel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Cancel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Cancel.BorderSizePixel = 0
Cancel.Position = UDim2.new(0.246153846, 0, 0.653742552, 0)
Cancel.Size = UDim2.new(0, 131, 0, 43)
Cancel.Font = Enum.Font.SourceSans
Cancel.Text = "取消追踪"
Cancel.TextColor3 = Color3.fromRGB(255, 255, 255)
Cancel.TextSize = 24.000

Start.Name = "Start"
Start.Parent = Content
Start.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Start.BorderColor3 = Color3.fromRGB(0, 0, 0)
Start.BorderSizePixel = 0
Start.Position = UDim2.new(0.246153846, 0, 0.390138537, 0)
Start.Size = UDim2.new(0, 131, 0, 43)
Start.Font = Enum.Font.SourceSans
Start.Text = "开始追踪"
Start.TextColor3 = Color3.fromRGB(255, 255, 255)
Start.TextSize = 24.000

UserName.Name = "UserName"
UserName.Parent = Content
UserName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UserName.BorderColor3 = Color3.fromRGB(0, 0, 0)
UserName.BorderSizePixel = 0
UserName.Position = UDim2.new(0, 40, 0, 14)
UserName.Size = UDim2.new(0, 190, 0, 45)
UserName.Font = Enum.Font.Sarpanch
UserName.Text = ""
UserName.TextColor3 = Color3.fromRGB(0, 0, 0)
UserName.TextScaled = true
UserName.TextSize = 28.000
UserName.TextWrapped = true

local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Main.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

Close.MouseButton1Click:Connect(function()
	BeiFengCenterFollow:Destroy()
end)

local Mini = false

Minimize.MouseButton1Click:Connect(function()
	Mini = not Mini
	if not Mini then
		Minimize.Image = "rbxassetid://7072720870"
	else
		Minimize.Image = "rbxassetid://7072719338"
	end
	Content.Visible = Mini
end)

Start.MouseButton1Click:Connect(function()
	game.RunService.Stepped:Connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
			game.Players[UserName.Text].Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
	end)
end)

Cancel.MouseButton1Click:Connect(function()
	UserName.Text = ""
end)
