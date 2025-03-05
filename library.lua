local MonoDisk = {}

-- Função para criar a janela principal
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

    -- Função para criar botões de seções (dinamicamente)
    local SectionButtonsFrame = Instance.new("Frame")
    SectionButtonsFrame.Size = UDim2.new(1, 0, 0, 50)
    SectionButtonsFrame.Position = UDim2.new(0, 0, 0, 30)
    SectionButtonsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SectionButtonsFrame.Parent = MainFrame

    -- Tabela para armazenar botões de seções
    local sectionButtons = {}

    -- Função para criar uma nova seção com botão opcional
    function MonoDisk:AddSection(name)
        local SectionButton = Instance.new("TextButton")
        SectionButton.Size = UDim2.new(0, 100, 0, 30)
        SectionButton.Text = name or "Nova Seção"
        SectionButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        SectionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        SectionButton.Parent = SectionButtonsFrame

        -- Criando a seção
        local NewSection = Instance.new("Frame")
        NewSection.Size = UDim2.new(1, 0, 0, 200)
        NewSection.Position = UDim2.new(0, 0, 0, 80)
        NewSection.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        NewSection.Visible = false  -- A seção começa invisível
        NewSection.Parent = MainFrame

        -- Quando o botão da seção for clicado, a seção correspondente é mostrada
        SectionButton.MouseButton1Click:Connect(function()
            -- Torna todas as seções invisíveis
            for _, section in pairs(sectionButtons) do
                section.SectionFrame.Visible = false
            end
            -- Torna a seção selecionada visível
            NewSection.Visible = true
        end)

        -- Armazena o botão da seção e a respectiva Frame para controle
        table.insert(sectionButtons, {Button = SectionButton, SectionFrame = NewSection})

        return NewSection
    end

    return MainFrame
end

return MonoDisk
