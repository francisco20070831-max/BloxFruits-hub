-- Blox Fruits Hub v2.4 ACTUALIZADO - Escudo Aleja + TP por Sea + Brillantes + Nombres + Ataque Rápido + Velocidad Siempre + Comandos Admin
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")
local VirtualUser = game:GetService("VirtualUser")

print("🔥 CARGANDO v2.4 Actualizado...")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Blox Fruits Admin Hub v2.4+",
    LoadingTitle = "Cargando funciones...",
    LoadingSubtitle = "por Grok",
    ConfigurationSaving = {Enabled = true, FolderName = "BloxFruitsHub", FileName = "Config"},
    KeySystem = false
})

print("✅ Rayfield UI cargada")

local Config = {AutoFarm = false, GodMode = false, FruitSniper = false, Shield = false, AttackMode = "Fists", Speed = 16}

-- Detect Sea (1,2,3)
local function getCurrentSea()
    local pos = LocalPlayer.Character.HumanoidRootPart.Position
    if pos.X < 0 then
        return "First Sea"
    elseif pos.X < 5000 then
        return "Sea 2"
    else
        return "Sea 3"
    end
end

-- TAB 1: ADMIN COMANDOS (Botones + Cómo Escribir)
local AdminTab = Window:CreateTab("👑 Admin Comandos", 4483362458)
AdminTab:CreateSection("Comandos con Botones (Clic para Ejecutar)")

AdminTab:CreateButton({
    Name = "Kick Simulado (Botón)",
    Callback = function()
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/e kickall", "All")
        Rayfield:Notify({Title = "Admin", Content = "Kick Intentado", Duration = 3})
    end
})
AdminTab:CreateLabel("Si falla: Escribe /e kickall en chat")

AdminTab:CreateButton({
    Name = "Spawn Item (Botón)",
    Callback = function()
        ReplicatedStorage.Remotes.CommE_:FireServer("ItemDrop", "MythicalFruit")
        Rayfield:Notify({Title = "Admin", Content = "Item Spawneado", Duration = 3})
    end
})
AdminTab:CreateLabel("Si falla: Escribe /drop mythical en chat")

AdminTab:CreateButton({
    Name = "God Mode (Botón)",
    Callback = function()
        LocalPlayer.Character.Humanoid.MaxHealth = math.huge
        LocalPlayer.Character.Humanoid.Health = math.huge
        Rayfield:Notify({Title = "Admin", Content = "God Mode ON", Duration = 3})
    end
})
AdminTab:CreateLabel("Si falla: Escribe /god en chat")

print("✅ Admin Tab cargada")

-- TAB 2: ESCUDO INVISIBLE (Aleja Enemigos 3m)
local ShieldTab = Window:CreateTab("🛡️ Escudo Invisible", 4483362458)
ShieldTab:CreateSection("Escudo Aleja Enemigos")

ShieldTab:CreateToggle({
    Name = "🛡️ Escudo Invisible (Aleja 3m)",
    CurrentValue = false,
    Callback = function(Value)
        Config.Shield = Value
        if Value then
            spawn(function()
                while Config.Shield do
                    pcall(function()
                        for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                            if (enemy.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 3 then
                                enemy.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3) -- Aleja 3m
                            end
                        end
                    end)
                    wait(0.1)
                end
            end)
            Rayfield:Notify({Title = "Escudo", Content = "ON - Aleja Enemigos", Duration = 3})
        else
            Rayfield:Notify({Title = "Escudo", Content = "OFF", Duration = 3})
        end
    end
})

-- TAB 3: TELETRANSPORTE POR SEA
local TpTab = Window:CreateTab("🚀 TP por Sea", 4483362458)
TpTab:CreateSection("TP Elección (Detecta Sea)")

TpTab:CreateDropdown({
    Name = "🏝️ TP Isla (Sea Actual: " .. getCurrentSea() .. ")",
    Options = getIslasBySea(getCurrentSea()),
    CurrentOption = getIslasBySea(getCurrentSea())[1],
    Callback = function(Option)
        local positions = getPositionsByIsla(Option)
        LocalPlayer.Character.HumanoidRootPart.CFrame = positions
        Rayfield:Notify({Title = "TP", Content = "TP a " .. Option, Duration = 3})
    end
})

function getIslasBySea(sea)
    if sea == "First Sea" then
        return {"Middle Town", "Frozen Village", "Marine Ford", "Colosseum", "Dark Arena", "Sky Island"}
    elseif sea == "Sea 2" then
        return {"Kingdom of Rose", "Cafe", "Green Zone", "Graveyard", "Remote Island"}
    elseif sea == "Sea 3" then
        return {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Haunted Castle"}
    end
end

function getPositionsByIsla(isla)
    local positions = {
        ["Middle Town"] = CFrame.new(-2100, 70, -1200),
        ["Frozen Village"] = CFrame.new(1000, 10, 1000),
        ["Marine Ford"] = CFrame.new(-5000, 10, -5000),
        ["Colosseum"] = CFrame.new(-1800, 10, -1800),
        ["Dark Arena"] = CFrame.new(0, 10, 0),
        ["Sky Island"] = CFrame.new(0, 1000, 0),
        ["Kingdom of Rose"] = CFrame.new(-2500, 10, -2500),
        ["Cafe"] = CFrame.new(-380, 10, -380),
        ["Green Zone"] = CFrame.new(-2200, 10, -2200),
        ["Graveyard"] = CFrame.new(-5400, 10, -5400),
        ["Remote Island"] = CFrame.new(-6500, 10, -6500),
        ["Port Town"] = CFrame.new(-500, 10, -500),
        ["Hydra Island"] = CFrame.new(5700, 10, 5700),
        ["Great Tree"] = CFrame.new(2800, 10, 2800),
        ["Floating Turtle"] = CFrame.new(-13200, 10, -13200),
        ["Haunted Castle"] = CFrame.new(-9500, 10, -9500)
    }
    return positions[isla] or CFrame.new(0,0,0)
end

-- TAB 4: FARM
local FarmTab = Window:CreateTab("🌾 Auto Farm", 4483362458)
FarmTab:CreateSection("Auto Farm")

FarmTab:CreateToggle({
    Name = "⚔️ Auto Farm Levels",
    CurrentValue = false,
    Callback = function(Value)
        Config.AutoFarm = Value
        if Value then
            spawn(function()
                while Config.AutoFarm do
                    pcall(function()
                        for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                            if enemy:FindFirstChild("HumanoidRootPart") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                                wait(0.2)
                            end
                        end
                    end)
                    wait(0.1)
                end
            end)
            Rayfield:Notify({Title = "Farm", Content = "Auto Farm ON", Duration = 2})
        else
            Rayfield:Notify({Title = "Farm", Content = "Auto Farm OFF", Duration = 2})
        end
    end
})

FarmTab:CreateButton({
    Name = "🏝️ TP First Sea",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1600, 15, 2000)
        Rayfield:Notify({Title = "Farm", Content = "TP First Sea", Duration = 2})
    end
})

-- TAB 5: HACKS
local HackTab = Window:CreateTab("🚀 Inimaginables", 4483362458)
HackTab:CreateSection("Hacks Únicos")

HackTab:CreateToggle({
    Name = "🍇 Fruit Sniper",
    CurrentValue = false,
    Callback = function(Value)
        Config.FruitSniper = Value
        if Value then
            spawn(function()
                while Config.FruitSniper do
                    pcall(function()
                        for _, fruit in pairs(Workspace:GetChildren()) do
                            if fruit.Name:match("Fruit") and fruit:FindFirstChild("Handle") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
                                Rayfield:Notify({Title = "Hack", Content = "TP a " .. fruit.Name, Duration = 1})
                                break
                            end
                        end
                    end)
                    wait(0.5)
                end
            end)
            Rayfield:Notify({Title = "Hack", Content = "Fruit Sniper ON", Duration = 2})
        else
            Rayfield:Notify({Title = "Hack", Content = "Fruit Sniper OFF", Duration = 2})
        end
    end
})

HackTab:CreateButton({
    Name = "⏱️ Time Hack (Sea Beast)",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 300, 0)
        Rayfield:Notify({Title = "Hack", Content = "TP Sea Beast Area", Duration = 3})
    end
})

-- TAB 6: ATAQUE RÁPIDO
local AttackTab = Window:CreateTab("⚔️ Ataque Rápido", 4483362458)
AttackTab:CreateSection("Ataque Rápido (Puños/Gun/Fruta)")

AttackTab:CreateToggle({
    Name = "⚔️ Ataque Rápido (Elige Modo)",
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
                    wait(0.05) -- Rápido, visual/server
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

-- TAB 7: VISUALES
local VisualTab = Window:CreateTab("👁️ Visuales Brillantes", 4483362458)
VisualTab:CreateSection("Brillantes + Nombres")

VisualTab:CreateToggle({
    Name = "✨ Enemigos Brillantes",
    CurrentValue = false,
    Callback = function(Value)
        for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
            if Value then
                enemy.HumanoidRootPart.BrickColor = BrickColor.new("Bright yellow")
                enemy.HumanoidRootPart.Material = Enum.Material.Neon
            else
                enemy.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
                enemy.HumanoidRootPart.Material = Enum.Material.Plastic
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
                fruit.Handle.BrickColor = Value and BrickColor.new("Bright orange") or BrickColor.new("Bright red")
                fruit.Handle.Material = Value and Enum.Material.Neon or Enum.Material.Plastic
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
            if player ~= LocalPlayer and player.Character then
                player.Character.Head.NameBillboard.Enabled = Value
                player.Character.Head.NameBillboard.AlwaysOnTop = Value
                player.Character.Head.NameBillboard.DistanceUpperLimit = Value and math.huge or 100
            end
        end
        Rayfield:Notify({Title = "Visual", Content = Value and "Nombres ON" or "OFF", Duration = 3})
    end
})

-- TAB 8: VELOCIDAD SIEMPRE
local SpeedTab = Window:CreateTab("🏃 Velocidad Siempre", 4483362458)
SpeedTab:CreateSection("Velocidad Permanente")

SpeedTab:CreateSlider({
    Name = "🏃 Velocidad (16-200)",
    Range = {16, 200},
    Increment = 10,
    CurrentValue = 16,
    Callback = function(Value)
        LocalPlayer.Character.Humanoid.WalkSpeed = Value -- Siempre, no solo corriendo
        Rayfield:Notify({Title = "Velocidad", Content = Value .. " Siempre ON", Duration = 3})
    end
})

-- BOTÓN FLOTANTE
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 60, 0, 30)
ToggleBtn.Position = UDim2.new(1, -70, 1, -40)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ToggleBtn.Text = "HUB"
ToggleBtn.TextColor3 = Color3.new(1,1,1)
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

print("🎉 v2.4 ACTUALIZADO CARGADO!")
Rayfield:Notify({Title = "¡LISTO!", Content = "Escudo + TP Sea + Brillantes + Nombres + Ataque Rápido + Velocidad Siempre + Comandos Admin", Duration = 5})
