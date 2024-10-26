-- minecheat.lib

local MineCheatLib = {}

function MineCheatLib:CreateLib(name)
    local minecheats = Instance.new("ScreenGui")
    local Hacks = Instance.new("Folder")
    local lol = Instance.new("Frame")

    minecheats.Name = name
    minecheats.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    minecheats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Hacks.Name = "Hacks"
    Hacks.Parent = minecheats

    lol.Name = "lol"
    lol.Parent = Hacks
    lol.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    lol.BackgroundTransparency = 1
    lol.BorderSizePixel = 0
    lol.Size = UDim2.new(0, 1502, 0, 638)

    self.windowFrame = lol
    self.tabs = {}

    return self
end

function MineCheatLib:CreateTab(tabName)
    local tab = Instance.new("Frame")
    tab.Parent = self.windowFrame
    tab.BackgroundColor3 = Color3.fromRGB(90, 150, 69)
    tab.BackgroundTransparency = 0.1
    tab.BorderSizePixel = 0
    tab.Size = UDim2.new(0, 129, 0, 27)

    local TextButton = Instance.new("TextButton")
    TextButton.Parent = tab
    TextButton.BackgroundTransparency = 1
    TextButton.Size = UDim2.new(0, 28, 0, 26)
    TextButton.Font = Enum.Font.Ubuntu
    TextButton.Text = ">"
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = tab
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(0, 96, 0, 27)
    TextLabel.Font = Enum.Font.Ubuntu
    TextLabel.Text = tabName
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "Content"
    contentFrame.Parent = tab
    contentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    contentFrame.BackgroundTransparency = 0.25
    contentFrame.Size = UDim2.new(0, 129, 0, 28)

    contentFrame.Visible = false -- скрываем контент по умолчанию

    table.insert(self.tabs, {tab = tab, content = contentFrame})

    local function toggleContent()
        contentFrame.Visible = not contentFrame.Visible
    end

    TextButton.MouseButton1Click:Connect(toggleContent)

    return contentFrame
end

function MineCheatLib:CreateButton(tabContent, buttonName)
    local button = Instance.new("TextButton")
    button.Parent = tabContent
    button.Size = UDim2.new(0, 121, 0, 28)
    button.Font = Enum.Font.Ubuntu
    button.Text = buttonName
    button.TextColor3 = Color3.fromRGB(255, 255, 255)

    return button
end

return MineCheatLib
