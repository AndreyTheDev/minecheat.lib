local library = {}

function library:CreateWindow(scriptName)
    local minecheats = Instance.new("ScreenGui")
    minecheats.Name = "minecheats"
    minecheats.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local Hacks = Instance.new("Folder", minecheats)
    Hacks.Name = "skibidfolder"
    
    self.gui = minecheats
    self.Hacks = Hacks
    
    print("Script initialized:", scriptName)
end

function library:NewTab(title)
    local tab = Instance.new("Frame")
    tab.Name = "tab"
    tab.BackgroundColor3 = Color3.fromRGB(90, 150, 69)
    tab.Size = UDim2.new(0, 129, 0, 27)
    tab.Parent = self.Hacks

    local textLabel = Instance.new("TextLabel", tab)
    textLabel.Size = UDim2.new(0, 96, 0, 27)
    textLabel.Font = Enum.Font.Ubuntu
    textLabel.Text = title
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 20

    return tab
end

function library:NewButton(tab, buttonText, callback)
    local content = Instance.new("Frame", tab)
    content.Size = UDim2.new(0, 129, 0, 28)
    content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    content.BackgroundTransparency = 0.25

    local button = Instance.new("TextButton", content)
    button.Size = UDim2.new(0, 121, 0, 28)
    button.Font = Enum.Font.Ubuntu
    button.Text = buttonText
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.MouseButton1Click:Connect(callback)
end

function library:NewText(tab, text)
    local textLabel = Instance.new("TextLabel", tab)
    textLabel.Size = UDim2.new(0, 96, 0, 27)
    textLabel.Font = Enum.Font.Ubuntu
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 14
end

function library:NewSigmaSkibidi()
    print("Minecraft cheats sigma skibidi lib by AndreyTheDev")
end

return library
