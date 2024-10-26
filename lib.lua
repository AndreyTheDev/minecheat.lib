-- minecheat.lib

local MineCheatLib = {}
MineCheatLib.__index = MineCheatLib

function MineCheatLib:CreateLib(name, color)
    local window = Instance.new("ScreenGui")
    window.Name = "window"
    window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    window.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local mainFrame = Instance.new("Frame", window)
    mainFrame.BackgroundColor3 = color or Color3.fromRGB(100, 255, 100)
    mainFrame.Size = UDim2.new(0, 500, 0, 300)

    local title = Instance.new("TextLabel", mainFrame)
    title.Text = name
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.new(1, 1, 1)

    return self
end

function MineCheatLib:CreateTab(title)
    local tabFrame = Instance.new("Frame")
    tabFrame.Name = title
    tabFrame.Parent = self.window

    local tabLabel = Instance.new("TextLabel", tabFrame)
    tabLabel.Text = title
    tabLabel.Size = UDim2.new(1, 0, 0, 30)
    tabLabel.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    tabLabel.TextColor3 = Color3.new(1, 1, 1)

    return tabFrame
end

function MineCheatLib:CreateButton(tab, buttonName, callback)
    local button = Instance.new("TextButton", tab)
    button.Text = buttonName
    button.Size = UDim2.new(1, 0, 0, 30)
    button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    button.TextColor3 = Color3.new(1, 1, 1)

    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)
end

return MineCheatLib
