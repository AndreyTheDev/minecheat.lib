-- minecheat.lib

local MineCheatLib = {}
MineCheatLib.__index = MineCheatLib

function MineCheatLib:CreateWindow(name, color)
    local window = Instance.new("ScreenGui")
    window.Name = "window"
    window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    window.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame", window)
    mainFrame.BackgroundColor3 = color or Color3.fromRGB(0, 0, 0)
    mainFrame.Size = UDim2.new(0, 500, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

    local title = Instance.new("TextLabel", mainFrame)
    title.Text = name
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextScaled = true

    self.tabs = {}
    self.currentTab = nil
    self.window = window
    return self
end

function MineCheatLib:CreateTab(title)
    local tab = Instance.new("Frame")
    tab.Name = title
    tab.Parent = self.window

    if self.currentTab then
        self.currentTab.Visible = false
    end

    tab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tab.Size = UDim2.new(1, 0, 1, 0)
    tab.Visible = true
    self.currentTab = tab

    self.tabs[title] = tab

    return tab
end

function MineCheatLib:CreateButton(tab, buttonName, callback)
    local button = Instance.new("TextButton", tab)
    button.Text = buttonName
    button.Size = UDim2.new(0, 200, 0, 50)
    button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Position = UDim2.new(0.5, -100, #tab:GetChildren() * 0.1, 10) -- Для вертикального размещения

    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)
end

return MineCheatLib
