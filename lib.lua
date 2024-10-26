-- minecheat.lib

local MineCheatLib = {}
local Players = game:GetService("Players")

function MineCheatLib:CreateWindow(name, color)
    local window = Instance.new("ScreenGui")
    window.Name = name
    window.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    window.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Hacks = Instance.new("Folder", window)
    Hacks.Name = "Hacks"

    local mainFrame = Instance.new("Frame", Hacks)
    mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainFrame.BackgroundTransparency = 1
    mainFrame.BorderSizePixel = 0
    mainFrame.Size = UDim2.new(0, 1502, 0, 638)

    local tabContainer = Instance.new("Frame", mainFrame)
    tabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabContainer.BackgroundTransparency = 1
    tabContainer.Size = UDim2.new(1, 0, 0, 30)
    
    local contentContainer = Instance.new("Frame", mainFrame)
    contentContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    contentContainer.BackgroundTransparency = 0.25
    contentContainer.Position = UDim2.new(0, 0, 0.05, 0)
    contentContainer.Size = UDim2.new(1, 0, 1, -30)

    local tabButtons = {}

    function CreateTab(name)
        local tabButton = Instance.new("TextButton", tabContainer)
        tabButton.Size = UDim2.new(0, 100, 0, 30)
        tabButton.Text = name
        tabButton.BackgroundColor3 = color or Color3.fromRGB(90, 150, 69)
        tabButton.BorderSizePixel = 0

        local tabContent = Instance.new("Frame", contentContainer)
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.Visible = false
        
        tabButton.MouseButton1Click:Connect(function()
            for _, btn in pairs(tabButtons) do
                btn.Visible = false
            end
            tabContent.Visible = true
        end)

        table.insert(tabButtons, tabContent)
        
        return {
            CreateButton = function(buttonName, callback)
                local button = Instance.new("TextButton", tabContent)
                button.Size = UDim2.new(0, 100, 0, 30)
                button.Text = buttonName
                button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                
                button.MouseButton1Click:Connect(callback)
            end
        }
    end

    return {
        CreateTab = CreateTab
    }
end

return MineCheatLib
