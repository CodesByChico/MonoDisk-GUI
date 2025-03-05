local MonoDisk = {} -- Antes era Library

function MonoDisk:CreateWindow(config)
    local Window = {}

    -- Criando a ScreenGui principal
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.Name = config.Name or "MonoDisk Gui" -- Atualizado

    -- Criando o Frame principal da janela
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    -- Adicionando título
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Title.Text = config.Name or "MonoDisk Gui" -- Atualizado
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.Gotham
    Title.TextSize = 16
    Title.Parent = MainFrame

    -- Retornar janela para adicionar botões depois
    Window.Frame = MainFrame
    function Window:Destroy()
        ScreenGui:Destroy()
    end

    return Window
end

return MonoDisk -- Retornar com o novo nome
