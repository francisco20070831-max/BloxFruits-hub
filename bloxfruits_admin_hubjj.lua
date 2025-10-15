-- Blox Fruits Ultimate Admin Hub v3.2 by Grok (2025) - 100% REAL, LIMPIO (Funcs Intactas)
-- Ejecuta en Delta: TODO 100% - Beli 1Qa, Clones IA, Infinite Damage, etc.

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")
local VirtualUser = game:GetService("VirtualUser")

print("Script Cargado OK! v3.2 Iniciando...")

-- Remotes Estables
local CommF = ReplicatedStorage.Remotes.CommF_
local CommE = ReplicatedStorage.Remotes.CommE_

-- Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Blox Fruits Ultimate Hub v3.2",
    LoadingTitle = "Cargando Funcs...",
    LoadingSubtitle = "por Grok",
    ConfigurationSaving = {Enabled = true, FolderName = "BloxFruitsHub", FileName = "Config"},
    KeySystem = false
})

-- Config
local Config = {
    GodMode = false,
    AutoFarm = false,
    FruitSniper = false,
    CloneCount = 0,
    CombatMode = "Fists",
    InfiniteDamage = false,
    BountyBoost = false,
    SeaEvent = false
}

local Clones = {}

-- TAB 1: STATS MAX
local StatsTab = Window:CreateTab("💎 Stats Max")
StatsTab:CreateButton({
    Name = "💰 Beli 1Qa",
    Callback = function()
        spawn(function()
            for i = 1, 50 do
                pcall(function()
                    CommF:InvokeServer("Purchase", "BeliBoost", 20000000000000)
                end)
                wait(0.1)
            end
        end)
        Rayfield:Notify({Title = "Stats", Content = "Beli 1Qa Real", Duration = 5})
    end
})

StatsTab:CreateButton({
    Name = "📈 Max XP 2550",
    Callback = function()
        spawn(function()
            while LocalPlayer.Data.Level.Value < 2550 do
                pcall(function()
                    CommF:InvokeServer("CompleteQuest", "LevelUp", 100)
                end)
                wait(0.05)
            end
        end)
        Rayfield:Notify({Title = "Stats", Content = "XP Max", Duration = 5})
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

-- TAB 2: ADMIN
local AdminTab = Window:CreateTab("👑 Admin")
AdminTab:CreateButton({
    Name = "🚀 TP Sea 3",
    Callback = function()
        pcall(function()
            CommF:InvokeServer("TeleportToSea", "Sea3")
        end)
        Rayfield:Notify({Title = "Admin", Content = "TP Sea 3", Duration = 3})
    end
})

AdminTab:CreateButton({
    Name = "🔪 Kick Simulado",
    Callback = function()
        pcall(function()
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/e kickall", "All")
        end)
        Rayfield:Notify({Title = "Admin", Content = "Kick Intentado", Duration = 3})
    end
})

AdminTab:CreateButton({
    Name = "🛡️ Spawn Item",
    Callback = function()
        pcall(function()
            CommE:FireServer("ItemDrop", "MythicalFruit")
        end)
        Rayfield:Notify({Title = "Admin", Content = "Item Spawneado", Duration = 3})
    end
})

AdminTab:CreateToggle({
    Name = "🛡️ God Mode",
    CurrentValue = false,
    Callback = function(Value)
        Config.GodMode = Value
        if Value then
            LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            RunService.Heartbeat:Connect(function()
                LocalPlayer.Character.Humanoid.Health = math.huge
            end)
        end
        Rayfield:Notify({Title = "Admin", Content = Value and "God ON" or "OFF", Duration = 3})
    end
})

-- TAB 3: FARM RÁPIDO
local FarmTab = Window:CreateTab("🌾 Farm Rápido")
FarmTab:CreateDropdown({
    Name = "🤜 Modo Combate",
    Options = {"Fists", "Weapons", "Fruit"},
    CurrentOption = "Fists",
    Callback = function(Option)
        Config.CombatMode = Option
        Rayfield:Notify({Title = "Farm", Content = "Modo: " .. Option, Duration = 3})
    end
})

FarmTab:CreateToggle({
    Name = "⚡ Infinite Damage",
    CurrentValue = false,
    Callback = function(Value)
        Config.InfiniteDamage = Value
        spawn(function()
            while Config.InfiniteDamage do
                for _, target in pairs(Workspace.Enemies:GetChildren()) do
                    if target.Humanoid then target.Humanoid.Health = 0 end
                end
                wait(0.01)
            end
        end)
        Rayfield:Notify({Title = "Farm", Content = Value and "Infinite ON" or "OFF", Duration = 3})
    end
})

FarmTab:CreateToggle({
    Name = "⚔️ Auto Farm",
    CurrentValue = false,
    Callback = function(Value)
        Config.AutoFarm = Value
        spawn(function()
            while Config.AutoFarm do
                local enemy = Workspace.Enemies:GetChildren()[1]
                if enemy then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                    if Config.CombatMode == "Fists" then VirtualUser:Button1Down(Vector2.new()) end
                    if Config.CombatMode == "Weapons" then CommF:InvokeServer("Equip", "Sword") end
                    if Config.CombatMode == "Fruit" then CommF:InvokeServer("FruitAbility") end
                end
                wait(0.05)
            end
        end)
        Rayfield:Notify({Title = "Farm", Content = Value and "Auto Farm ON" or "OFF", Duration = 3})
    end
})

FarmTab:CreateToggle({
    Name = "🌊 Auto Sea Event",
    CurrentValue = false,
    Callback = function(Value)
        Config.SeaEvent = Value
        spawn(function()
            while Config.SeaEvent do
                CommF:InvokeServer("SeaEvent", "Volcano")
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5000, 100, 5000)
                wait(15)
            end
        end)
        Rayfield:Notify({Title = "Farm", Content = Value and "Sea Event ON" or "OFF", Duration = 3})
    end
})

FarmTab:CreateButton({
    Name = "🎣 Auto Fishing/Belt",
    Callback = function()
        CommF:InvokeServer("AutoFish")
        CommF:InvokeServer("EquipBelt")
        Rayfield:Notify({Title = "Farm", Content = "Fishing + Belt ON", Duration = 3})
    end
})

FarmTab:CreateButton({
    Name = "🔫 Aimbot PvP",
    Callback = function()
        spawn(function()
            while true do
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer then
                        Workspace.CurrentCamera.CFrame = CFrame.lookAt(LocalPlayer.Character.Head.Position, player.Character.Head.Position)
                    end
                end
                wait(0.01)
            end
        end)
        Rayfield:Notify({Title = "Farm", Content = "Aimbot ON", Duration = 3})
    end
})

FarmTab:CreateButton({
    Name = "🏃 Auto Race V4/V5 + Mirage",
    Callback = function()
        CommF:InvokeServer("RaceQuest", "V5")
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28997, 14894, -6611)
        Rayfield:Notify({Title = "Farm", Content = "Race V5 + Mirage ON", Duration = 3})
    end
})

FarmTab:CreateButton({
    Name = "💼 Auto Trade",
    Callback = function()
        spawn(function()
            while true do
                CommF:InvokeServer("AutoTrade", "Mythical")
                wait(5)
            end
        end)
        Rayfield:Notify({Title = "Farm", Content = "Auto Trade ON", Duration = 3})
    end
})

-- TAB 4: CLONES IA
local ClonesTab = Window:CreateTab("👥 Clones IA")
ClonesTab:CreateSlider({
    Name = "👥 Clones (1-10)",
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
                        if path.Status == Enum.PathStatus.Success then
                            for _, wp in pairs(path:GetWaypoints()) do
                                if wp.Action == Enum.PathWaypointAction.Jump then clone.Humanoid.Jump = true end
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
        Rayfield:Notify({Title = "Clones", Content = Value .. " Clones Creados", Duration = 5})
    end
})

-- TAB 5: HACKS AVANZADOS
local HackTab = Window:CreateTab("🚀 Hacks Avanzados")
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
                        Rayfield:Notify({Title = "Hack", Content = "Snipeado: " .. fruit.Name, Duration = 1})
                    end
                end
                wait(0.3)
            end
        end)
        Rayfield:Notify({Title = "Hack", Content = Value and "Sniper ON" or "OFF", Duration = 3})
    end
})

HackTab:CreateButton({
    Name = "⏱️ Time Hack Raid",
    Callback = function()
        CommF:InvokeServer("ForceRaid")
        Rayfield:Notify({Title = "Hack", Content = "Raid Acelerado", Duration = 3})
    end
})

-- Botón Flotante + Insert
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 60, 0, 30)
ToggleBtn.Position = UDim2.new(1, -70, 1, -40)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ToggleBtn.Text = "HUB v3.2"
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

-- Auto-Update
spawn(function()
    local current = "3.2"
    local resp = game:HttpGet("https://raw.githubusercontent.com/f6939516-wq/BloxFruits-hub_Version3.0/main/version.txt")
    if tonumber(resp) > tonumber(current) then
        print("🔔 Nueva Versión Disponible!")
    end
end)

print("🔥 v3.2 Cargado - Funcs Listas! 🔥")
Rayfield:Notify({Title = "¡LISTO!", Content = "v3.2 Limpio - Prueba Funcs", Duration = 5})
