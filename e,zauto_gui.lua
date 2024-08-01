local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")


local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local OwnerLabel = Instance.new("TextLabel") 

ScreenGui.Name = "AutoClickerGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 203, 219)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 200, 0, 130)

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = Frame
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
ToggleButton.Position = UDim2.new(0.1, 0, 0.4, 0) 
ToggleButton.Size = UDim2.new(0, 160, 0, 80)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = "Auto Clicker: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 20


OwnerLabel.Name = "OwnerLabel"
OwnerLabel.Parent = Frame
OwnerLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
OwnerLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
OwnerLabel.Size = UDim2.new(0, 160, 0, 30)
OwnerLabel.Font = Enum.Font.SourceSansBold
OwnerLabel.Text = "My Owner: Thememis"
OwnerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
OwnerLabel.TextSize = 18
OwnerLabel.TextWrapped = true
OwnerLabel.TextScaled = true


local isAutoClickerOn = false
local clickInterval = 1/30 


local function pressKey(key)
    keypress(key)
    wait(0.01)
    keyrelease(key)
end


ToggleButton.MouseButton1Click:Connect(function()
    isAutoClickerOn = not isAutoClickerOn
    if isAutoClickerOn then
        ToggleButton.Text = "Auto Clicker: ON"
    else
        ToggleButton.Text = "Auto Clicker: OFF"
    end
end)


RunService.RenderStepped:Connect(function()
    if isAutoClickerOn then
        pressKey(Enum.KeyCode.E)
        pressKey(Enum.KeyCode.Z)
        wait(clickInterval)
    end
end)
