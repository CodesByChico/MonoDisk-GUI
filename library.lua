local MonoDisk = {}

function MonoDisk:CreateWindow(title)
    -- Criar a ScreenGui e a janela
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local ButtonFrame = Instance.new("Frame")

    -- Propriedades iniciais
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Enabled = false  -- Inicialmente a GUI está desabilitada

    -- Configurações da janela principal
    MainFrame.Size = UDim2.new(0, 400, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BorderSizePixel = 2
    MainFrame.Visible = false  -- Inicialmente a janela está invisível
    MainFrame.Parent = ScreenGui

    -- Título da janela
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Title.Text = title or "MonoDisk GUI"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 18
    Title.Parent = MainFrame

    -- Frame para os botões e toggles
    ButtonFrame.Size = UDim2.new(1, 0, 1, -30)
    ButtonFrame.Position = UDim2.new(0, 0, 0, 30)
    ButtonFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ButtonFrame.Parent = MainFrame

    -- Função para adicionar botões
    function MonoDisk:AddButton(text, action, posX, posY)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0, 150, 0, 40)
        Button.Text = text
        Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Position = UDim2.new(0, posX, 0, posY)
        Button.Parent = ButtonFrame

        -- Conectar a ação ao botão
        Button.MouseButton1Click:Connect(function()
            action()  -- Chama a função definida pelo jogador para o botão
        end)
    end

    -- Função para adicionar toggles
    function MonoDisk:AddToggle(text, defaultState, posX, posY, callback)
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Size = UDim2.new(0, 150, 0, 40)
        ToggleFrame.Position = UDim2.new(0, posX, 0, posY)
        ToggleFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        ToggleFrame.Parent = ButtonFrame

        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Size = UDim2.new(0, 50, 0, 30)
        ToggleButton.Position = UDim2.new(0, 10, 0, 5)
        ToggleButton.Text = defaultState and "ON" or "OFF"
        ToggleButton.BackgroundColor3 = defaultState and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleButton.Parent = ToggleFrame

        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0, 90, 0, 30)
        Label.Position = UDim2.new(0, 70, 0, 5)
        Label.Text = text
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1
        Label.Parent = ToggleFrame

        -- Conectar a funcionalidade do toggle
        ToggleButton.MouseButton1Click:Connect(function()
            defaultState = not defaultState
            ToggleButton.Text = defaultState and "ON" or "OFF"
            ToggleButton.BackgroundColor3 = defaultState and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            callback(defaultState)  -- Chama o callback com o novo estado do toggle
        end)
    end

    -- Criar o botão de abrir/fechar a GUI
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 100, 0, 40)
    ToggleButton.Position = UDim2.new(0, 10, 0, 10)
    ToggleButton.Text = "Abrir/Fechar"
    ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Parent = ScreenGui

    -- Lógica para alternar a visibilidade da GUI
    ToggleButton.MouseButton1Click:Connect(function()
        local isVisible = MainFrame.Visible
        MainFrame.Visible = not isVisible
    end)

    return MainFrame
end

return MonoDisk
