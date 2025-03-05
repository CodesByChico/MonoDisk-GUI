-- MonoDisk Gui Library

local MonoDisk = {}
MonoDisk.__index = MonoDisk

-- Função para criar a janela da MonoDisk Gui
function MonoDisk:CreateWindow(options)
    local Window = {}

    -- Definições iniciais
    Window.Name = options.Name or "MonoDisk Window"
    Window.Icon = options.Icon or 0
    Window.LoadingTitle = options.LoadingTitle or "Loading..."
    Window.LoadingSubtitle = options.LoadingSubtitle or "by HpLowes"
    Window.Theme = options.Theme or "Default"

    -- Criação da UI da janela
    Window.UI = Instance.new("ScreenGui")
    Window.Frame = Instance.new("Frame", Window.UI)
    Window.Frame.Size = UDim2.new(0, 500, 0, 300)
    Window.Frame.Position = UDim2.new(0.5, -250, 0.5, -150)
    Window.Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Window.Frame.BorderSizePixel = 0

    -- Título da janela
    Window.Title = Instance.new("TextLabel", Window.Frame)
    Window.Title.Size = UDim2.new(1, 0, 0, 30)
    Window.Title.BackgroundTransparency = 1
    Window.Title.Text = Window.Name
    Window.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Window.Title.TextSize = 24

    -- Botões de controle
    local MinimizeButton = Instance.new("TextButton", Window.Frame)
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -35, 0, 5)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    local MaximizeButton = Instance.new("TextButton", Window.Frame)
    MaximizeButton.Size = UDim2.new(0, 30, 0, 30)
    MaximizeButton.Position = UDim2.new(1, -70, 0, 5)
    MaximizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MaximizeButton.Text = "+"
    MaximizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    local CloseButton = Instance.new("TextButton", Window.Frame)
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -105, 0, 5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Função para minimizar a janela
    MinimizeButton.MouseButton1Click:Connect(function()
        Window.Frame.Visible = not Window.Frame.Visible
    end)

    -- Função para maximizar a janela
    MaximizeButton.MouseButton1Click:Connect(function()
        if Window.Frame.Size == UDim2.new(0, 500, 0, 300) then
            Window.Frame.Size = UDim2.new(0, 800, 0, 600)
        else
            Window.Frame.Size = UDim2.new(0, 500, 0, 300)
        end
    end)

    -- Função para fechar a janela
    CloseButton.MouseButton1Click:Connect(function()
        Window.UI:Destroy()
    end)

    -- Funcionalidade de movimentação da janela (dragging)
    local dragging = false
    local dragStart = nil
    local startPos = nil

    Window.Title.MouseButton1Down:Connect(function(x, y)
        dragging = true
        dragStart = Vector2.new(x, y)
        startPos = Window.Frame.Position
    end)

    Window.Title.MouseButton1Up:Connect(function()
        dragging = false
    end)

    Window.Title.MouseMoved:Connect(function(x, y)
        if dragging then
            local delta = Vector2.new(x, y) - dragStart
            Window.Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Exibir a janela
    Window.UI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    return Window
end

return MonoDisk
