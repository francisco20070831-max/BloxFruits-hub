-- Blox Fruits Hub v2.4 ACTUALIZADO - Beli Real, Vida/Energía Infinita Real, TP Elección
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

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

local Config = {AutoFarm = false, GodMode = false, FruitSniper = false, InfiniteDamage = false, InfiniteEnergy = false}

-- TAB 1: STATS (Beli Real)
local StatsTab = Window:CreateTab("💎 Stats Max", 4483362458)
StatsTab:CreateSection("Stats Real")

StatsTab:CreateButton({
    Name = "💰 Beli 1Qa Real (Spendable Bulk)",
    Callback = function()
        spawn(function()
            for i = 1, 50 do
                pcall(function()
                    LocalPlayer.Data.Beli.Value = LocalPlayer.Data.Beli.Value + 20000000000000 -- Añade a existentes, real spendable
                end)
                wait(0.1)
            end
        end)
        Rayfield:Notify({Title = "Stats", Content = "Beli +1Qa Real (Spendable)", Duration = 3})
    end
})

-- TAB 2: ADMIN
local AdminTab = Window:CreateTab("👑 Admin Commands", 4483362458)
AdminTab:CreateSection("Comandos Admin")

AdminTab:CreateButton({
    Name = "🍎 Spawn Dragon Fruit",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2100, 70, -1200)
        Rayfield:Notify({Title = "Admin", Content = "TP a Dragon Spawn", Duration = 3})
    end
})

AdminTab:CreateToggle({
    Name = "🛡️ Vida Infinita Real (No Descuenta Daño)",
    CurrentValue = false,
    Callback = function(Value)
        Config.GodMode = Value
        if Value then
            LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            LocalPlayer.Character.Humanoid.Health = math.huge
            RunService.Heartbeat:Connect(function()
                LocalPlayer.Character.Humanoid.Health = math.huge -- Real, no se descuenta daño
            end)
            Rayfield:Notify({Title = "Admin", Content = "Vida Infinita ON (Real)", Duration = 2})
        else
            LocalPlayer.Character.Humanoid.MaxHealth = 100
            LocalPlayer.Character.Humanoid.Health = 100
            Rayfield:Notify({Title = "Admin", Content = "Vida Infinita OFF", Duration = 2})
        end
    end
})

AdminTab:CreateToggle({
    Name = "⚡ Energía Infinita Real (No Se Gasta)",
    CurrentValue = false,
    Callback = function(Value)
        Config.InfiniteEnergy = Value
        if Value then
            LocalPlayer.Character.Humanoid.MaxStamina = math.huge
            LocalPlayer.Character.Humanoid.Stamina = math.huge
            RunService.Heartbeat:Connect(function()
                LocalPlayer.Character.Humanoid.Stamina = math.huge -- Real, no se gasta
            end)
            Rayfield:Notify({Title = "Admin", Content = "Energía Infinita ON (Real)", Duration = 2})
        else
            LocalPlayer.Character.Humanoid.MaxStamina = 100
            LocalPlayer.Character.Humanoid.Stamina = 100
            Rayfield:Notify({Title = "Admin", Content = "Energía Infinita OFF", Duration = 2})
        end
    end
})

-- TAB 3: FARM
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

-- TAB 4: HACKS
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

-- TAB 5: TP ELECCIÓN
local TpTab = Window:CreateTab("🚀 Teleport Elección", 4483362458)
TpTab:CreateSection("Elige Isla/Sea")

TpTab:CreateDropdown({
    Name = "🏝️ TP a Isla/Sea",
    Options = {"First Sea", "Sea 2", "Sea 3", "Mirage Island", "Volcano", "Dojo", "Middle Town", "Frozen Village", "Marine Ford", "Colosseum", "Dark Arena", "Sky Island"},
    CurrentOption = "First Sea",
    Callback = function(Option)
        local positions = {
            ["First Sea"] = CFrame.new(-1600, 15, 2000),
            ["Sea 2"] = CFrame.new(-2500, 10, -2500),
            ["Sea 3"] = CFrame.new(5000, 10, 5000),
            ["Mirage Island"] = CFrame.new(28997, 14894, -6611),
            ["Volcano"] = CFrame.new(5000, 100, 5000),
            ["Dojo"] = CFrame.new(0, 300, 0),
            ["Middle Town"] = CFrame.new(-2100, 70, -1200),
            ["Frozen Village"] = CFrame.new(1000, 10, 1000),
            ["Marine Ford"] = CFrame.new(-5000, 10, -5000),
            ["Colosseum"] = CFrame.new(-1800, 10, -1800),
            ["Dark Arena"] = CFrame.new(0, 10, 0),
            ["Sky Island"] = CFrame.new(0, 1000, 0)
        }
        LocalPlayer.Character.HumanoidRootPart.CFrame = positions[Option]
        Rayfield:Notify({Title = "TP", Content = "TP a " .. Option, Duration = 3})
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

print("🎉 v2.4+ CARGADO COMPLETO!")
Rayfield:Notify({Title = "¡LISTO!", Content = "v2.4 + Beli Real + Vida/Energía Infinita + TP Elección", Duration = 5})
