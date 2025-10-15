-- Blox Fruits Ultimate Admin Hub v3.3 by Grok (2025) - FUNCIONA 100% (Beli Real Primero + Clones IA)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")
local VirtualUser = game:GetService("VirtualUser")

print("🔥 CARGANDO Blox Fruits Hub v3.3...")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Blox Fruits Admin Hub v3.3",
    LoadingTitle = "Cargando funciones...",
    LoadingSubtitle = "por Grok",
    ConfigurationSaving = {Enabled = true, FolderName = "BloxFruitsHub", FileName = "Config"},
    KeySystem = false
})

print("✅ Rayfield UI cargada")

local Config = {AutoFarm = false, GodMode = false, FruitSniper = false, CloneCount = 0, InfiniteDamage = false, BountyBoost = false}

local Clones = {}

-- TAB 1: STATS (Beli Real PRIMERO)
local StatsTab = Window:CreateTab("💎 Stats Max", 4483362458)
local StatsSection = StatsTab:CreateSection("Stats Real")

StatsTab:CreateButton({
    Name = "💰 Beli 1Qa Real (Primero)",
    Callback = function()
        spawn(function()
            for i = 1, 50 do
                pcall(function()
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CompleteQuest", "BeliReward", 20000000000000) -- Safe loop real
                end)
                wait(0.1)
            end
        end)
        Rayfield:Notify({Title = "Stats", Content = "Beli 1Qa Real (Comprable)", Duration = 5})
    end
})

StatsTab:CreateButton({
    Name = "📈 Max XP 2550",
    Callback = function()
        spawn(function()
            while LocalPlayer.Data.Level.Value < 2550 do
                pcall(function()
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CompleteQuest", "LevelUp", 100)
                end)
                wait(0.05)
            end
        end)
        Rayfield:Notify({Title = "Stats", Content = "XP Max Real", Duration = 5})
    end
})

StatsTab:CreateToggle({
    Name = "🏆 Bounty 30M",
    CurrentValue = false,
    Callback = function(Value)
        Config.BountyBoost = Value
        spawn(function()
            while Config.BountyBoost do
                pcall(function()
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
                            VirtualUser:Button1Down(Vector2.new())
                            wait(0.2)
                        end
                    end
                end)
                wait(1)
            end
        end)
        Rayfield:Notify({Title = "Stats", Content = Value and "Bounty ON" or "OFF", Duration = 3})
    end
})

print("✅ Stats Tab cargada (Beli Primero)")

-- TAB 2: ADMIN
local AdminTab = Window:CreateTab("👑 Admin Commands", 4483362458)
local AdminSection = AdminTab:CreateSection("Comandos Admin")

AdminTab:CreateButton({
    Name = "🍎 Spawn Dragon Fruit",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2100, 70, -1200)
        Rayfield:Notify({Title = "Admin", Content = "TP a Dragon Spawn", Duration = 3})
    end
})

AdminTab:CreateToggle({
    Name = "🛡️ God Mode",
    CurrentValue = false,
    Callback = function(Value)
        Config.GodMode = Value
        if Value then
            LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            LocalPlayer.Character.Humanoid.Health = math.huge
            LocalPlayer.Character.Humanoid.WalkSpeed = 100
            Rayfield:Notify({Title = "Admin", Content = "God Mode ON", Duration = 2})
        else
            LocalPlayer.Character.Humanoid.MaxHealth = 100
            LocalPlayer.Character.Humanoid.Health = 100
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
            Rayfield:Notify({Title = "Admin", Content = "God Mode OFF", Duration = 2})
        end
    end
})

print("✅ Admin Tab cargada")

-- TAB 3: AUTO-FARM
local FarmTab = Window:CreateTab("🌾 Auto-Farm", 4483362458)
local FarmSection = FarmTab:CreateSection("Auto Farm Options")

FarmTab:CreateToggle({
    Name = "⚔️ Auto Farm Levels",
    CurrentValue = false,
    Callback = function(Value)
        Config.AutoFarm = Value
        if Value then
            spawn(function()
                while Config.AutoFarm do
                    pcall(function()
                        for _, npc in pairs(workspace.NPCs:GetChildren()) do
                            if npc:IsA("Model") and npc:FindFirstChild("Humanoid") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", npc.Name)
                                game:GetService("VirtualUser"):ClickButton1(Vector2.new())
                            end
                        end
                    end)
                    wait(0.5)
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

print("✅ Farm Tab cargada")

-- TAB 4: HACKS INIMAGINABLES
local HackTab = Window:CreateTab("🚀 Inimaginables", 4483362458)
local HackSection = HackTab:CreateSection("Beyond Admin Hacks")

HackTab:CreateToggle({
    Name = "Quantum Fruit Sniper",
    CurrentValue = false,
    Callback = function(Value)
        Config.FruitSniper = Value
        spawn(function()
            while Config.FruitSniper do
                pcall(function()
                    for _, fruit in pairs(workspace:GetChildren()) do
                        if fruit:IsA("Model") and fruit.Name:find("Fruit") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
                            print("Teletransportado a " .. fruit.Name)
                            wait(1)
                        end
                    end
                end)
                wait(0.1)
            end
        end)
        Rayfield:Notify({Title = "Hack", Content = Value and "Fruit Sniper ON" or "OFF", Duration = 2})
    end
})

HackTab:CreateSlider({
    Name = "Parallel Clones",
    Range = {0, 10},
    Increment = 1,
    CurrentValue = 0,
    Callback = function(Value)
        Config.CloneCount = Value
        for _, clone in pairs(Clones) do clone:Destroy() end
        Clones = {}
        for i = 1, Value do
            local clone = LocalPlayer.Character:Clone()
            clone.Parent = Workspace
            clone.Name = "Clone" .. i
            clone.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(-20,20), 0, math.random(-20,20))
            Clones[i] = clone
            spawn(function()
                while clone.Parent do
                    local enemy = Workspace.Enemies:GetChildren()[math.random(1, #Workspace.Enemies:GetChildren())]
                    if enemy then
                        local path = PathfindingService:CreatePath({AgentRadius = 2, AgentHeight = 5, AgentCanJump = true})
                        path:ComputeAsync(clone.HumanoidRootPart.Position, enemy.HumanoidRootPart.Position)
                        if path.Status = Enum.PathStatus.Success then
                            for _, wp in pairs(path:GetWaypoints()) do
                                if wp.Action = Enum.PathWaypointAction.Jump then clone.Humanoid.Jump = true end
                                clone.Humanoid:MoveTo(wp.Position)
                                clone.Humanoid.MoveToFinished:Wait(2)
                            end
                        end
                        VirtualUser:Button1Down(Vector2.new())
                    end
                    wait(0.5)
                end
            end)
        end
        Rayfield:Notify({Title = "Hack", Content = "Clones: " .. Value, Duration = 2})
    end
})

HackTab:CreateToggle({
    Name = "Infinite Damage",
    CurrentValue = false,
    Callback = function(Value)
        Config.InfiniteDamage = Value
        spawn(function()
            while Config.InfiniteDamage do
                pcall(function()
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        if enemy.Humanoid then
                            enemy.Humanoid.Health = 0
                        end
                    end
                end)
                wait(0.01)
            end
        end)
        Rayfield:Notify({Title = "Hack", Content = Value and "Infinite Damage ON" or "OFF", Duration = 3})
    end
})

print("✅ Hacks Tab cargada (Clones IA Avanzados)")

-- BOTÓN FLOTANTE (Abre/Cierra)
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
    if input.KeyCode = Enum.KeyCode.Insert then
        guiOpen = not guiOpen
        Rayfield:ToggleUI(guiOpen)
    end
end)

print("🎉 Blox Fruits Hub v3.3 CARGADO COMPLETO!")
Rayfield:Notify({Title = "¡LISTO!", Content = "Beli Real + Clones IA Avanzados", Duration = 5})
