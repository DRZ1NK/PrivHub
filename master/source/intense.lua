local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
	Title = "Priv Hud Loaded",
	Text = "To Minimize Press RCtrl ",
	Duration = 5,
})

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local movableFrame = Instance.new("Frame")
movableFrame.Parent = screenGui
movableFrame.Size = UDim2.new(0, 682, 0, 287)
movableFrame.Position = UDim2.new(0.273, 0, 0.234, 0)
movableFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 67)
movableFrame.BackgroundTransparency = 0
movableFrame.BorderSizePixel = 0
movableFrame.Active = true
movableFrame.Draggable = true

local InfoFrame = Instance.new("Frame")
InfoFrame.Parent = screenGui
InfoFrame.Size = UDim2.new(0, 682, 0, 287)
InfoFrame.Position = UDim2.new(0.273, 0, 0.234, 0)
InfoFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 67)
InfoFrame.BackgroundTransparency = 0
InfoFrame.BorderSizePixel = 0

local infoFrame = Instance.new("TextButton")
infoFrame.Parent = movableFrame
infoFrame.Size = UDim2.new(0, 117, 0, 42)
infoFrame.Position = UDim2.new(0.221,0,0.125,0)
infoFrame.Text = "Info"
infoFrame.FontFace.Bold = true
infoFrame.TextScaled = true
infoFrame.TextColor3 = Color3.new(0,0,0)
infoFrame.BackgroundTransparency = 1
infoFrame.Font = Enum.Font.SourceSansBold

local ButtonsFrame = Instance.new("TextButton")
ButtonsFrame.Parent = movableFrame
ButtonsFrame.Size = UDim2.new(0, 117, 0, 42)
ButtonsFrame.Position = UDim2.new(0.016,0,0.125,0)
ButtonsFrame.Text = "Buttons"
ButtonsFrame.FontFace.Bold = true
ButtonsFrame.TextScaled = true
ButtonsFrame.TextColor3 = Color3.new(0,0,0)
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.Font = Enum.Font.SourceSansBold

local ClosingText = Instance.new("TextButton")
ClosingText.Parent = movableFrame
ClosingText.Position = UDim2.new(0.939,0,0.031,0)
ClosingText.Name = "Close"
ClosingText.Text = "X"
ClosingText.Size = UDim2.new(0, 29,0, 27)
ClosingText.TextScaled = true
ClosingText.BackgroundTransparency = 1
ClosingText.TextColor3 = Color3.new(0,0,0)

ClosingText.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

local NameText = Instance.new("TextLabel")
NameText.Parent = movableFrame
NameText.BackgroundTransparency = 1
NameText.Position = UDim2.new(0.016, 0, 0.02, 0)
NameText.Size = UDim2.new(0, 619, 0, 34)
NameText.Text = "Priv Hub"
NameText.BorderSizePixel = 0
NameText.FontFace.Bold = true
NameText.TextScaled = true
NameText.TextColor3 = Color3.new(0,0,0)
NameText.Font = Enum.Font.SourceSansBold
NameText.TextXAlignment = Enum.TextXAlignment.Left

local IntroText = Instance.new("TextLabel")
IntroText.Text = "Priv Hub"
IntroText.Name = "introText"
IntroText.AnchorPoint = Vector2.new(0.5, 0.5)
IntroText.Position = UDim2.new(0.5, 0, 0.3, 0)
IntroText.Parent = screenGui
IntroText.TextSize = 16
IntroText.TextColor3 = Color3.fromRGB(0, 32, 95)

local InfiteYeild = Instance.new("TextButton")
InfiteYeild.Parent = movableFrame
InfiteYeild.Position = UDim2.new(0.016,0,0.316,0)
InfiteYeild.Size = UDim2.new(0,83,0,34)
InfiteYeild.Font = Enum.Font.SourceSansBold
InfiteYeild.FontFace.Bold = true
InfiteYeild.TextScaled = true
InfiteYeild.Text = "IY"
InfiteYeild.TextColor3 = Color3.new(0,0,0)

UserInputService.InputBegan:Connect(function(gameProcessedEvent)
	if gameProcessedEvent.KeyCode == Enum.KeyCode.RightControl then
		if screenGui.Enabled == true then
			screenGui.Enabled = false
		else
			screenGui.Enabled = true
		end
	end
end)

local frameAA = screenGui.Frame
local introText = screenGui.introText

local TextPos = screenGui.Frame
local startPosition = TextPos.Position
local endYScale = 0.5

frameAA.Visible = false
introText.TextTransparency = 1

local textFadeInInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local textFadeInGoal = {
	Position = UDim2.new(0.5, startPosition.X.Offset, endYScale, startPosition.Y.Offset),
	TextTransparency = 0
}
local textFadeIn = TweenService:Create(introText, textFadeInInfo, textFadeInGoal)

local textFadeOutInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local textFadeOutGoal = {
	TextTransparency = 1
}
local textFadeOut = TweenService:Create(introText, textFadeOutInfo, textFadeOutGoal)

local frameFadeInInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local frameFadeInGoal = {
	Visible = true,
	BackgroundTransparency = 0
}
local frameFadeIn = TweenService:Create(frameAA, frameFadeInInfo, frameFadeInGoal)

textFadeIn:Play()

textFadeIn.Completed:Connect(function()
	wait(2)
	textFadeOut:Play()
	textFadeOut.Completed:Connect(function()
		wait(1)
		frameFadeIn:Play()
	end)
end)

InfiteYeild.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
