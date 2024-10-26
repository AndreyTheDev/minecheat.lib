-- minecheat.lib Interface Library

local MineCheatLib = {}

-- Создание интерфейса для окна с табами и контентом
function MineCheatLib.createMainUI(position, size)
    local minecheats = Instance.new("ScreenGui")
    local hacksFolder = Instance.new("Folder")
    local mainFrame = Instance.new("Frame")

    -- Настройки основного интерфейса
    minecheats.Name = "minecheats"
    minecheats.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    minecheats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    hacksFolder.Name = "Hacks"
    hacksFolder.Parent = minecheats

    mainFrame.Name = "mainFrame"
    mainFrame.Parent = hacksFolder
    mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainFrame.BackgroundTransparency = 1
    mainFrame.Position = position or UDim2.new(0.05, 0, 0.1, 0) -- Позиция по умолчанию или переданная пользователем
    mainFrame.Size = size or UDim2.new(0, 1502, 0, 638)

    return mainFrame
end

-- Создание таба с кнопкой и содержимым
function MineCheatLib.createTab(parent, tabName)
    local tabFrame = Instance.new("Frame")
    local tabButton = Instance.new("TextButton")
    local tabLabel = Instance.new("TextLabel")
    local contentFrame = Instance.new("Frame")
    local buttonFrame = Instance.new("Frame")

    -- Настройки фрейма таба
    tabFrame.Name = tabName
    tabFrame.Parent = parent
    tabFrame.BackgroundColor3 = Color3.fromRGB(90, 150, 69)
    tabFrame.Size = UDim2.new(0, 129, 0, 27)
    tabFrame.Position = UDim2.new(0, 0, 0, (#parent:GetChildren() - 1) * 35) -- Расположение табов друг под другом

    -- Настройки кнопки раскрытия
    tabButton.Parent = tabFrame
    tabButton.BackgroundTransparency = 1
    tabButton.Position = UDim2.new(0.783, 0, 0.037, 0)
    tabButton.Rotation = 270
    tabButton.Size = UDim2.new(0, 28, 0, 26)
    tabButton.Font = Enum.Font.Ubuntu
    tabButton.Text = ">"
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.TextScaled = true

    -- Настройки текста
    tabLabel.Parent = tabFrame
    tabLabel.BackgroundTransparency = 1
    tabLabel.Size = UDim2.new(0, 96, 0, 27)
    tabLabel.Font = Enum.Font.Ubuntu
    tabLabel.Text = tabName
    tabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabLabel.TextSize = 20

    -- Настройки содержимого таба
    contentFrame.Name = "content" .. tabName
    contentFrame.Parent = tabFrame
    contentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    contentFrame.BackgroundTransparency = 0.25
    contentFrame.Position = UDim2.new(0, 0, 1, 0)
    contentFrame.Size = UDim2.new(0, 129, 0, 28)

    buttonFrame.Parent = contentFrame
    buttonFrame.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
    buttonFrame.Position = UDim2.new(0.97, 0, 0.11, 0)
    buttonFrame.Size = UDim2.new(0, 2, 0, 22)

    -- Скрипт для передвижения табов
    local dragging = false
    local dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        tabFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    tabFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = tabFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    tabFrame.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)

    return tabFrame
end

return MineCheatLib
