-- minecheat.lib

local MineCheatLib = {}
local player = game.Players.LocalPlayer

function MineCheatLib:CreateLib(name, color)
    local lib = Instance.new("ScreenGui")
    lib.Name = name
    lib.Parent = player:WaitForChild("PlayerGui")
    lib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local hacks = Instance.new("Folder", lib)
    hacks.Name = "Hacks"

    local lol = Instance.new("Frame", hacks)
    lol.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    lol.BackgroundTransparency = 1
    lol.BorderSizePixel = 0
    lol.Size = UDim2.new(0, 1502, 0, 638)

    local tab = Instance.new("Frame", lol)
    tab.BackgroundColor3 = color or Color3.fromRGB(90, 150, 69)
    tab.BorderSizePixel = 0
    tab.Position = UDim2.new(0.0479735322, 0, 0.0966666639, 0)
    tab.Size = UDim2.new(0, 129, 0, 27)

    local textButton = Instance.new("TextButton", tab)
    textButton.BackgroundTransparency = 1
    textButton.Position = UDim2.new(0.782945752, 0, 0.0370370373, 0)
    textButton.Rotation = 270
    textButton.Size = UDim2.new(0, 28, 0, 26)
    textButton.Font = Enum.Font.Ubuntu
    textButton.Text = ">"
    textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    textButton.TextScaled = true

    local textLabel = Instance.new("TextLabel", tab)
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(0, 96, 0, 27)
    textLabel.Font = Enum.Font.Ubuntu
    textLabel.Text = "Tab"
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 20

    local content = Instance.new("Frame", tab)
    content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    content.BackgroundTransparency = 0.25
    content.BorderSizePixel = 0
    content.Position = UDim2.new(0, 0, 1, 0)
    content.Size = UDim2.new(0, 129, 0, 28)

    local frame = Instance.new("Frame", content)
    frame.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
    frame.BorderSizePixel = 0
    frame.Position = UDim2.new(0.970000029, 0, 0.109999999, 0)
    frame.Size = UDim2.new(0, 2, 0, 22)

    local button = Instance.new("TextButton", frame)
    button.BackgroundTransparency = 1
    button.Position = UDim2.new(-59.5, 0, -0.14000009, 0)
    button.Size = UDim2.new(0, 121, 0, 28)
    button.Font = Enum.Font.Ubuntu
    button.Text = "Button"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14

    -- Scripts
    local enabled = false

    textButton.MouseButton1Click:Connect(function()
        enabled = not enabled
        content.Visible = enabled
        textButton.Rotation = enabled and 90 or 270
    end)

    return {
        CreateTab = function(tabName)
            local newTab = Instance.new("Frame", lol)
            newTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            newTab.Size = UDim2.new(0, 129, 0, 28)
            newTab.Name = tabName

            -- Добавление кнопок в новую вкладку можно реализовать здесь
            return {
                CreateButton = function(buttonName)
                    local newButton = Instance.new("TextButton", newTab)
                    newButton.Size = UDim2.new(0, 121, 0, 28)
                    newButton.Font = Enum.Font.Ubuntu
                    newButton.Text = buttonName
                    newButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    newButton.TextSize = 14
                    newButton.BackgroundTransparency = 1
                    return newButton
                end
            }
        end
    }
end

return MineCheatLib
