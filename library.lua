local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local MonoDisk = {}

function MonoDisk:CreateWindow(config)
    local Window = {}

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

    local Notification = Instance.new("TextLabel")
    Notification.Size = UDim2.new(0, 250, 0, 40)
    Notification.Position = UDim2.new(1, -260, 0, 10)
    Notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Notification.BackgroundTransparency = 0.3
    Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notification.Text = "Press 'Right Control' to reopen GUI"
    Notification.Font = Enum.Font.GothamBold
    Notification.TextSize = 14
    Notification.Parent = ScreenGui

    task.spawn(function()
        wait(3)
        for i = 1, 10 do
            Notification.TextTransparency = i * 0.1
            Notification.BackgroundTransparency = 0.3 + (i * 0.07)
            wait(0.1)
        end
        Notification:Destroy()
    end)

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

    Window.Frame = MainFrame
    function Window:Destroy()
        ScreenGui:Destroy()
    end

    return Window
end

return MonoDisk
