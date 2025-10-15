-- Script para Blox Fruits en Delta Executor (Place ID: 131716211654599)
-- Carga HoHo Hub v3, sin clave, optimizado al 15/10/2025

repeat wait(1) until game:IsLoaded()
repeat wait(1) until game:GetService("Players").LocalPlayer

---------/// Configuraciones Globales (Personalizables) ///---------
getgenv().skip_loading = false  -- Cambia a true para saltar la pantalla de carga
getgenv().auto_rejoin = true    -- Reúne automáticamente si hay error
getgenv().streamer_mode = false -- Oculta tu nombre (útil para streaming)
getgenv().highdebug = true      -- Activa logs detallados en consola

---------/// Verificación de Juego (Delta) ///---------
local DELTA_PLACE_ID = 131716211654599
if game.PlaceId ~= DELTA_PLACE_ID then
    warn("¡Error! Este script es para Blox Fruits en Delta (Place ID: " .. DELTA_PLACE_ID .. "). Únete al juego correcto.")
    -- Intento de teletransporte a Delta
    pcall(function()
        game:GetService("TeleportService"):Teleport(DELTA_PLACE_ID)
    end)
    return
end
print("✓ Blox Fruits (Delta) detectado. Cargando Hub...")

---------/// Auto-Execute (para reconexiones) ///---------
local function setAutoExec()
    local queue = queueonteleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport) or (delta and delta.queue_on_teleport)
    if queue then
        print("Activando Auto-Execute para reconexiones...")
        queue('loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading"))()')
    end
end
setAutoExec()

---------/// Interfaz de Carga (Opcional) ///---------
local loadingGui = nil
local function createLoadingUI()
    if getgenv().skip_loading then return end
    loadingGui = Instance.new("ScreenGui")
    loadingGui.Name = "DeltaHubLoader"
    loadingGui.Parent = game:GetService("CoreGui")
    local frame = Instance.new("Frame", loadingGui)
    frame.Size = UDim2.new(0, 350, 0, 120)
    frame.Position = UDim2.new(0.5, -175, 0.5, -60)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 10)
    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0.4, 0)
    title.BackgroundTransparency = 1
    title.Text = "Blox Fruits Delta Hub"
    title.TextColor3 = Color3.fromRGB(0, 255, 127)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    local status = Instance.new("TextLabel", frame)
    status.Name = "Status"
    status.Size = UDim2.new(1, 0, 0.6, 0)
    status.Position = UDim2.new(0, 0, 0.4, 0)
    status.BackgroundTransparency = 1
    status.Text = "Iniciando..."
    status.TextColor3 = Color3.fromRGB(255, 255, 255)
    status.TextScaled = true
    status.Font = Enum.Font.Gotham
    game:GetService("TweenService"):Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0, 350, 0, 120)}):Play()
end

local function updateStatus(text)
    if loadingGui and loadingGui:FindFirstChild("Frame") and loadingGui.Frame:FindFirstChild("Status") then
        loadingGui.Frame.Status.Text = text
    end
    if getgenv().highdebug then
        print("Status: " .. text)
    end
end

local function closeLoading()
    if loadingGui then
        game:GetService("TweenService"):Create(loadingGui.Frame, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        wait(0.5)
        loadingGui:Destroy()
    end
end

createLoadingUI()
updateStatus("Configurando entorno...")

---------/// Funciones Esenciales ///---------
-- Anti-AFK
spawn(function()
    pcall(function()
        game.Players.LocalPlayer.Idled:Connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
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
                    game:GetService("TeleportService"):Teleport(DELTA_PLACE_ID)
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
    local player = game.Players.LocalPlayer
    hideName(player.Name, "[Usuario Oculto]")
    hideName(player.DisplayName, "[Usuario Oculto]")
    updateStatus("Modo Streamer activado ✓")
end

---------/// Carga del Hub Principal ///---------
updateStatus("Cargando HoHo Hub v3 para Delta...")
local hubUrl = "https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading"
local success, err = pcall(function()
    loadstring(game:HttpGet(hubUrl))()
end)

if success then
    updateStatus("¡Hub cargado! Presiona 'H' para abrir el menú.")
    print("✓ HoHo Hub v3 cargado con éxito.")
    print("Funciones disponibles: Auto-Farm, Fruit Finder, Teleports, ESP, etc.")
    print("Tecla del menú: Presiona 'H' (o revisa la consola para otra tecla).")
else
    updateStatus("Error al cargar el Hub. Verifica conexión.")
    warn("Error al cargar el Hub: " .. tostring(err))
    print("Posible solución: Copia y pega esto en la consola:")
    print('loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading"))()')
    print("Alternativa: Busca un script actualizado en Pastebin o Discord.")
end

closeLoading()
getgenv().run_time = true
