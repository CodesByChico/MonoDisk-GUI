local MonoDisk = {}

function MonoDisk:CreateWindow(config)
    local Window = {}

    -- Configuração do tema e outros parâmetros
    local Name = config.Name or "MonoDisk Gui"
    local Icon = config.Icon or 0
    local LoadingTitle = config.LoadingTitle or "MonoDisk"
    local LoadingSubtitle = config.LoadingSubtitle or "by Chico"
    local Theme = config.Theme or "Default"
    local DisablePrompts = config.DisableMonoDiskPrompts or false
    local DisableBuildWarnings = config.DisableBuildWarnings or false

    -- Configuração do sistema de chave
    local KeySystem = config.KeySystem or false
    local KeySettings = config.KeySettings or {}

    local Discord = config.Discord or {}
    local ConfigurationSaving = config.ConfigurationSaving or {}

    local function createMainGui()
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Parent = game:GetService("CoreGui")
        ScreenGui.Name = Name

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
        Title.Text = Name
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

        Window.Frame = MainFrame
        function Window:Destroy()
            ScreenGui:Destroy()
        end

        return Window
    end

    -- Função para criar o sistema de chave
    local function createKeyScreen()
        if KeySystem then
            local KeyScreen = Instance.new("ScreenGui")
            KeyScreen.Parent = game:GetService("CoreGui")

            local Frame = Instance.new("Frame")
            Frame.Size = UDim2.new(0, 400, 0, 250)
            Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
            Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Frame.BorderSizePixel = 0
            Frame.Parent = KeyScreen

            local Title = Instance.new("TextLabel")
            Title.Size = UDim2.new(1, 0, 0.2, 0)
            Title.BackgroundTransparency = 1
            Title.Text = KeySettings.Title or "Enter the Key"
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.Font = Enum.Font.GothamBold
            Title.TextSize = 18
            Title.TextXAlignment = Enum.TextXAlignment.Center
            Title.Parent = Frame

            local KeyInput = Instance.new("TextBox")
            KeyInput.Size = UDim2.new(1, -20, 0.3, 0)
            KeyInput.Position = UDim2.new(0, 10, 0.3, 10)
            KeyInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeyInput.Font = Enum.Font.Gotham
            KeyInput.TextSize = 16
            KeyInput.PlaceholderText = KeySettings.Note or "Enter Key..."
            KeyInput.Text = ""
            KeyInput.Parent = Frame

            local SubmitButton = Instance.new("TextButton")
            SubmitButton.Size = UDim2.new(1, -20, 0.2, 0)
            SubmitButton.Position = UDim2.new(0, 10, 0.8, -10)
            SubmitButton.BackgroundColor3 = Color3.fromRGB(100, 150, 250)
            SubmitButton.Text = "Submit"
            SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            SubmitButton.Font = Enum.Font.GothamBold
            SubmitButton.TextSize = 16
            SubmitButton.Parent = Frame

            SubmitButton.MouseButton1Click:Connect(function()
                local inputKey = KeyInput.Text
                local validKeys = KeySettings.Key or {}

                for _, key in pairs(validKeys) do
                    if inputKey == key then
                        KeyScreen:Destroy()
                        createMainGui()
                        return
                    end
                end

                KeyInput.Text = ""
                KeyInput.PlaceholderText = "Incorrect Key! Try again."
            end)
        end
    end

    if KeySystem then
        createKeyScreen()
    else
        createMainGui()
    end

    return Window
end

return MonoDisk
