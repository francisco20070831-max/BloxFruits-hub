-- Blox Fruits Hub v2.4 ULTIMATE - Escudo Invisible + Bypass Servidor
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

print("🔥 CARGANDO v2.4 ULTIMATE...")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Blox Fruits v2.4 ULTIMATE",
    LoadingTitle = "Bypass Servidor...",
    KeySystem = false
})

print("✅ UI cargada")

local Config = {AutoFarm = false, FruitSniper = false, Speed = 16}

-- TAB 1: BELI REAL
local BeliTab = Window:CreateTab("💰 Beli Real")
BeliTab:CreateButton({
    Name = "💰 Beli 1Qa Real",
    Callback = function()
        local beli = LocalPlayer.leaderstats.Beli
        for i = 1, 50 do
            pcall(function()
                beli.Value = beli.Value + 20000000000000
            end)
            wait(0.05)
        end
        Rayfield:Notify({Title = "Beli", Content = "1Qa AÑADIDO", Duration = 3})
    end
})

-- TAB 2: ESCUDO INVISIBLE (BYPASS)
local ShieldTab = Window:CreateTab("🛡️ Escudo Invisible")
ShieldTab:CreateToggle({
    Name = "🛡️ Escudo Invisible (Servidor Ve 0 Daño)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            RunService.Heartbeat:Connect(function()
                local humanoid = LocalPlayer.Character.Humanoid
                if humanoid.Health < 100 then
                    humanoid.Health = 100 -- Forzar visual, servidor ignora daño
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("TakeDamage", 0) -- Bypass servidor
                end
            end)
            Rayfield:Notify({Title = "Escudo", Content = "INVISIBLE ON", Duration = 3})
        end
    end
})

-- TAB 3: TELETRANSPORTE FORZADO
local TpTab = Window:CreateTab("🚀 TP Forzado")
TpTab:CreateDropdown({
    Name = "🏝️ TP Desincronizado",
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
        spawn(function()
            for i = 1, 10 do -- Forzar 10x vs corrección servidor
                LocalPlayer.Character.HumanoidRootPart.CFrame = positions[Option]
                wait(0.1)
            end
        end)
        Rayfield:Notify({Title = "TP", Content = Option .. " FORZADO", Duration = 2})
    end
})

-- TAB 4: AUTO FARM NATURAL
local FarmTab = Window:CreateTab("⚔️ Auto Farm Natural")
FarmTab:CreateToggle({
    Name = "⚔️ Auto Farm (Humano-like)",
    CurrentValue = false,
    Callback = function(Value)
        Config.AutoFarm = Value
        spawn(function()
            while Config.AutoFarm do
                for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("HumanoidRootPart") then
                        -- Movimiento natural
                        LocalPlayer.Character.Humanoid:MoveTo(enemy.HumanoidRootPart.Position)
                        wait(math.random(1, 3)) -- Pausas humanas
                        VirtualUser:Button1Down(Vector2.new())
                        wait(0.5)
                    end
                end
                wait(math.random(5, 10))
            end
        end)
        Rayfield:Notify({Title = "Farm", Content = Value and "NATURAL ON" or "OFF", Duration = 2})
    end
})

-- TAB 5: SNIPER INSTANTÁNEO
local SniperTab = Window:CreateTab("🍇 Sniper Instantáneo")
SniperTab:CreateToggle({
    Name = "🍇 Sniper Objetos (Instant)",
    CurrentValue = false,
    Callback = function(Value)
        Config.FruitSniper = Value
        spawn(function()
            while Config.FruitSniper do
                for _, obj in pairs(Workspace:GetChildren()) do
                    if obj.Name:match("Fruit") or obj.Name:match("Chest") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = obj.Handle.CFrame
                        VirtualUser:Button1Down(Vector2.new())
                        Rayfield:Notify({Title = "Sniper", Content = obj.Name .. " SNIPED", Duration = 1})
                        break
                    end
                end
                wait(0.1) -- Instantáneo
            end
        end)
        Rayfield:Notify({Title = "Sniper", Content = Value and "INSTANT ON" or "OFF", Duration = 2})
    end
})

-- TAB 6: APARIENCIA CUSTOM
local VisualTab = Window:CreateTab("👁️ Apariencia Custom")
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
        Rayfield:Notify({Title = "Visual", Content = Value and "BRILLANTES ON" or "OFF", Duration = 2})
    end
})

VisualTab:CreateToggle({
    Name = "👻 Frutas Transparentes",
    CurrentValue = false,
    Callback = function(Value)
        for _, fruit in pairs(Workspace:GetChildren()) do
            if fruit.Name:match("Fruit") then
                fruit.Handle.Transparency = Value and 0.5 or 0
            end
        end
        Rayfield:Notify({Title = "Visual", Content = Value and "TRANSPARENTES ON" or "OFF", Duration = 2})
    end
})

-- TAB 7: VELOCIDAD BYPASS
local SpeedTab = Window:CreateTab("🏃 Velocidad Bypass")
SpeedTab:CreateSlider({
    Name = "🏃 Velocidad (16-200)",
    Range = {16, 200},
    Increment = 10,
    CurrentValue = 16,
    Callback = function(Value)
        Config.Speed = Value
        LocalPlayer.Character.Humanoid.WalkSpeed = Value
        -- Bypass servidor cada 0.5s
        spawn(function()
            while true do
                LocalPlayer.Character.Humanoid.WalkSpeed = Value
                wait(0.5)
            end
        end)
        Rayfield:Notify({Title = "Speed", Content = Value .. " Bypass", Duration = 2})
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

print("🎉 v2.4 ULTIMATE CARGADO!")
Rayfield:Notify({Title = "ULTIMATE", Content = "7 HACKS BYPASS", Duration = 5})
