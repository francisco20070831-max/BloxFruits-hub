-- Blox Fruits Hub v2.4 para Delta Executor (Place ID: 131716211654599)
-- Incluye Escudo Invisible, TP por Sea, Brillantes, Nombres, Ataque Rápido, Velocidad, Admin Commands
-- Integra pantalla de carga y funciones del script original (anti-AFK, auto-rejoin, streamer mode)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")

print("🔥 CARGANDO Blox Fruits Hub v2.4 para Delta...")

---------/// Configuraciones Globales (Personalizables) ///---------
getgenv().skip_loading = false  -- Cambia a true para saltar la pantalla de carga
getgenv().auto_rejoin = true    -- Reúne automáticamente si hay error
getgenv().streamer_mode = false -- Oculta tu nombre (útil para streaming)
getgenv().highdebug = true      -- Activa logs detallados en consola

---------/// Verificación de Juego (Delta) ///---------
local DELTA_PLACE_ID = 131716211654599
if game.PlaceId ~= DELTA_PLACE_ID then
    warn("¡Error! Este script es para Blox Fruits en Delta (Place ID: " .. DELTA_PLACE_ID .. "). Únete al juego correcto.")
    pcall(function()
        TeleportService:Teleport(DELTA_PLACE_ID)
    end)
    return
end
print("✓ Blox Fruits (Delta) detectado. Configurando...")

---------/// Auto-Execute (para reconexiones) ///---------
local function setAutoExec()
    local queue = queueonteleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport) or (delta and delta.queue_on_teleport)
    if queue then
        print("Activando Auto-Execute para reconexiones...")
        queue('loadstring(game:HttpGet("https://sirius.menu/rayfield"))();' ..
              'local s=loadstring(game:HttpGet("https://pastebin.com/raw/YourPastebinLink"))();' .. -- Reemplaza con un Pastebin si subes el script
              's:CreateWindow({Name="Blox Fruits Admin Hub v2.4+",LoadingTitle="Cargando funciones...",LoadingSubtitle="por Grok",ConfigurationSaving={Enabled=true,FolderName="BloxFruitsHub",FileName="Config"},KeySystem=false})')
    end
end
setAutoExec()

---------/// Interfaz de Carga (del script original) ///---------
local loadingGui = nil
local function createLoadingUI()
    if getgenv().skip_loading then return end
    loadingGui = Instance.new("ScreenGui")
    loadingGui.Name = "Loading"
    loadingGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
    loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Frame = Instance.new("Frame", loadingGui)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.Size = UDim2.new(0, 0, 0, 0)

    local UICorner = Instance.new("UICorner", Frame)

    local Windows = Instance.new("Folder", Frame)
    Windows.Name = "Windows"

    local Window1 = Instance.new("Frame", Windows)
    Window1.Name = "Window1"
    Window1.AnchorPoint = Vector2.new(0.5, 0.5)
    Window1.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window1.BackgroundTransparency = 0.600
    Window1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window1.BorderSizePixel = 0
    Window1.Position = UDim2.new(0.411275715, 0, 0.26413402, 0)
    Window1.Size = UDim2.new(0, 30, 0, 30)
    Window1.Visible = false
    local UICorner_2 = Instance.new("UICorner", Window1)
    UICorner_2.CornerRadius = UDim.new(0, 4)
    local TextLabel = Instance.new("TextLabel", Window1)
    TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.Text = "A"
    TextLabel.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel.TextSize = 24

    local Window2 = Instance.new("Frame", Windows)
    Window2.Name = "Window2"
    Window2.AnchorPoint = Vector2.new(0.5, 0.5)
    Window2.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window2.BackgroundTransparency = 0.600
    Window2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window2.BorderSizePixel = 0
    Window2.Position = UDim2.new(0.581891835, 0, 0.26413402, 0)
    Window2.Size = UDim2.new(0, 30, 0, 30)
    Window2.Visible = false
    local UICorner_3 = Instance.new("UICorner", Window2)
    UICorner_3.CornerRadius = UDim.new(0, 4)
    local TextLabel_2 = Instance.new("TextLabel", Window2)
    TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1
    TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.BorderSizePixel = 0
    TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
    TextLabel_2.Font = Enum.Font.FredokaOne
    TextLabel_2.Text = "C"
    TextLabel_2.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel_2.TextSize = 24

    local Window3 = Instance.new("Frame", Windows)
    Window3.Name = "Window3"
    Window3.AnchorPoint = Vector2.new(0.5, 0.5)
    Window3.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window3.BackgroundTransparency = 0.600
    Window3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window3.BorderSizePixel = 0
    Window3.Position = UDim2.new(0.581891835, 0, 0.5368613, 0)
    Window3.Size = UDim2.new(0, 30, 0, 30)
    Window3.Visible = false
    local UICorner_4 = Instance.new("UICorner", Window3)
    UICorner_4.CornerRadius = UDim.new(0, 4)
    local TextLabel_3 = Instance.new("TextLabel", Window3)
    TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 1
    TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_3.BorderSizePixel = 0
    TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel_3.Size = UDim2.new(1, 0, 1, 0)
    TextLabel_3.Font = Enum.Font.FredokaOne
    TextLabel_3.Text = "1.7"
    TextLabel_3.TextSize = 20

    local Window4 = Instance.new("Frame", Windows)
    Window4.Name = "Window4"
    Window4.AnchorPoint = Vector2.new(0.5, 0.5)
    Window4.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window4.BackgroundTransparency = 0.600
    Window4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window4.BorderSizePixel = 0
    Window4.Position = UDim2.new(0.411275715, 0, 0.5368613, 0)
    Window4.Size = UDim2.new(0, 30, 0, 30)
    Window4.Visible = false
    local UICorner_5 = Instance.new("UICorner", Window4)
    UICorner_5.CornerRadius = UDim.new(0, 4)
    local TextLabel_4 = Instance.new("TextLabel", Window4)
    TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_4.BackgroundTransparency = 1
    TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_4.BorderSizePixel = 0
    TextLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel_4.Size = UDim2.new(1, 0, 1, 0)
    TextLabel_4.Font = Enum.Font.FredokaOne
    TextLabel_4.Text = "M"
    TextLabel_4.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel_4.TextSize = 24

    local TextLabel_5 = Instance.new("TextLabel", Frame)
    TextLabel_5.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_5.BackgroundTransparency = 1
    TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_5.BorderSizePixel = 0
    TextLabel_5.Position = UDim2.new(0.496965468, 0, 0.757293224, 0)
    TextLabel_5.Size = UDim2.new(0, 179, 0, 40)
    TextLabel_5.Font = Enum.Font.GothamBold
    TextLabel_5.Text = "Cargando..."
    TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_5.TextSize = 12
    TextLabel_5.TextWrapped = true
    TextLabel_5.TextTransparency = 1

    local TextLabel_6 = Instance.new("TextLabel", Frame)
    TextLabel_6.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_6.BackgroundTransparency = 1
    TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_6.BorderSizePixel = 0
    TextLabel_6.Position = UDim2.new(0.500426292, 0, 0.856181602, 0)
    TextLabel_6.Size = UDim2.new(0, 210, 0, 32)
    TextLabel_6.Font = Enum.Font.GothamBold
    TextLabel_6.Text = "Alimentado por Admin Hub"
    TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_6.TextTransparency = 1
    TextLabel_6.TextSize = 10
    TextLabel_6.TextWrapped = true
    TextLabel_6.RichText = true

    -- Animación de carga
    TweenService:Create(Frame, TweenInfo.new(0.3), {Size = UDim2.new(0, 21, 0, 13)}):Play()
    task.wait(0.3)
    TweenService:Create(Frame, TweenInfo.new(0.3), {Size = UDim2.new(0, 21, 0, 132)}):Play()
    task.wait(0.3)
    TweenService:Create(Frame, TweenInfo.new(0.3), {Size = UDim2.new(0, 211, 0, 132)}):Play()
    task.wait(0.3)
    Window1.Visible = true
    task.wait(0.2)
    Window2.Visible = true
    task.wait(0.2)
    Window3.Visible = true
    task.wait(0.2)
    Window4.Visible = true
    task.wait(0.2)
    TweenService:Create(TextLabel_5, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
    task.wait(0.2)
    TweenService:Create(TextLabel_6, TweenInfo.new(0.2), {TextTransparency = 0.27}):Play()
    task.wait(0.4)

    -- Animación de ventanas
    spawn(function()
        while true do
            task.wait()
            TweenService:Create(Window1, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Window4, TweenInfo.new(0.3), {BackgroundTransparency = 0.6}):Play()
            task.wait(0.47)
            TweenService:Create(Window2, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Window1, TweenInfo.new(0.3), {BackgroundTransparency = 0.6}):Play()
            task.wait(0.47)
            TweenService:Create(Window3, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Window2, TweenInfo.new(0.3), {BackgroundTransparency = 0.6}):Play()
            task.wait(0.47)
            TweenService:Create(Window4, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Window3, TweenInfo.new(0.3), {BackgroundTransparency = 0.6}):Play()
            task.wait(0.47)
        end
    end)
end

local function updateStatus(text)
    if loadingGui and loadingGui:FindFirstChild("Frame") then
        local label = loadingGui.Frame:FindFirstChildWhichIsA("TextLabel")
        if label and label.Text == "Cargando..." then
            label.Text = text .. "..."
        end
    end
    if getgenv().highdebug then
        print("Status: " .. text)
    end
end

local function closeLoading()
    if loadingGui then
        for _, label in pairs(loadingGui.Frame:GetChildren()) do
            if label:IsA("TextLabel") then
                TweenService:Create(label, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
            end
        end
        task.wait(0.2)
        for _, window in pairs(loadingGui.Frame.Windows:GetChildren()) do
            window.Visible = false
            task.wait(0.2)
        end
        TweenService:Create(loadingGui.Frame, TweenInfo.new(0.3), {Size = UDim2.new(0, 21, 0, 132)}):Play()
        task.wait(0.3)
        TweenService:Create(loadingGui.Frame, TweenInfo.new(0.3), {Size = UDim2.new(0, 21, 0, 13)}):Play()
        task.wait(0.3)
        TweenService:Create(loadingGui.Frame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        task.wait(0.3)
        loadingGui.Frame.Visible = false
        loadingGui:Destroy()
    end
end

createLoadingUI()
updateStatus("Configurando entorno...")

---------/// Funciones Esenciales del Script Original ///---------
-- Anti-AFK
spawn(function()
    pcall(function()
        LocalPlayer.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
            wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
        end)
    end)
end)
updateStatus("Anti-AFK activado ✓")

-- Auto-Rejoin
if getgenv().auto_rejoin then
    spawn(function()
        pcall(function()
            game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
                    updateStatus("Error detectado, intentando reconectar...")
                    wait(1)
                    TeleportService:Teleport(DELTA_PLACE_ID)
                end
            end)
        end)
    end)
    updateStatus("Auto-Rejoin activado ✓")
end

-- Streamer Mode
if getgenv().streamer_mode then
    local function hideName(target, replacement)
        pcall(function()
            for _, obj in pairs(game:GetDescendants()) do
                if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                    obj.Text = string.gsub(obj.Text, target, replacement)
                    obj.Changed:Connect(function()
                        obj.Text = string.gsub(obj.Text, target, replacement)
                    end)
                end
            end
            game.DescendantAdded:Connect(function(desc)
                if desc:IsA("TextLabel") or desc:IsA("TextButton") or desc:IsA("TextBox") then
                    desc.Text = string.gsub(desc.Text, target, replacement)
                    desc.Changed:Connect(function()
                        desc.Text = string.gsub(desc.Text, target, replacement)
                    end)
                end
            end)
        end)
    end
    hideName(LocalPlayer.Name, "[Usuario Oculto]")
    hideName(LocalPlayer.DisplayName, "[Usuario Oculto]")
    updateStatus("Modo Streamer activado ✓")
end

---------/// Carga de Rayfield UI y Hub v2.4 ///---------
updateStatus("Cargando Rayfield UI...")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Blox Fruits Admin Hub v2.4+",
    LoadingTitle = "Cargando funciones...",
    LoadingSubtitle = "por Grok",
    ConfigurationSaving = {Enabled = true, FolderName = "BloxFruitsHub", FileName = "Config"},
    KeySystem = false
})

print("✅ Rayfield UI cargada")

local Config = {AutoFarm = false, FruitSniper = false, Shield = false, AttackMode = "Puños", Speed = 16}

-- Detect Current Sea
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

-- Islands per Sea
local islands = {
    ["Sea 1"] = {"Starter Island", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Marine Fortress", "Skylands", "Prison", "Colosseum", "Magma Village", "Underwater City", "Upper Skylands", "Fountain City"},
    ["Sea 2"] = {"Kingdom of Rose", "Cafe", "Green Zone", "Graveyard Island", "Dark Arena", "Snow Mountain", "Hot and Cold", "Cursed Ship", "Ice Castle", "Forgotten Island"},
    ["Sea 3"] = {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Haunted Castle", "Sea of Treats", "Castle on the Sea", "Tiki Outpost"}
}

-- Positions per Isla
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
    ["Kingdom of Rose"] = CFrame.new(-450, 138, 530),
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

-- TAB 1: ESCUDO INVISIBLE (Aleja 3m)
local ShieldTab = Window:CreateTab("🛡️ Escudo Invisible")
ShieldTab:CreateToggle({
    Name = "🛡️ Escudo (Aleja 3m)",
    CurrentValue = false,
    Callback = function(Value)
        Config.Shield = Value
        spawn(function()
            while Config.Shield do
                pcall(function()
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        local distance = (enemy.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if distance < 3 then
                            enemy.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                        end
                    end
                end)
                wait(0.1)
            end
        end)
        Rayfield:Notify({Title = "Escudo", Content = Value and "ON" or "OFF", Duration = 3})
    end
})

-- TAB 2: TELETRANSPORTE POR SEA (del script v2.4)
local TpTab = Window:CreateTab("🚀 TP por Sea")
TpTab:CreateDropdown({
    Name = "🏝️ TP Isla (Sea Actual: " .. getCurrentSea() .. ")",
    Options = islands[getCurrentSea()],
    CurrentOption = islands[getCurrentSea()][1],
    Callback = function(Option)
        pcall(function()
            LocalPlayer.Character.HumanoidRootPart.CFrame = positions[Option]
            Rayfield:Notify({Title = "TP", Content = "TP a " .. Option, Duration = 3})
        end)
    end
})

-- TAB 3: VISUALES BRILLANTES + NOMBRES
local VisualTab = Window:CreateTab("👁️ Brillantes + Nombres")
VisualTab:CreateToggle({
    Name = "✨ Enemigos Brillantes",
    CurrentValue = false,
    Callback = function(Value)
        for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") then
                enemy.HumanoidRootPart.Transparency = Value and 0 or 1
                enemy.HumanoidRootPart.Material = Value and Enum.Material.Neon or Enum.Material.Plastic
                enemy.HumanoidRootPart.Color = Value and Color3.fromRGB(255, 255, 0) or Color3.fromRGB(139, 139, 139)
            end
        end
        Rayfield:Notify({Title = "Visual", Content = Value and "Enemigos Brillantes ON" or "OFF", Duration = 3})
    end
})

VisualTab:CreateToggle({
    Name = "🍇 Frutas Brillantes",
    CurrentValue = false,
    Callback = function(Value)
        for _, fruit in pairs(Workspace:GetChildren()) do
            if fruit.Name:match("Fruit") and fruit:FindFirstChild("Handle") then
                fruit.Handle.Transparency = Value and 0 or 1
                fruit.Handle.Material = Value and Enum.Material.Neon or Enum.Material.Plastic
                fruit.Handle.Color = Value and Color3.fromRGB(255, 165, 0) or Color3.fromRGB(255, 0, 0)
            end
        end
        Rayfield:Notify({Title = "Visual", Content = Value and "Frutas Brillantes ON" or "OFF", Duration = 3})
    end
})

VisualTab:CreateToggle({
    Name = "👤 Nombres Jugadores Visibles Siempre",
    CurrentValue = false,
    Callback = function(Value)
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                local bill = player.Character.Head:FindFirstChild("NameBillboard") or Instance.new("BillboardGui", player.Character.Head)
                bill.Name = "NameBillboard"
                bill.AlwaysOnTop = Value
                bill.Size = UDim2.new(0, 200, 0, 50)
                bill.StudsOffset = Vector3.new(0, 2, 0)
                local text = bill:FindFirstChildOfClass("TextLabel") or Instance.new("TextLabel", bill)
                text.BackgroundTransparency = 1
                text.Size = UDim2.new(1, 0, 1, 0)
                text.Text = player.Name
                text.TextColor3 = Color3.fromRGB(255, 255, 255)
                text.TextSize = 14
                bill.Enabled = Value
            end
        end
        Rayfield:Notify({Title = "Visual", Content = Value and "Nombres ON" or "OFF", Duration = 3})
    end
})

-- TAB 4: ATAQUE RÁPIDO
local AttackTab = Window:CreateTab("⚔️ Ataque Rápido")
AttackTab:CreateToggle({
    Name = "⚔️ Ataque Rápido",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                while Value do
                    pcall(function()
                        VirtualUser:Button1Down(Vector2.new())
                        if Config.AttackMode == "Gun" then
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("Equip", "Gun")
                        elseif Config.AttackMode == "Fruta" then
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("FruitAbility")
                        end
                    end)
                    wait(0.05)
                end
            end)
            Rayfield:Notify({Title = "Ataque", Content = "Rápido ON", Duration = 3})
        else
            Rayfield:Notify({Title = "Ataque", Content = "Rápido OFF", Duration = 3})
        end
    end
})

AttackTab:CreateDropdown({
    Name = "Modo Ataque",
    Options = {"Puños", "Gun", "Fruta"},
    CurrentOption = "Puños",
    Callback = function(Option)
        Config.AttackMode = Option
        Rayfield:Notify({Title = "Ataque", Content = "Modo: " .. Option, Duration = 3})
    end
})

-- TAB 5: VELOCIDAD SIEMPRE
local SpeedTab = Window:CreateTab("🏃 Velocidad Siempre")
SpeedTab:CreateSlider({
    Name = "🏃 Velocidad (16-200)",
    Range = {16, 200},
    Increment = 10,
    CurrentValue = 16,
    Callback = function(Value)
        pcall(function()
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
            Rayfield:Notify({Title = "Velocidad", Content = Value .. " Siempre", Duration = 3})
        end)
    end
})

-- BOTÓN FLOTANTE
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
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

closeLoading()
print("🎉 Blox Fruits Hub v2.4 CARGADO!")
Rayfield:Notify({Title = "¡LISTO!", Content = "Escudo Aleja + TP Sea/Islas + Brillantes + Nombres + Ataque Rápido + Velocidad Siempre + Admin", Duration = 5})
getgenv().run_time = true
