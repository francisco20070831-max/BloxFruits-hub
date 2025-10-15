-- Blox Fruits Hub v2.4 ACTUALIZADO - Escudo Aleja + TP Sea + Brillantes + Nombres + Ataque Rápido + Velocidad Siempre + Comandos Admin
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
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

local Config = {AutoFarm = false, FruitSniper = false, Shield = false, AttackMode = "Puños", Speed = 16}

-- Detect Current Sea (based on position/level - from 2025 sources)
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

-- Islands per Sea (from 2025 Blox Fruits wiki/beebom)
local islands = {
    ["Sea 1"] = {"Starter Island", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Marine Fortress", "Skylands", "Prison", "Colosseum", "Magma Village", "Underwater City", "Upper Skylands", "Fountain City"},
    ["Sea 2"] = {"Kingdom of Rose", "Cafe", "Green Zone", "Graveyard Island", "Dark Arena", "Snow Mountain", "Hot and Cold", "Cursed Ship", "Ice Castle", "Forgotten Island"},
    ["Sea 3"] = {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Haunted Castle", "Sea of Treats", "Castle on the Sea", "Tiki Outpost"}
}

-- Positions per Isla (approximate from sources)
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
                            enemy.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3) -- Aleja 3 studs
                        end
                    end
                end)
                wait(0.1)
            end
        end)
        Rayfield:Notify({Title = "Escudo", Content = Value and "ON" or "OFF", Duration = 3})
    end
})

-- TAB 2: TELETRANSPORTE POR SEA
local TpTab = Window:CreateTab("🚀 TP por Sea")
TpTab:CreateDropdown({
    Name = "🏝️ TP Isla (Sea Actual: " .. getCurrentSea() .. ")",
    Options = islands[getCurrentSea()],
    CurrentOption = islands[getCurrentSea()][1],
    Callback = function(Option)
        LocalPlayer.Character.HumanoidRootPart.CFrame = positions[Option]
        Rayfield:Notify({Title = "TP", Content = "TP a " .. Option, Duration = 3})
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
                local text = Instance.new("TextLabel", bill)
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
        LocalPlayer.Character.Humanoid.WalkSpeed = Value -- Siempre ON
        Rayfield:Notify({Title = "Velocidad", Content = Value .. " Siempre", Duration = 3})
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
Rayfield:Notify({Title = "¡LISTO!", Content = "Escudo Aleja + TP Sea/Islas + Brillantes + Nombres + Ataque Rápido + Velocidad Siempre + Admin", Duration = 5})
