-- minecheat.lib

local MineCheatLib = {}
local Tabs = {}

function MineCheatLib:CreateLib(windowName, windowColor)
    local minecheats = Instance.new("ScreenGui")
    local Hacks = Instance.new("Folder")
    local lol = Instance.new("Frame")

    -- Properties
    minecheats.Name = "minecheats"
    minecheats.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    minecheats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Hacks.Name = "Hacks"
    Hacks.Parent = minecheats

    lol.Name = "lol"
    lol.Parent = Hacks
    lol.BackgroundColor3 = windowColor or Color3.fromRGB(90, 150, 69)
    lol.BackgroundTransparency = 1.000
    lol.BorderColor3 = Color3.fromRGB(0, 0, 0)
    lol.Size = UDim2.new(0, 1502, 0, 638)

    return { AddTab = function(self, tabName)
        return self:CreateTab(tabName, lol)
    end }
end

function MineCheatLib:CreateTab(tabName, parentFrame)
    local tab = Instance.new("Frame")
    local TextButton = Instance.new("TextButton")
    local TextLabel = Instance.new("TextLabel")
    local content = Instance.new("Frame")
    
    tab.Name = tabName
    tab.Parent = parentFrame
    tab.BackgroundColor3 = Color3.fromRGB(90, 150, 69)
    tab.BackgroundTransparency = 0.100
    tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tab.Size = UDim2.new(0, 129, 0, 27)

    TextButton.Parent = tab
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 1.000
    TextButton.Position = UDim2.new(0.782945752, 0, 0.0370370373, 0)
    TextButton.Rotation = 270.000
    TextButton.Size = UDim2.new(0, 28, 0, 26)
    TextButton.Font = Enum.Font.Ubuntu
    TextButton.Text = ">"
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.TextScaled = true
    TextButton.TextSize = 14.000

    TextLabel.Parent = tab
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 96, 0, 27)
    TextLabel.Font = Enum.Font.Ubuntu
    TextLabel.Text = tabName
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 20.000

    content.Name = "content"
    content.Parent = tab
    content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    content.BackgroundTransparency = 0.250
    content.Position = UDim2.new(0, 0, 1, 0)
    content.Size = UDim2.new(1, 0, 0, 0)

    local frame1 = Instance.new("Frame", content)
    frame1.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
    frame1.Size = UDim2.new(0, 2, 0, 22)
    frame1.Position = UDim2.new(0.970000029, 0, 0.109999999, 0)

    local button1 = Instance.new("TextButton", frame1)
    button1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button1.BackgroundTransparency = 1.000
    button1.Size = UDim2.new(0, 121, 0, 28)
    button1.Font = Enum.Font.Ubuntu
    button1.Text = "button"
    button1.TextColor3 = Color3.fromRGB(255, 255, 255)
    button1.TextSize = 14.000

    -- Toggle visibility script
    local enabled = false
    TextButton.MouseButton1Click:Connect(function()
        enabled = not enabled
        content.Visible = enabled
        TextButton.Rotation = enabled and 90 or 270
    end)

    return { AddButton = function(self, buttonText)
        local newButton = Instance.new("TextButton", content)
        newButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        newButton.BackgroundTransparency = 1.000
        newButton.Size = UDim2.new(1, 0, 0, 28)
        newButton.Font = Enum.Font.Ubuntu
        newButton.Text = buttonText
        newButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        newButton.TextSize = 14.000

        return newButton
    end }
end

return MineCheatLib
