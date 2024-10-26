local library = {}

-- Инициализация GUI и его элементов
function library:CreateWindow(scriptName)
    local minecheats = Instance.new("ScreenGui")
    minecheats.Name = "minecheats"
    minecheats.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    minecheats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Hacks = Instance.new("Folder", minecheats)
    Hacks.Name = "skibidfolder"

    local lol = Instance.new("Frame", Hacks)
    lol.Name = "lol"
    lol.BackgroundTransparency = 1
    lol.Size = UDim2.new(0, 1502, 0, 638)

    self.gui = minecheats
    self.mainFrame = lol
    print("Script initialized:", scriptName)
end

-- Создание новой вкладки
function library:NewTab(title)
    local tab = Instance.new("Frame", self.mainFrame)
    tab.Name = "tab"
    tab.BackgroundColor3 = Color3.fromRGB(90, 150, 69)
    tab.Size = UDim2.new(0, 129, 0, 27)

    local textLabel = Instance.new("TextLabel", tab)
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(0, 96, 0, 27)
    textLabel.Font = Enum.Font.Ubuntu
    textLabel.Text = title
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 20

    local toggleButton = Instance.new("TextButton", tab)
    toggleButton.BackgroundTransparency = 1
    toggleButton.Size = UDim2.new(0, 28, 0, 26)
    toggleButton.Position = UDim2.new(0.78, 0, 0.04, 0)
    toggleButton.Text = ">"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Rotation = 270

    local content = Instance.new("Frame", tab)
    content.Name = "content"
    content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    content.BackgroundTransparency = 0.25
    content.Size = UDim2.new(0, 129, 0, 28)
    content.Position = UDim2.new(0, 0, 1, 0)
    content.Visible = false

    toggleButton.MouseButton1Click:Connect(function()
        content.Visible = not content.Visible
        toggleButton.Rotation = content.Visible and 90 or 270
    end)

    return content
end

-- Создание кнопки внутри вкладки
function library:NewButton(tab, buttonText, callback)
    local button = Instance.new("TextButton", tab)
    button.Size = UDim2.new(0, 121, 0, 28)
    button.Font = Enum.Font.Ubuntu
    button.Text = buttonText
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundTransparency = 1
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.MouseButton1Click:Connect(callback)
end

-- Создание текста внутри вкладки
function library:NewText(tab, text)
    local textLabel = Instance.new("TextLabel", tab)
    textLabel.Size = UDim2.new(0, 121, 0, 28)
    textLabel.Font = Enum.Font.Ubuntu
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.BackgroundTransparency = 1
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
end

-- Специальная команда для вывода в консоль
function library:NewSigmaSkibidi()
    print("Minecraft cheats sigma skibidi lib by AndreyTheDev")
end

return library
