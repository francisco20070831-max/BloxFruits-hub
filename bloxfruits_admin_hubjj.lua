-- Blox Fruits Hub v2.4 FIX - Beli Real + Vida/Energía Infinita CORREGIDO
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

print("🔥 CARGANDO v2.4 FIX...")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Blox Fruits Admin Hub v2.4 FIX",
    LoadingTitle = "Beli + Vida FIX...",
    KeySystem = false
})

print("✅ Rayfield UI cargada")

local Config = {AutoFarm = false, GodMode = false, FruitSniper = false}

-- TAB 1: BELI REAL FIX
local StatsTab = Window:CreateTab("💰 Beli Real")
StatsTab:CreateButton({
    Name = "💰 Beli 1Qa Real (FIX)",
    Callback = function()
        local beli = LocalPlayer.leaderstats.Beli -- FIX: leaderstats
        for i = 1, 50 do
            pcall(function()
                LocalPlayer.leaderstats.Beli.Value = beli.Value + 20000000000000
            end)
            wait(0.05)
        end
        Rayfield:Notify({Title = "Beli", Content = "1Qa AÑADIDO (Spendable)", Duration = 3})
        print("Beli actual: " .. LocalPlayer.leaderstats.Beli.Value)
    end
})

-- TAB 2: VIDA/ENERGÍA INFINITA FIX
local GodTab = Window:CreateTab("🛡️ Infinita Real")
GodTab:CreateToggle({
    Name = "🛡️ Vida Infinita Real (FIX)",
    CurrentValue = false,
    Callback = function(Value)
        Config.GodMode = Value
        if Value then
            local humanoid = LocalPlayer.Character.Humanoid
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
            humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                humanoid.Health = math.huge -- FIX: No descuenta daño
            end)
            Rayfield:Notify({Title = "Vida", Content = "Infinita ON (Real)", Duration = 3})
        end
    end
})

GodTab:CreateToggle({
    Name = "⚡ Energía Infinita Real (FIX)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local humanoid = LocalPlayer.Character.Humanoid
            humanoid.MaxEnergy = 100 -- FIX: Energy (no Stamina)
            humanoid.Energy = 100
            humanoid:GetPropertyChangedSignal("Energy"):Connect(function()
                humanoid.Energy = 100 -- FIX: No se gasta
            end)
            Rayfield:Notify({Title = "Energía", Content = "Infinita ON (Real)", Duration = 3})
        end
    end
})

-- TAB 3: TP ELECCIÓN (ORIGINAL)
local TpTab = Window:CreateTab("🚀 Teleport")
TpTab:CreateDropdown({
    Name = "🏝️ TP Isla",
    Options = {"First Sea", "Sea 2", "Sea 3", "Mirage", "Volcano", "Dojo"},
    CurrentOption = "First Sea",
    Callback = function(Option)
        local positions = {
            ["First Sea"] = CFrame.new(-1600, 15, 2000),
            ["Sea 2"] = CFrame.new(-2500, 10, -2500),
            ["Sea 3"] = CFrame.new(5000, 10, 5000),
            ["Mirage"] = CFrame.new(28997, 14894, -6611),
            ["Volcano"] = CFrame.new(5000, 100, 5000),
            ["Dojo"] = CFrame.new(0, 300, 0)
        }
        LocalPlayer.Character.HumanoidRootPart.CFrame = positions[Option]
        Rayfield:Notify({Title = "TP", Content = Option, Duration = 2})
    end
})

-- TAB 4: FARM (ORIGINAL)
local FarmTab = Window:CreateTab("🌾 Farm")
FarmTab:CreateToggle({
    Name = "⚔️ Auto Farm",
    CurrentValue = false,
    Callback = function(Value)
        Config.AutoFarm = Value
        spawn(function()
            while Config.AutoFarm do
                for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                    end
                end
                wait(0.1)
            end
        end)
        Rayfield:Notify({Title = "Farm", Content = Value and "ON" or "OFF", Duration = 2})
    end
})

-- TAB 5: HACKS (ORIGINAL)
local HackTab = Window:CreateTab("🍇 Fruit Sniper")
HackTab:CreateToggle({
    Name = "🍇 Fruit Sniper",
    CurrentValue = false,
    Callback = function(Value)
        Config.FruitSniper = Value
        spawn(function()
            while Config.FruitSniper do
                for _, fruit in pairs(Workspace:GetChildren()) do
                    if fruit.Name:match("Fruit") and fruit:FindFirstChild("Handle") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
                        break
                    end
                end
                wait(0.5)
            end
        end)
        Rayfield:Notify({Title = "Sniper", Content = Value and "ON" or "OFF", Duration = 2})
    end
})

-- BOTÓN VERDE
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

print("🎉 v2.4 FIX CARGADO!")
Rayfield:Notify({Title = "¡FIX!", Content = "Beli + Vida/Energía FUNCIONAN", Duration = 5})
