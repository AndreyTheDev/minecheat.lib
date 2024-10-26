-- minecheat.lib

local MineCheatLib = {}

function MineCheatLib:CreateLib(name, color)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.BackgroundColor3 = color or Color3.fromRGB(127, 255, 0) -- Салатовый по умолчанию
    mainFrame.Size = UDim2.new(0, 500, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
    
    return {
        CreateTab = function(self, tabName)
            local tabFrame = Instance.new("Frame", mainFrame)
            tabFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            tabFrame.Size = UDim2.new(1, 0, 1, 0)
            tabFrame.Visible = true
            
            local tabButton = Instance.new("TextButton", mainFrame)
            tabButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            tabButton.Size = UDim2.new(0, 100, 0, 50)
            tabButton.Text = tabName
            tabButton.Position = UDim2.new(0, 10, 0, 10)
            
            tabButton.MouseButton1Click:Connect(function()
                for _, child in ipairs(mainFrame:GetChildren()) do
                    if child:IsA("Frame") then
                        child.Visible = false
                    end
                end
                tabFrame.Visible = true
            end)

            return {
                CreateButton = function(buttonName)
                    local button = Instance.new("TextButton", tabFrame)
                    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    button.Size = UDim2.new(0, 100, 0, 30)
                    button.Text = buttonName
                    button.Position = UDim2.new(0, 10, 0, #tabFrame:GetChildren() * 35)

                    button.MouseButton1Click:Connect(function()
                        print(buttonName .. " clicked")
                    end)
                end
            }
        end
    }
end

return MineCheatLib
