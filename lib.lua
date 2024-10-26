-- minecheat.lib

local MineCheatLib = {}
local Players = game:GetService("Players")

function MineCheatLib:CreateWindow(name, color)
    local window = Instance.new("ScreenGui")
    window.Name = name
    window.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    window.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Hacks = Instance.new("Folder", window)
    Hacks.Name = "Hacks"

    local lol = Instance.new("Frame", Hacks)
    lol.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    lol.BackgroundTransparency = 1
    lol.BorderSizePixel = 0
    lol.Size = UDim2.new(0, 1502, 0, 638)

    local tab1 = Instance.new("Frame", lol)
    tab1.BackgroundColor3 = color or Color3.fromRGB(90, 150, 69)
    tab1.BackgroundTransparency = 0.1
    tab1.BorderSizePixel = 0
    tab1.Position = UDim2.new(0.0479735322, 0, 0.0966666639, 0)
    tab1.Size = UDim2.new(0, 129, 0, 27)

    local TextButton = Instance.new("TextButton", tab1)
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 1
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(0.782945752, 0, 0.0370370373, 0)
    TextButton.Rotation = 270
    TextButton.Size = UDim2.new(0, 28, 0, 26)
    TextButton.Font = Enum.Font.Ubuntu
    TextButton.Text = ">"
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.TextScaled = true
    TextButton.TextSize = 14
    TextButton.TextWrapped = true

    local TextLabel = Instance.new("TextLabel", tab1)
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1
    TextLabel.BorderSizePixel = 0
    TextLabel.Size = UDim2.new(0, 96, 0, 27)
    TextLabel.Font = Enum.Font.Ubuntu
    TextLabel.Text = "tab"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 20
    TextLabel.TextWrapped = true

    local content1 = Instance.new("Frame", tab1)
    content1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    content1.BackgroundTransparency = 0.25
    content1.BorderSizePixel = 0
    content1.Position = UDim2.new(0, 0, 1, 0)
    content1.Size = UDim2.new(0, 129, 0, 28)

    local Frame = Instance.new("Frame", content1)
    Frame.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.970000029, 0, 0.109999999, 0)
    Frame.Size = UDim2.new(0, 2, 0, 22)

    local TextButton_2 = Instance.new("TextButton", Frame)
    TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_2.BackgroundTransparency = 1
    TextButton_2.BorderSizePixel = 0
    TextButton_2.Position = UDim2.new(-59.5, 0, -0.14000009, 0)
    TextButton_2.Size = UDim2.new(0, 121, 0, 28)
    TextButton_2.Font = Enum.Font.Ubuntu
    TextButton_2.Text = "button"
    TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_2.TextSize = 14
    TextButton_2.TextXAlignment = Enum.TextXAlignment.Left

    local content2 = Instance.new("Frame", tab1)
    content2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    content2.BackgroundTransparency = 0.25
    content2.BorderSizePixel = 0
    content2.Position = UDim2.new(0, 0, 2.03703713, 0)
    content2.Size = UDim2.new(0, 129, 0, 28)

    local Frame_2 = Instance.new("Frame", content2)
    Frame_2.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
    Frame_2.BorderSizePixel = 0
    Frame_2.Position = UDim2.new(0.970000029, 0, 0.109999999, 0)
    Frame_2.Size = UDim2.new(0, 2, 0, 22)

    local TextButton_3 = Instance.new("TextButton", Frame_2)
    TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_3.BackgroundTransparency = 1
    TextButton_3.BorderSizePixel = 0
    TextButton_3.Position = UDim2.new(-59.5, 0, -0.14000009, 0)
    TextButton_3.Size = UDim2.new(0, 121, 0, 28)
    TextButton_3.Font = Enum.Font.Ubuntu
    TextButton_3.Text = "button"
    TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_3.TextSize = 14
    TextButton_3.TextXAlignment = Enum.TextXAlignment.Left

    local enabled = 0

    TextButton.MouseButton1Click:Connect(function()
        if enabled == 0 then
            Frame.Visible = false
            Frame_2.Visible = false
            TextButton.Rotation = 90
            enabled = 1
        elseif enabled == 1 then
            Frame.Visible = true
            Frame_2.Visible = true
            TextButton.Rotation = 270
            enabled = 0
        end
    end)

    tab1.Active = true
    tab1.Selectable = true
    tab1.Draggable = true

    return {
        CreateTab = function(name)
            local newTab = Instance.new("Frame", lol)
            newTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            newTab.Size = UDim2.new(0, 200, 0, 100)
            newTab.Name = name
            return newTab
        end,
        CreateButton = function(name)
            local button = Instance.new("TextButton", content1)
            button.Text = name
            return button
        end
    }
end

return MineCheatLib
