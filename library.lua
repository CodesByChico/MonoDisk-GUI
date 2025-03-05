local MonoDisk = loadstring(game:HttpGet("https://raw.githubusercontent.com/CodesByChico/MonoDisk-GUI/refs/heads/main/library.lua"))()
local Window = MonoDisk:CreateWindow("Meu Painel")

-- Adicionar botões com posições específicas
MonoDisk:AddButton("Botão 1", function()
    print("Botão 1 pressionado!")
end, 10, 10)  -- Posiciona o botão no canto superior esquerdo

MonoDisk:AddButton("Botão 2", function()
    print("Botão 2 pressionado!")
end, 200, 10)  -- Posiciona o botão mais à direita

MonoDisk:AddButton("Botão 3", function()
    print("Botão 3 pressionado!")
end, 10, 100)  -- Posiciona o botão um pouco mais abaixo

-- Adicionar toggles
MonoDisk:AddToggle("Ativar Modo Escuro", false, 10, 150, function(state)
    if state then
        print("Modo Escuro Ativado")
    else
        print("Modo Escuro Desativado")
    end
end)

MonoDisk:AddToggle("Ativar Música", true, 10, 200, function(state)
    if state then
        print("Música Ativada")
    else
        print("Música Desativada")
    end
end)
