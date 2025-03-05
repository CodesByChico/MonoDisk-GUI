local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local MonoDisk = {}

function MonoDisk:CreateWindow(config, key, useKeySystem, showDiscordLink, showCopyKeyButton)
    local Window = {}

    local keyValidationUrl = "https://yourserver.com/validateKey" 

    local isKeyValid = false

    local function validateKey(inputKey)
        local success, response = pcall(function()
            local requestData = HttpService:JSONEncode({ key = inputKey })
            local response = HttpService:PostAsync(keyValidationUrl, requestData, Enum.HttpContentType.ApplicationJson)
            return HttpService:JSONDecode(response)
        end)

        if success then
            return response.isValid
        else
            return false
        end
    end

    local function createKeyScreen()
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
        Title.Text = "Enter the Key"
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
        KeyInput.PlaceholderText = "Enter Key..."
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
            if validateKey(inputKey) then
                isKeyValid = true
                KeyScreen:Destroy()
                createMainGui()
            else
                KeyInput.Text = ""
                KeyInput.PlaceholderText = "Incorrect Key! Try again."
            end
        end)

        if showCopyKeyButton then
            local CopyButton = Instance.new("TextButton")
            CopyButton.Size = UDim2.new(0, 100, 0, 30)
            CopyButton.Position = UDim2.new(0.5, -50, 0.8, 30)
            CopyButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
            CopyButton.Text = "Copy Key"
            CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            CopyButton.Font = Enum.Font.GothamBold
            CopyButton.TextSize = 16
            CopyButton.Parent = Frame

            CopyButton.MouseButton1Click:Connect(function()
                setclipboard(key)
            end)
        end

        if showDiscordLink then
            local DiscordButton = Instance.new("TextButton")
            DiscordButton.Size = UDim2.new(0, 100, 0, 30)
            DiscordButton.Position = UDim2.new(0.5, -50, 0.8, 70)
            DiscordButton.BackgroundColor3 = Color3.fromRGB(0, 90, 200)
            DiscordButton.Text = "Join Discord"
            DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            DiscordButton.Font = Enum.Font.GothamBold
            DiscordButton.TextSize = 16
            DiscordButton.Parent = Frame

            DiscordButton.MouseButton1Click:Connect(function()
                local discordLink = "https://discord.gg/yourserverlink"
                setclipboard(discordLink)
                game:GetService("TextChatService"):Chat(game.Players.LocalPlayer, "Copied Discord link!")
            end)
        end
    end

    local function createMainGui()
        if not isKeyValid and useKeySystem then
            return
        end

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

        Window.Frame = MainFrame
        function Window:Destroy()
            ScreenGui:Destroy()
        end

        return Window
    end

    if useKeySystem then
        createKeyScreen()
    else
        createMainGui()
    end

    return Window
end

return MonoDisk
