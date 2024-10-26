local MineCheatLib = {}

-- Создание окна интерфейса
function MineCheatLib:CreateLib(name, color)
    local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Size = UDim2.new(0, 500, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
    mainFrame.BackgroundColor3 = color or Color3.fromRGB(0, 255, 0) -- Салатовый по умолчанию
    mainFrame.BackgroundTransparency = 0.5

    local titleLabel = Instance.new("TextLabel", mainFrame)
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Text = name
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.Font = Enum.Font.Ubuntu
    titleLabel.TextScaled = true
    titleLabel.TextStrokeTransparency = 0.5

    return { mainFrame = mainFrame }
end

-- Создание вкладки
function MineCheatLib:CreateTab(window, tabName)
    local tabFrame = Instance.new("Frame", window.mainFrame)
    tabFrame.Size = UDim2.new(1, 0, 1, -50)
    tabFrame.Position = UDim2.new(0, 0, 0, 50)
    tabFrame.BackgroundTransparency = 1

    local tabButton = Instance.new("TextButton", window.mainFrame)
    tabButton.Size = UDim2.new(0, 100, 0, 50)
    tabButton.Position = UDim2.new(0, 0, 0, 0)
    tabButton.Text = tabName
    tabButton.BackgroundColor3 = Color3.fromRGB(90, 150, 69)
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    tabButton.MouseButton1Click:Connect(function()
        tabFrame.Visible = not tabFrame.Visible
    end)

    return { tabFrame = tabFrame }
end

-- Создание кнопки на вкладке
function MineCheatLib:CreateButton(tab, buttonName)
    local button = Instance.new("TextButton", tab.tabFrame)
    button.Size = UDim2.new(0, 150, 0, 50)
    button.Text = buttonName
    button.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)

    button.MouseButton1Click:Connect(function()
        print(buttonName .. " clicked")
    end)

    return button
end

return MineCheatLib
