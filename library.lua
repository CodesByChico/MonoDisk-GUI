local MonoDisk = {}

function MonoDisk:CreateWindow(config)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.Name = config.Name or "MonoDisk Gui"

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TopBar.Parent = MainFrame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -90, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = config.Name or "MonoDisk Gui"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.Gotham
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar

    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 1, 0)
    CloseButton.Position = UDim2.new(1, -30, 0, 0)
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseButton.Text = "✖"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 16
    CloseButton.Parent = TopBar

    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 30, 1, 0)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
    MinimizeButton.Text = "🔽"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.TextSize = 16
    MinimizeButton.Parent = TopBar

    local isMinimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        MainFrame.Visible = not isMinimized
    end)

    local UserInputService = game:GetService("UserInputService")
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessed then
            isMinimized = not isMinimized
            MainFrame.Visible = not isMinimized
        end
    end)

    local ResizeButton = Instance.new("TextButton")
    ResizeButton.Size = UDim2.new(0, 30, 1, 0)
    ResizeButton.Position = UDim2.new(1, -90, 0, 0)
    ResizeButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
    ResizeButton.Text = "⛶"
    ResizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ResizeButton.Font = Enum.Font.GothamBold
    ResizeButton.TextSize = 16
    ResizeButton.Parent = TopBar

    local isMaximized = false
    local originalSize = MainFrame.Size

    ResizeButton.MouseButton1Click:Connect(function()
        isMaximized = not isMaximized
        if isMaximized then
            MainFrame.Size = UDim2.new(0, 600, 0, 450)
        else
            MainFrame.Size = originalSize
        end
    end)

    return {
        Frame = MainFrame,
        Destroy = function()
            ScreenGui:Destroy()
        end
    }
end

return MonoDisk
