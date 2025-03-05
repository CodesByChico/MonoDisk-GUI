local MonoDisk = {}

function MonoDisk:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")

    -- Propriedades da GUI
    ScreenGui.Parent = game.CoreGui

    MainFrame.Size = UDim2.new(0, 300, 0, 200)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
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

    -- Função para criar uma seção
    function MonoDisk:CreateSection(name)
        local SectionFrame = Instance.new("Frame")
        local SectionTitle = Instance.new("TextLabel")

        SectionFrame.Size = UDim2.new(1, 0, 0, 50)
        SectionFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        SectionFrame.Parent = MainFrame

        SectionTitle.Size = UDim2.new(1, 0, 0, 30)
        SectionTitle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        SectionTitle.Text = name or "Nova Seção"
        SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        SectionTitle.Font = Enum.Font.SourceSansBold
        SectionTitle.TextSize = 16
        SectionTitle.Parent = SectionFrame

        return SectionFrame
    end

    -- Função para criar uma seção com o nome do jogador
    function MonoDisk:AddSection(name)
        return MonoDisk:CreateSection(name)
    end

    return MainFrame
end

return MonoDisk
