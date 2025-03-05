local MonoDisk = {}

function MonoDisk:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")

    -- Propriedades da GUI
    ScreenGui.Parent = game.CoreGui

    MainFrame.Size = UDim2.new(0, 300, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BorderSizePixel = 2
    MainFrame.Parent = ScreenGui

    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Title.Text = title or "MonoDisk GUI"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 18
    Title.Parent = MainFrame

    -- Frame onde os botões serão adicionados
    local ButtonFrame = Instance.new("Frame")
    ButtonFrame.Size = UDim2.new(1, 0, 0, 50)
    ButtonFrame.Position = UDim2.new(0, 0, 0, 30)
    ButtonFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ButtonFrame.Parent = MainFrame

    -- Função para adicionar botões
    function MonoDisk:AddButton(text, action)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0, 100, 0, 30)
        Button.Text = text
        Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Parent = ButtonFrame

        -- Conectar a ação ao botão
        Button.MouseButton1Click:Connect(function()
            action()  -- Chama a função definida pelo jogador para o botão
        end)
    end

    return MainFrame
end

return MonoDisk
