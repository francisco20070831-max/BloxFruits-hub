-- Blox Fruits Hub v2.4.1 OPTIMIZADO
-- Escudo Aleja + TP Sea + Brillantes + Nombres + Ataque Rápido + Velocidad Siempre + Comandos Admin
-- Optimizado para acceso abierto, sin restricciones

-- Esperar a que el juego esté completamente cargado
repeat task.wait(1) until game:IsLoaded()
repeat task.wait(1) until game:GetService("Players").LocalPlayer

-- Configuración global
getgenv().script_config = {
    auto_farm = false,
    fruit_sniper = false,
    shield = false,
    attack_mode = "Fists",
    speed = 16,
    auto_rejoin = false
}

-- Servicios
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

-- Imprimir mensaje de carga inicial
print("🔥 CARGANDO Blox Fruits Hub v2.4.1...")

-- Cargar biblioteca de interfaz de usuario (Rayfield)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Blox Fruits Admin Hub v2.4.1",
    LoadingTitle = "Cargando funciones avanzadas...",
    LoadingSubtitle = "Optimizado para Blox Fruits",
    ConfigurationSaving = {Enabled = true, FolderName = "BloxFruitsHub", FileName = "Config"}
})

print("✅ Rayfield UI cargada con éxito")

-- Función para determinar el mar actual según el nivel
local function getCurrentSea()
    local level = LocalPlayer.Data.Level.Value
    if level < 700 then
        return "Sea 1"
    elseif level < 1500 then
        return "Sea 2"
    else
        return "Sea 3"
    end
end

-- Lista de islas por mar
local islands = {
    ["Sea 1"] = {"Starter Island", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Marine Fortress", "Skylands", "Prison", "Colosseum", "Magma Village", "Underwater City", "Upper Skylands", "Fountain City"},
    ["Sea 2"] = {"Rose Kingdom", "Cafe", "Green Zone", "Graveyard Island", "Dark Arena", "Snow Mountain", "Hot and Cold", "Cursed Ship", "Ice Castle", "Forgotten Island"},
    ["Sea 3"] = {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Haunted Castle", "Sea of Treats", "Castle on the Sea", "Tiki Outpost"}
}

-- Posiciones aproximadas por isla
local positions = {
    ["Starter Island"] = CFrame.new(979, 28, 1392),
    ["Jungle"] = CFrame.new(-1249, 11, -320),
    ["Pirate Village"] = CFrame.new(-1169, 4, -1428),
    ["Desert"] = CFrame.new(896, 6, 4390),
    ["Frozen Village"] = CFrame.new(1198, 57, -1142),
    ["Marine Fortress"] = CFrame.new(-5011, 29, 4326),
    ["Skylands"] = CFrame.new(-4607, 874, -1667),
    ["Prison"] = CFrame.new(4875, 5, 734),
    ["Colosseum"] = CFrame.new(-1428, 7, -3014),
    ["Magma Village"] = CFrame.new(-5320, 17, -5465),
    ["Underwater City"] = CFrame.new(61391, 6, 1425),
    ["Upper Skylands"] = CFrame.new(-7894, 5545, -3801),
    ["Fountain City"] = CFrame.new(5154, 2, 4178),
    ["Rose Kingdom"] = CFrame.new(-450, 138, 530),
    ["Cafe"] = CFrame.new(-380, 77, -110),
    ["Green Zone"] = CFrame.new(-2200, 73, -2200),
    ["Graveyard Island"] = CFrame.new(-5411, 48, -722),
    ["Dark Arena"] = CFrame.new(3770, 14, -4240),
    ["Snow Mountain"] = CFrame.new(609, 400, -5370),
    ["Hot and Cold"] = CFrame.new(-6026, 14, -6481),
    ["Cursed Ship"] = CFrame.new(-6508, 89, -132),
    ["Ice Castle"] = CFrame.new(5505, 40, -6178),
    ["Forgotten Island"] = CFrame.new(-3043, 239, -10191),
    ["Port Town"] = CFrame.new(-290, 30, 5358),
    ["Hydra Island"] = CFrame.new(5229, 603, 345),
    ["Great Tree"] = CFrame.new(28282, 230, 8828),
    ["Floating Turtle"] = CFrame.new(-13274, 332, -7579),
    ["Haunted Castle"] = CFrame.new(-9515, 142, 5535),
    ["Sea of Treats"] = CFrame.new(-2000, 50, -8000),
    ["Castle on the Sea"] = CFrame.new(-5000, 314, -3000),
    ["Tiki Outpost"] = CFrame.new(-16192, 500, -10238)
}

-- Anti-AFK
spawn(function()
    xpcall(function()
        LocalPlayer.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
        end)
    end, function(err)
        warn(string.format("Error en Anti-AFK: %s", err))
    end)
end)

-- Anti-Gameplay Paused
LocalPlayer.Changed:Connect(function(property)
    xpcall(function()
        if property == "GameplayPaused" then
            LocalPlayer.GameplayPaused = false
        end
    end, function(err)
        warn(string.format("Error en Anti-Gameplay Paused: %s", err))
    end)
end)

-- Auto Rejoin (Opcional)
if getgenv().script_config.auto_rejoin then
    spawn(function()
        while true do
            xpcall(function()
                game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                    if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
                        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
                    end
                end)
            end, function(err)
                warn(string.format("Error en Auto Rejoin: %s", err))
            end)
            task.wait()
        end
    end)
end

-- Interfaz de usuario emergente para carga
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "LoadingGui"
LoadingGui.Parent = game:GetService("CoreGui")
LoadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Frame = Instance.new("Frame")
Frame.Parent = LoadingGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 0, 0, 0)

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame

local LoadingLabel = Instance.new("TextLabel")
LoadingLabel.Parent = Frame
LoadingLabel.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingLabel.BackgroundTransparency = 1
LoadingLabel.Position = UDim2.new(0.5, 0, 0.7, 0)
LoadingLabel.Size = UDim2.new(0, 200, 0, 40)
LoadingLabel.Font = Enum.Font.GothamBold
LoadingLabel.Text = "Cargando..."
LoadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingLabel.TextSize = 14
LoadingLabel.TextTransparency = 1

local PoweredLabel = Instance.new("TextLabel")
PoweredLabel.Parent = Frame
PoweredLabel.AnchorPoint = Vector2.new(0.5, 0.5)
PoweredLabel.BackgroundTransparency = 1
PoweredLabel.Position = UDim2.new(0.5, 0, 0.85, 0)
PoweredLabel.Size = UDim2.new(0, 210, 0, 32)
PoweredLabel.Font = Enum.Font.GothamBold
PoweredLabel.Text = "Potenciado por <font color='rgb(85, 255, 127)'>Blox Fruits Hub (v2.4.1)</font>"
PoweredLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PoweredLabel.TextSize = 10
PoweredLabel.TextTransparency = 1
PoweredLabel.RichText = true

-- Animación de carga
TweenService:Create(Frame, TweenInfo.new(0.3), {Size = UDim2.new(0, 211, 0, 132)}):Play()
task.wait(0.3)
TweenService:Create(LoadingLabel, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
task.wait(0.2)
TweenService:Create(PoweredLabel, TweenInfo.new(0.2), {TextTransparency = 0.27}):Play()
task.wait(1)

-- Cerrar animación de carga
local function closeLoading()
    TweenService:Create(PoweredLabel, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
    task.wait(0.2)
    TweenService:Create(LoadingLabel, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
    task.wait(0.2)
    TweenService:Create(Frame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.3)
    Frame.Visible = false
end
task.delay(2, closeLoading)

-- Pestaña 1: Escudo Invisible
local ShieldTab = Window:CreateTab("🛡️ Escudo Invisible")
ShieldTab:CreateToggle({
    Name = "🛡️ Escudo (Aleja 3m)",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().script_config.shield = Value
        spawn(function()
            while getgenv().script_config.shield do
                xpcall(function()
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local distance = (enemy.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            if distance < 3 then
                                enemy.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                            end
                        end
                    end
                end, function(err)
                    warn(string.format("Error en Escudo: %s", err))
                end)
                task.wait(0.1)
            end
        end)
        Rayfield:Notify({Title = "Escudo", Content = Value and "ON" or "OFF", Duration = 3})
    end
})

-- Pestaña 2: Teletransporte por Mar
local TpTab = Window:CreateTab("🚀 TP por Sea")
TpTab:CreateDropdown({
    Name = "🏝️ TP Isla (Mar Actual: " .. getCurrentSea() .. ")",
    Options = islands[getCurrentSea()],
    CurrentOption = islands[getCurrentSea()][1],
    Callback = function(Option)
        xpcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = positions[Option]
                Rayfield:Notify({Title = "TP", Content = "Teletransportado a " .. Option, Duration = 3})
            end
        end, function(err)
            warn(string.format("Error en Teletransporte: %s", err))
        end)
    end
})

-- Pestaña 3: Visuales Brillantes + Nombres
local VisualTab = Window:CreateTab("👁️ Brillantes + Nombres")
VisualTab:CreateToggle({
    Name = "✨ Enemigos Brillantes",
    CurrentValue = false,
    Callback = function(Value)
        xpcall(function()
            for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("HumanoidRootPart") then
                    enemy.HumanoidRootPart.Transparency = Value and 0 or 1
                    enemy.HumanoidRootPart.Material = Value and Enum.Material.Neon or Enum.Material.Plastic
                    enemy.HumanoidRootPart.Color = Value and Color3.fromRGB(255, 255, 0) or Color3.fromRGB(139, 139, 139)
                end
            end
            Rayfield:Notify({Title = "Visual", Content = Value and "Enemigos Brillantes ON" or "OFF", Duration = 3})
        end, function(err)
            warn(string.format("Error en Enemigos Brillantes: %s", err))
        end)
    end
})

VisualTab:CreateToggle({
    Name = "🍇 Frutas Brillantes",
    CurrentValue = false,
    Callback = function(Value)
        xpcall(function()
            for _, fruit in pairs(Workspace:GetChildren()) do
                if fruit.Name:match("Fruit") and fruit:FindFirstChild("Handle") then
                    fruit.Handle.Transparency = Value and 0 or 1
                    fruit.Handle.Material = Value and Enum.Material.Neon or Enum.Material.Plastic
                    fruit.Handle.Color = Value and Color3.fromRGB(255, 165, 0) or Color3.fromRGB(255, 0, 0)
                end
            end
            Rayfield:Notify({Title = "Visual", Content = Value and "Frutas Brillantes ON" or "OFF", Duration = 3})
        end, function(err)
            warn(string.format("Error en Frutas Brillantes: %s", err))
        end)
    end
})

VisualTab:CreateToggle({
    Name = "👤 Nombres Jugadores Visibles Siempre",
    CurrentValue = false,
    Callback = function(Value)
        xpcall(function()
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    local billboard = player.Character.Head:FindFirstChild("NameBillboard") or Instance.new("BillboardGui", player.Character.Head)
                    billboard.Name = "NameBillboard"
                    billboard.AlwaysOnTop = Value
                    billboard.Size = UDim2.new(0, 200, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    local text = billboard:FindFirstChildOfClass("TextLabel") or Instance.new("TextLabel", billboard)
                    text.BackgroundTransparency = 1
                    text.Size = UDim2.new(1, 0, 1, 0)
                    text.Text = player.Name
                    text.TextColor3 = Color3.fromRGB(255, 255, 255)
                    text.TextSize = 14
                    billboard.Enabled = Value
                end
            end
            Rayfield:Notify({Title = "Visual", Content = Value and "Nombres ON" or "OFF", Duration = 3})
        end, function(err)
            warn(string.format("Error en Nombres Visibles: %s", err))
        end)
    end
})

-- Pestaña 4: Ataque Rápido
local AttackTab = Window:CreateTab("⚔️ Ataque Rápido")
AttackTab:CreateToggle({
    Name = "⚔️ Ataque Rápido",
    CurrentValue = false,
    Callback = function(Value)
        xpcall(function()
            if Value then
                spawn(function()
                    while Value do
                        pcall(function()
                            VirtualUser:Button1Down(Vector2.new())
                            if getgenv().script_config.attack_mode == "Gun" then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("Equip", "Gun")
                            elseif getgenv().script_config.attack_mode == "Fruit" then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("FruitAbility")
                            end
                        end)
                        task.wait(0.05)
                    end
                end)
                Rayfield:Notify({Title = "Ataque", Content = "Rápido ON", Duration = 3})
            else
                Rayfield:Notify({Title = "Ataque", Content = "Rápido OFF", Duration = 3})
            end
        end, function(err)
            warn(string.format("Error en Ataque Rápido: %s", err))
        end)
    end
})

AttackTab:CreateDropdown({
    Name = "Modo Ataque",
    Options = {"Fists", "Gun", "Fruit"},
    CurrentOption = "Fists",
    Callback = function(Option)
        xpcall(function()
            getgenv().script_config.attack_mode = Option
            Rayfield:Notify({Title = "Ataque", Content = "Modo: " .. Option, Duration = 3})
        end, function(err)
            warn(string.format("Error en Modo Ataque: %s", err))
        end)
    end
})

-- Pestaña 5: Velocidad Siempre
local SpeedTab = Window:CreateTab("🏃 Velocidad Siempre")
SpeedTab:CreateSlider({
    Name = "🏃 Velocidad (16-200)",
    Range = {16, 200},
    Increment = 10,
    CurrentValue = 16,
    Callback = function(Value)
        xpcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = Value
                Rayfield:Notify({Title = "Velocidad", Content = "Velocidad: " .. Value, Duration = 3})
            end
        end, function(err)
            warn(string.format("Error en Velocidad: %s", err))
        end)
    end
})

-- Botón flotante
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 60, 0, 30)
ToggleBtn.Position = UDim2.new(1, -70, 1, -40)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ToggleBtn.Text = "HUB"
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 14

local guiOpen = true
ToggleBtn.MouseButton1Click:Connect(function()
    guiOpen = not guiOpen
    Rayfield:ToggleUI(guiOpen)
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        guiOpen = not guiOpen
        Rayfield:ToggleUI(guiOpen)
    end
end)

-- Notificación de carga completa
print("🎉 Blox Fruits Hub v2.4.1 CARGADO!")
Rayfield:Notify({
    Title = "¡LISTO!",
    Content = "Escudo Aleja + TP Sea/Islas + Brillantes + Nombres + Ataque Rápido + Velocidad Siempre",
    Duration = 5
})

-- Verificación de ejecutor
print(string.format("\nEJECUTOR DETECTADO: %s", identifyexecutor() or "Desconocido"))
if hookfunction then print("✅ Soporta [HOOKFUNCTION]") else warn("❌ No soporta [HOOKFUNCTION]") end
if hookmetamethod then print("✅ Soporta [HOOKMETAMETHOD]") else warn("❌ No soporta [HOOKMETAMETHOD]") end
if writefile then print("✅ Soporta [WRITEFILE]") else warn("❌ No soporta [WRITEFILE]") end
if readfile then print("✅ Soporta [READFILE]") else warn("❌ No soporta [READFILE]") end
if getconnections then print("✅ Soporta [GETCONNECTION]") else warn("❌ No soporta [GETCONNECTION]") end

-- Auto ejecución para persistencia
if not getgenv().already_set_auto_exec then
    xpcall(function()
        local queueonteleport = queueonteleport or queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
        if queueonteleport then
            queueonteleport([[
                loadstring(game:HttpGet("URL_DEL_SCRIPT"))()
            ]])
        end
        getgenv().already_set_auto_exec = true
    end, function(err)
        warn(string.format("Error en Auto Ejecución: %s", err))
    end)
end
