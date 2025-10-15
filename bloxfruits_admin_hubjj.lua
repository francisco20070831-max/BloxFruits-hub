-- Blox Fruits Hub v3.0 MEJORADO - Escudo Aleja + TP Sea + Brillantes + Nombres + Ataque Rápido + Velocidad Siempre + Auto Farm + Auto Rejoin + Streamer Mode + Anti AFK + Más (Inspirado en Redz Hub y Alchemy Hub)
-- Mejoras: UI con Kavo (similar a Redz Hub), posiciones actualizadas (Octubre 2025), TP suave, Ataque optimizado, funciones de Alchemy como auto-rejoin, streamer mode, anti-AFK, avoid players, white/black screen.
-- Créditos: Basado en v2.4, fixes y adds por Grok (2025).

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

print("🔥 CARGANDO v3.0 Mejorado...")

-- Reemplazo de Rayfield por Kavo UI (similar a Redz Hub, más estable en 2025)
local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo:CreateLib("Blox Fruits Hub v3.0 (Redz Style)", "Synapse")
local Config = {AutoFarm = false, FruitSniper = false, Shield = false, AttackMode = "Puños", Speed = 16, AutoRejoin = false, StreamerMode = false, WhiteScreen = false, BlackScreen = false}

-- Detect Current Sea (basado en nivel)
local function getCurrentSea()
    local level = LocalPlayer.Data.Level.Value
    if level < 700 then return "Sea 1" elseif level < 1500 then return "Sea 2" else return "Sea 3" end
end

-- Islands per Sea (actualizado Octubre 2025 de Beebom y Dexerto)
local islands = {
    ["Sea 1"] = {"Starter Island", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Marine Fortress", "Skylands", "Prison", "Colosseum", "Magma Village", "Underwater City", "Upper Skylands", "Fountain City"},
    ["Sea 2"] = {"Kingdom of Rose", "Cafe", "Green Zone", "Graveyard Island", "Dark Arena", "Snow Mountain", "Hot and Cold", "Cursed Ship", "Ice Castle", "Forgotten Island"},
    ["Sea 3"] = {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Haunted Castle", "Sea of Treats", "Castle on the Sea", "Tiki Outpost"}
}

-- Positions per Isla (actualizadas Octubre 2025 de fuentes como Beebom, Dexerto y Wiki)
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

-- TAB 1: ESCUDO INVISIBLE (Mejorado con optimización de Alchemy)
local ShieldTab = Window:MakeTab({Name = "🛡️ Escudo", Icon = "rbxassetid://4483345998", PremiumOnly = false})
ShieldTab:AddToggle({
    Name = "🛡️ Escudo (Aleja 3m)",
    Default = false,
    Callback = function(Value)
        Config.Shield = Value
        spawn(function()
            while Config.Shield do
                pcall(function()
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local distance = (enemy.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            if distance < 3 then
                                enemy.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                            end
                        end
                    end
                end)
                task.wait(0.05)  -- Optimizado para menos lag
            end
        end)
        Kavo:ToggleNotification({Title = "Escudo", Content = Value and "ON" or "OFF", Duration = 3})
    end    
})

-- TAB 2: TELETRANSPORTE POR SEA (Con TP suave)
local TpTab = Window:MakeTab({Name = "🚀 TP", Icon = "rbxassetid://4483345998", PremiumOnly = false})
TpTab:AddDropdown({
    Name = "🏝️ TP Isla (Sea Actual: " .. getCurrentSea() .. ")",
    Default = islands[getCurrentSea()][1],
    Options = islands[getCurrentSea()],
    Callback = function(Option)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetCFrame = positions[Option]
            TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = targetCFrame}):Play()
            Kavo:ToggleNotification({Title = "TP", Content = "TP suave a " .. Option, Duration = 3})
        else
            Kavo:ToggleNotification({Title = "Error", Content = "Personaje no cargado.", Duration = 3})
        end
    end    
})

-- TAB 3: VISUALES BRILLANTES + NOMBRES (Mejorado con ESP de Redz/Alchemy)
local VisualTab = Window:MakeTab({Name = "👁️ Visuales", Icon = "rbxassetid://4483345998", PremiumOnly = false})
VisualTab:AddToggle({
    Name = "✨ Enemigos Brillantes",
    Default = false,
    Callback = function(Value)
        for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") then
                enemy.HumanoidRootPart.Transparency = Value and 0 or 1
                enemy.HumanoidRootPart.Material = Value and Enum.Material.Neon or Enum.Material.Plastic
                enemy.HumanoidRootPart.Color = Value and Color3.fromRGB(255, 255, 0) or Color3.fromRGB(139, 139, 139)
            end
        end
        Kavo:ToggleNotification({Title = "Visual", Content = Value and "ON" or "OFF", Duration = 3})
    end    
})

VisualTab:AddToggle({
    Name = "🍇 Frutas Brillantes",
    Default = false,
    Callback = function(Value)
        for _, fruit in pairs(Workspace:GetChildren()) do
            if fruit.Name:match("Fruit") and fruit:FindFirstChild("Handle") then
                fruit.Handle.Transparency = Value and 0 or 1
                fruit.Handle.Material = Value and Enum.Material.Neon or Enum.Material.Plastic
                fruit.Handle.Color = Value and Color3.fromRGB(255, 165, 0) or Color3.fromRGB(255, 0, 0)
            end
        end
        Kavo:ToggleNotification({Title = "Visual", Content = Value and "ON" or "OFF", Duration = 3})
    end    
})

VisualTab:AddToggle({
    Name = "👤 Nombres Jugadores Visibles Siempre",
    Default = false,
    Callback = function(Value)
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                local bill = player.Character.Head:FindFirstChild("NameBillboard") or Instance.new("BillboardGui", player.Character.Head)
                bill.Name = "NameBillboard"
                bill.AlwaysOnTop = Value
                bill.Size = UDim2.new(0, 200, 0, 50)
                bill.StudsOffset = Vector3.new(0, 2, 0)
                local text = Instance.new("TextLabel", bill)
                text.BackgroundTransparency = 1
                text.Size = UDim2.new(1, 0, 1, 0)
                text.Text = player.Name
                text.TextColor3 = Color3.fromRGB(255, 255, 255)
                text.TextSize = 14
                bill.Enabled = Value
            end
        end
        Kavo:ToggleNotification({Title = "Visual", Content = Value and "ON" or "OFF", Duration = 3})
    end    
})

-- TAB 4: ATAQUE RÁPIDO (Optimizado con auto-target)
local AttackTab = Window:MakeTab({Name = "⚔️ Ataque", Icon = "rbxassetid://4483345998", PremiumOnly = false})
AttackTab:AddToggle({
    Name = "⚔️ Ataque Rápido",
    Default = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                while Value do
                    pcall(function()
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 then
                            if Config.AttackMode == "Gun" then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("EquipTool", "Gun")
                            elseif Config.AttackMode == "Fruta" then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("FruitAbility", true)
                            end
                            VirtualUser:Button1Down(Vector2.new(0,0))
                            VirtualUser:Button1Up(Vector2.new(0,0))
                        end
                    end)
                    task.wait(0.01)  -- Más rápido
                end
            end)
            Kavo:ToggleNotification({Title = "Ataque", Content = "ON", Duration = 3})
        else
            Kavo:ToggleNotification({Title = "Ataque", Content = "OFF", Duration = 3})
        end
    end    
})

AttackTab:AddDropdown({
    Name = "Modo Ataque",
    Default = "Puños",
    Options = {"Puños", "Gun", "Fruta"},
    Callback = function(Option)
        Config.AttackMode = Option
        Kavo:ToggleNotification({Title = "Ataque", Content = "Modo: " .. Option, Duration = 3})
    end    
})

-- TAB 5: VELOCIDAD SIEMPRE
local SpeedTab = Window:MakeTab({Name = "🏃 Velocidad", Icon = "rbxassetid://4483345998", PremiumOnly = false})
SpeedTab:AddSlider({
    Name = "🏃 Velocidad (16-200)",
    Min = 16,
    Max = 200,
    Default = 16,
    Color = Color3.fromRGB(255,255,255),
    Increment = 10,
    ValueName = "Speed",
    Callback = function(Value)
        LocalPlayer.Character.Humanoid.WalkSpeed = Value
        Kavo:ToggleNotification({Title = "Velocidad", Content = Value .. " Siempre", Duration = 3})
    end    
})

-- NUEVA TAB: AUTO FARM (Inspirado en Redz Hub)
local FarmTab = Window:MakeTab({Name = "🌾 Auto Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})
FarmTab:AddToggle({
    Name = "Auto Farm Level",
    Default = false,
    Callback = function(Value)
        Config.AutoFarm = Value
        spawn(function()
            while Config.AutoFarm do
                pcall(function()
                    -- Lógica simple de auto-farm: TP a enemigos cercanos y ataca (expandir según necesidad)
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                            wait(0.5)
                        end
                    end
                end)
                wait(0.1)
            end
        end)
        Kavo:ToggleNotification({Title = "Farm", Content = Value and "ON" or "OFF", Duration = 3})
    end    
})

-- NUEVA TAB: MISC (Funciones de Alchemy: Auto Rejoin, Streamer Mode, White/Black Screen, Anti AFK)
local MiscTab = Window:MakeTab({Name = "🔧 Misc (Alchemy Style)", Icon = "rbxassetid://4483345998", PremiumOnly = false})
MiscTab:AddToggle({
    Name = "🔄 Auto Rejoin",
    Default = false,
    Callback = function(Value)
        Config.AutoRejoin = Value
        if Value then
            spawn(function()
                while Config.AutoRejoin do
                    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Child)
                        if Child.Name == 'ErrorPrompt' then
                            TeleportService:Teleport(game.PlaceId, LocalPlayer)
                        end
                    end)
                    wait(1)
                end
            end)
        end
        Kavo:ToggleNotification({Title = "Rejoin", Content = Value and "ON" or "OFF", Duration = 3})
    end    
})

MiscTab:AddToggle({
    Name = "📹 Streamer Mode (Oculta Nombres)",
    Default = false,
    Callback = function(Value)
        Config.StreamerMode = Value
        local function protectName(target, change)
            for _, obj in pairs(game:GetDescendants()) do
                if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                    if string.find(obj.Text, target) then
                        obj.Text = string.gsub(obj.Text, target, change)
                    end
                end
            end
            game.DescendantAdded:Connect(function(desc)
                if desc:IsA("TextLabel") or desc:IsA("TextButton") or desc:IsA("TextBox") then
                    if string.find(desc.Text, target) then
                        desc.Text = string.gsub(desc.Text, target, change)
                    end
                end
            end)
        end
        if Value then
            protectName(LocalPlayer.Name, "[Protegido]")
            protectName(LocalPlayer.DisplayName, "[Protegido]")
        end
        Kavo:ToggleNotification({Title = "Streamer", Content = Value and "ON" or "OFF", Duration = 3})
    end    
})

MiscTab:AddToggle({
    Name = "⚪ White Screen (Reduce Lag)",
    Default = false,
    Callback = function(Value)
        Config.WhiteScreen = Value
        RunService:Set3dRenderingEnabled(not Value)
        Kavo:ToggleNotification({Title = "Screen", Content = Value and "White ON" or "OFF", Duration = 3})
    end    
})

MiscTab:AddToggle({
    Name = "⚫ Black Screen (Reduce Lag)",
    Default = false,
    Callback = function(Value)
        Config.BlackScreen = Value
        local blackGui = Instance.new("ScreenGui", game.CoreGui)
        local blackFrame = Instance.new("Frame", blackGui)
        blackFrame.Size = UDim2.new(1,0,1,0)
        blackFrame.BackgroundColor3 = Color3.new(0,0,0)
        blackFrame.Visible = Value
        Kavo:ToggleNotification({Title = "Screen", Content = Value and "Black ON" or "OFF", Duration = 3})
    end    
})

MiscTab:AddToggle({
    Name = "🚫 Anti AFK",
    Default = false,
    Callback = function(Value)
        LocalPlayer.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
            wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        end)
        Kavo:ToggleNotification({Title = "Anti AFK", Content = Value and "ON" or "OFF", Duration = 3})
    end    
})

-- BOTÓN FLOTANTE (Similar a Redz)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 60, 0, 30)
ToggleBtn.Position = UDim2.new(1, -70, 1, -40)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ToggleBtn.Text = "HUB"
ToggleBtn.TextColor3 = Color3.new(1,1,1)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 14

ToggleBtn.MouseButton1Click:Connect(function()
    Kavo:ToggleUI()
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        Kavo:ToggleUI()
    end
end)

print("🎉 v3.0 MEJORADO CARGADO! (Redz + Alchemy Features)")
Kavo:ToggleNotification({Title = "¡LISTO!", Content = "Mejoras: TP Suave, Ataque Optimizado, Auto Farm, Rejoin, Streamer, Anti AFK + Más", Duration = 5})
