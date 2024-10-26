-- minecheat.lib

local MineCheatLib = {}

-- Функция для создания окна
function MineCheatLib:CreateWindow(name)
    local window = Instance.new("ScreenGui")
    window.Name = name
    window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    window.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local mainFrame = Instance.new("Frame")
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.Parent = window

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Text = name
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Parent = mainFrame

    return {
        -- Функция для создания таба
        CreateTab = function(self, tabName)
            local tabFrame = Instance.new("Frame")
            tabFrame.Size = UDim2.new(1, 0, 1, 0)
            tabFrame.Parent = mainFrame
            
            local tabButton = Instance.new("TextButton")
            tabButton.Size = UDim2.new(0, 100, 0, 50)
            tabButton.Text = tabName
            tabButton.Position = UDim2.new(0, 10, 0, 60)
            tabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            tabButton.Parent = mainFrame
            
            tabButton.MouseButton1Click:Connect(function()
                for _, child in ipairs(mainFrame:GetChildren()) do
                    if child:IsA("Frame") and child ~= tabFrame then
                        child.Visible = false
                    end
                end
                tabFrame.Visible = true
            end)

            tabFrame.Visible = true
            
            return {
                -- Функция для создания кнопки в табе
                CreateButton = function(buttonName)
                    local button = Instance.new("TextButton")
                    button.Size = UDim2.new(0, 100, 0, 30)
                    button.Text = buttonName
                    button.Position = UDim2.new(0, 10, 0, #tabFrame:GetChildren() * 35)
                    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    button.Parent = tabFrame

                    button.MouseButton1Click:Connect(function()
                        print(buttonName .. " clicked")
                    end)
                end
            }
        end
    }
end

return MineCheatLib
