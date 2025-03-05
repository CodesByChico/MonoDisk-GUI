# MonoDisk Gui 🌙💾  
A Roblox GUI library inspired by Rayfield! 🚀  

## ✨ Features  
- ✅ Modern and minimalistic design  
- ✅ Easy to use and customize  
- ✅ Support for multiple components (coming soon!)  

## 📦 Installation  
Boot the library (you need this to the Gui work put it on the first line of your code):  

```lua
local MonoDisk = loadstring(game:HttpGet("https://raw.githubusercontent.com/CodesByChico/MonoDisk-GUI/refs/heads/main/library.lua"))()
```
## 🪟 Create Window

```lua
-- Inicializar a MonoDisk Gui com a URL onde a biblioteca está hospedada
local MonoDisk = loadstring(game:HttpGet("URL_OF_THE_MONODISK_GUI"))()

-- Criar a janela
local Window = MonoDisk:CreateWindow({
   Name = "MonoDisk Example Window",  -- Nome da janela
   Icon = 0,  -- Ícone da janela (0 para nenhum ícone)
   LoadingTitle = "MonoDisk Interface Suite",  -- Título exibido enquanto a janela carrega
   LoadingSubtitle = "by HpLowes",  -- Subtítulo da janela
   Theme = "Default",  -- Tema da janela (pode ser alterado para outro tema)
})

-- Ativar e configurar o Key System
Window:SetKeySystem(true, {
   Title = "Enter the Key",  -- Título do sistema de chave
   Subtitle = "Key System",  -- Subtítulo do sistema de chave
   Note = "No method of obtaining the key is provided",  -- Nota para o usuário
   FileName = "Key",  -- Nome do arquivo de chave único
   SaveKey = true,  -- Salvar a chave do usuário
   GrabKeyFromSite = false,  -- Defina para "true" se você deseja pegar a chave de um site externo (por exemplo, pastebin)
   Key = {"Hello", "SecretKey"}  -- Lista de chaves válidas
})
```

