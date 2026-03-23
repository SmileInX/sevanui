local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local gui = game:GetService("CoreGui")

-- Message de crédit
local creditGui = Instance.new("ScreenGui")
creditGui.Name = "Credit_GUI"
creditGui.Parent = gui

local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(0, 200, 0, 50)
creditLabel.Position = UDim2.new(0.5, -100, 0.5, -25)
creditLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
creditLabel.BackgroundTransparency = 0.3
creditLabel.Text = "By S3van"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.TextScaled = true
creditLabel.Font = Enum.Font.GothamBold
creditLabel.Parent = creditGui

wait(5)
creditGui:Destroy()

-- GUI principale
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TouchV_GUI"
screenGui.Parent = gui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 60, 0, 60)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "V"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.GothamBold
textLabel.Parent = frame

-- Fonction de téléportation
local function teleportNoClip()
    local character = player.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    local currentCFrame = rootPart.CFrame
    local distance = 25
    
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
    
    rootPart.CFrame = currentCFrame + currentCFrame.LookVector * distance
    
    wait(0.5)
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.V then
        teleportNoClip()
    end
end)
