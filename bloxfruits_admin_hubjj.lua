repeat wait(1) until game:IsLoaded()
repeat wait(1) until game:GetService("Players").LocalPlayer

---------/// Set All Config to Global ///---------

getgenv().skip_loading = skip_loading or false
getgenv().disable_auto_exec = disable_auto_exec or false
getgenv().mute_sound = mute_sound or false
getgenv().whitescreen = whitescreen or false
getgenv().blackscreen = blackscreen or false
getgenv().auto_rejoin = auto_rejoin or false
getgenv().streamer_mode = streamer_mode or false
getgenv().fully_rejoin = fully_rejoin or false
getgenv().setting = setting or nil
getgenv().avoid_player = avoid_player or nil
getgenv().highdebug = highdebug or false

---------/// Set Necessary Function ///---------

local setAutoExec = function()
    if not disable_auto_exec and not already_set_auto_exec then
        xpcall(function()
            local queueonteleport = queueonteleport or queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
            if queueonteleport then
                print("Set Auto Execute\n")
                local rawsetting = 'getgenv().json_setting=nil;'
                if setting and typeof(setting) == 'table' then
                    rawsetting = string.format('getgenv().json_setting=[=[%s]=];',
                        tostring(game:GetService("HttpService"):JSONEncode(setting)))
                end
                local raw_avoidplayer = 'getgenv().json_avoid_player=nil;'
                if avoid_player and typeof(avoid_player) == 'table' and #avoid_player > 0 then
                    raw_avoidplayer = string.format('getgenv().json_avoid_player=[=[%s]=];',
                        tostring(game:GetService("HttpService"):JSONEncode(avoid_player)))
                end
                queueonteleport(string.format('%s%sgetgenv().cometeleport=true;getgenv().highdebug=%s;mute_sound=%s;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/gateway.luau"))()',
                    rawsetting, raw_avoidplayer, tostring(highdebug), tostring(mute_sound), tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading)))
            end
            getgenv().already_set_auto_exec = true
        end, function(err)
            warn(string.format("Auto execute function error %s\n", err))
        end)
    end
end

---------/// Set Auto Execute ///---------

setAutoExec()

---------/// Check Environment ///---------

if cometeleport then print('Auto Execute Active') end
local waiting = (game.GameId == 994732206 and 0) or 4.1957
if cometeleport then task.wait(waiting) end

type array<I,V> = {[I]: V}

---------/// Wait For Load ///---------

local __f = {
    ['__game'] = function()
        if game.GameId == 994732206 then
            return "v4/loaders/311ad7329b80c2117f4bdbf46582dcc6.lua" -- Blox Fruits
        else
            return "v4/loaders/fd6e9298c37fd63d2c6d3d979ea55516.lua" -- Universal
        end
    end,
    ['__load'] = function(s)
        (load or loadstring)(game:HttpGet(s))()
    end,
    ['__ismobile'] = function()
        local uis = game:GetService("UserInputService")
        if uis.TouchEnabled and not uis.KeyboardEnabled and not uis.MouseEnabled then return true
        elseif not uis.TouchEnabled and uis.KeyboardEnabled and uis.MouseEnabled then return false end
    end,
    ['__executor'] = function()
        return tostring(identifyexecutor())
    end
}

---------/// Check Executor ///---------

local isExecutors = function(txt)
    local exec = string.lower(__f['__executor']())
    return exec == tostring(txt) or string.find(exec, tostring(txt))
end

print(string.format("\nEXECUTOR DETECTED : %s", __f['__executor']()))
if hookfunction then print("✅ Support [HOOKFUNCTION]") else warn("❌ Not Support [HOOKFUNCTION]") end
if hookmetamethod then print("✅ Support [HOOKMETAMETHOD]") else warn("❌ Not Support [HOOKMETAMETHOD]") end
if writefile then print("✅ Support [WRITEFILE]") else warn("❌ Not Support [WRITEFILE]") end
if readfile then print("✅ Support [READFILE]") else warn("❌ Not Support [READFILE]") end
if getconnections then print("✅ Support [GETCONNECTION]") else warn("❌ Not Support [GETCONNECTION]") end
if (request or http_request) then print("✅ Support [REQUEST]\n") else warn("❌ Not Support [REQUEST]\n") end

---------/// Old Script Config ///---------

_G.Config = setting or _G.Config

---------/// Disable Debug File ///---------

getgenv().diableFile = true

---------/// User-Interface for Loading ///---------

local Loading = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Windows = Instance.new("Folder")
local Window1 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local Window2 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local Window3 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")
local Window4 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local TextLabel_4 = Instance.new("TextLabel")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")

if not skip_loading then
    Loading.Name = "Loading"
    Loading.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Frame.Parent = Loading
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.5, 0, 0.499389499, 0)
    Frame.Size = UDim2.new(0, 0, 0, 0)
    UICorner.Parent = Frame
    Windows.Name = "Windows"
    Windows.Parent = Frame
    Window1.Name = "Window1"
    Window1.Parent = Windows
    Window1.AnchorPoint = Vector2.new(0.5, 0.5)
    Window1.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window1.BackgroundTransparency = 0.600
    Window1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window1.BorderSizePixel = 0
    Window1.Position = UDim2.new(0.411275715, 0, 0.26413402, 0)
    Window1.Size = UDim2.new(0, 30, 0, 30)
    Window1.Visible = false
    UICorner_2.CornerRadius = UDim.new(0, 4)
    UICorner_2.Parent = Window1
    TextLabel.Parent = Window1
    TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.Text = "A"
    TextLabel.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel.TextSize = 24.000
    Window2.Name = "Window2"
    Window2.Parent = Windows
    Window2.AnchorPoint = Vector2.new(0.5, 0.5)
    Window2.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window2.BackgroundTransparency = 0.600
    Window2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window2.BorderSizePixel = 0
    Window2.Position = UDim2.new(0.581891835, 0, 0.26413402, 0)
    Window2.Size = UDim2.new(0, 30, 0, 30)
    Window2.Visible = false
    UICorner_3.CornerRadius = UDim.new(0, 4)
    UICorner_3.Parent = Window2
    TextLabel_2.Parent = Window2
    TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.BorderSizePixel = 0
    TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
    TextLabel_2.Font = Enum.Font.FredokaOne
    TextLabel_2.Text = "C"
    TextLabel_2.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel_2.TextSize = 24.000
    Window3.Name = "Window3"
    Window3.Parent = Windows
    Window3.AnchorPoint = Vector2.new(0.5, 0.5)
    Window3.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window3.BackgroundTransparency = 0.600
    Window3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window3.BorderSizePixel = 0
    Window3.Position = UDim2.new(0.581891835, 0, 0.5368613, 0)
    Window3.Size = UDim2.new(0, 30, 0, 30)
    Window3.Visible = false
    UICorner_4.CornerRadius = UDim.new(0, 4)
    UICorner_4.Parent = Window3
    TextLabel_3.Parent = Window3
    TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 1.000
    TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_3.BorderSizePixel = 0
    TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel_3.Size = UDim2.new(1, 0, 1, 0)
    TextLabel_3.Font = Enum.Font.FredokaOne
    TextLabel_3.Text = "1.7"
    TextLabel_3.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel_3.TextSize = 20.000
    Window4.Name = "Window4"
    Window4.Parent = Windows
    Window4.AnchorPoint = Vector2.new(0.5, 0.5)
    Window4.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window4.BackgroundTransparency = 0.600
    Window4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window4.BorderSizePixel = 0
    Window4.Position = UDim2.new(0.411275715, 0, 0.5368613, 0)
    Window4.Size = UDim2.new(0, 30, 0, 30)
    Window4.Visible = false
    UICorner_5.CornerRadius = UDim.new(0, 4)
    UICorner_5.Parent = Window4
    TextLabel_4.Parent = Window4
    TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_4.BackgroundTransparency = 1.000
    TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_4.BorderSizePixel = 0
    TextLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel_4.Size = UDim2.new(1, 0, 1, 0)
    TextLabel_4.Font = Enum.Font.FredokaOne
    TextLabel_4.Text = "M"
    TextLabel_4.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel_4.TextSize = 24.000
    TextLabel_5.Parent = Frame
    TextLabel_5.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_5.BackgroundTransparency = 1.000
    TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_5.BorderSizePixel = 0
    TextLabel_5.Position = UDim2.new(0.496965468, 0, 0.757293224, 0)
    TextLabel_5.Size = UDim2.new(0, 179, 0, 40)
    TextLabel_5.Font = Enum.Font.GothamBold
    TextLabel_5.Text = "Loading..."
    TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_5.TextSize = 12.000
    TextLabel_5.TextWrapped = true
    TextLabel_5.TextTransparency = 1
    TextLabel_6.Parent = Frame
    TextLabel_6.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_6.BackgroundTransparency = 1.000
    TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_6.BorderSizePixel = 0
    TextLabel_6.Position = UDim2.new(0.500426292, 0, 0.856181602, 0)
    TextLabel_6.Size = UDim2.new(0, 210, 0, 32)
    TextLabel_6.Font = Enum.Font.GothamBold
    TextLabel_6.Text = "Power By Script"
    TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_6.TextTransparency = 1
    TextLabel_6.TextSize = 10.000
    TextLabel_6.TextWrapped = true
    TextLabel_6.RichText = true

    ---------/// Pop-Up User-Interface ///---------

    game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 21, 0, 13)}):Play();task.wait(0.3)
    game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 21, 0, 132)}):Play();task.wait(0.3)
    game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 211, 0, 132)}):Play();task.wait(0.3)
    Window1.Visible = true;task.wait(0.2);Window2.Visible = true;task.wait(0.2);Window3.Visible = true;task.wait(0.2);Window4.Visible = true;task.wait(0.2)
    game:GetService('TweenService'):Create(TextLabel_5,TweenInfo.new(0.2),{TextTransparency = 0}):Play();task.wait(0.2)
    game:GetService('TweenService'):Create(TextLabel_6,TweenInfo.new(0.2),{TextTransparency = 0.27}):Play();task.wait(0.4)

    ---------/// Window Loading ///---------

    task.spawn(function() while true do task.wait()
        game:GetService('TweenService'):Create(Window1,TweenInfo.new(0.3),{
            BackgroundTransparency = 0}):Play();game:GetService('TweenService'):Create(Window4,TweenInfo.new(0.3),{
            BackgroundTransparency = 0.6}):Play();task.wait(0.47);game:GetService('TweenService'):Create(Window2,TweenInfo.new(0.3),{
            BackgroundTransparency = 0}):Play();game:GetService('TweenService'):Create(Window1,TweenInfo.new(0.3),{
            BackgroundTransparency = 0.6}):Play();task.wait(0.47);game:GetService('TweenService'):Create(Window3,TweenInfo.new(0.3),{
            BackgroundTransparency = 0}):Play();game:GetService('TweenService'):Create(Window2,TweenInfo.new(0.3),{
            BackgroundTransparency = 0.6}):Play();task.wait(0.47);game:GetService('TweenService'):Create(Window4,TweenInfo.new(0.3),{
            BackgroundTransparency = 0}):Play();game:GetService('TweenService'):Create(Window3,TweenInfo.new(0.3),{
            BackgroundTransparency = 0.6}):Play();task.wait(0.47)
    end;end)
end

---------/// Function for Update User-Interface ///---------

local updateStatus = function(txt)
    if not skip_loading then
        TextLabel_5.Text = txt .. "..."
    end
end

local closeLoading = function()
    if not skip_loading then
        game:GetService('TweenService'):Create(TextLabel_6,TweenInfo.new(0.2),{TextTransparency = 1}):Play();task.wait(0.2)
        game:GetService('TweenService'):Create(TextLabel_5,TweenInfo.new(0.2),{TextTransparency = 1}):Play();task.wait(0.2)
        Window4.Visible = false;task.wait(0.2);Window3.Visible = false;task.wait(0.2);Window2.Visible = false;task.wait(0.2);Window1.Visible = false;task.wait(0.2)
        game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 21, 0, 132)}):Play();task.wait(0.3)
        game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 21, 0, 13)}):Play();task.wait(0.3)
        game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 0, 0, 0)}):Play();task.wait(0.3);Frame.Visible = false
    end
end

---------/// Convert Json Config to Normal Config ///---------

updateStatus("Converting Json Data")

xpcall(function()
    if not setting and json_setting then
        getgenv().setting = game:GetService("HttpService"):JSONDecode(json_setting)
    end
    if not avoid_player and json_avoid_player then
        getgenv().avoid_player = game:GetService("HttpService"):JSONDecode(json_avoid_player)
    end
end, function(err)
    warn(string.format("Convert json function error %s\n", err))
end)

---------/// Avoid Players ///---------

local hopServer = function()
    local req = (request or http_request)({Url = string.format('https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true', game.PlaceId)})
    local body = game:GetService('HttpService'):JSONDecode(req.Body)
    if body and body.data then
        for i, v in next, body.data do
            if type(v) == 'table' and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                task.wait(0.2)
                game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
            end
        end
    end
end

xpcall(function()
    if avoid_player and typeof(avoid_player) == 'table' then
        task.spawn(function()
            while #avoid_player > 0 do task.wait(2)
                for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                    if table.find(avoid_player, v.UserId) then
                        warn(string.format('Found User: %s (%d)\nTry to Hop Server...', tostring(v.Name), v.UserId))
                        hopServer()
                    end
                end
            end
        end)
    end
end, function(err)
    warn(string.format("Avoid players function error %s\n", err))
end)

---------/// Anti Gameplay Paused ///---------

updateStatus("Setting Up Anti-GPP")

game:GetService("Players").LocalPlayer.Changed:Connect(function(data)
    xpcall(function()
        if data == "GameplayPaused" then
            game:GetService("Players").LocalPlayer.GameplayPaused = false
        end
    end, function(err)
        warn(string.format("Anti gameplay paused function error %s\n", err))
    end)
end)

---------/// Auto Rejoin ///---------

updateStatus("Setting Up Auto-Rejoin")

if auto_rejoin then
    task.spawn(function()
        while true do task.wait()
            xpcall(function()
                game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Child)
                    if Child.Name == 'ErrorPrompt' and Child:FindFirstChild('MessageArea') and Child.MessageArea:FindFirstChild("ErrorFrame") then
                        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
                    end
                end)
            end, function(err)
                warn(string.format("Auto rejoin function error %s\n", err))
            end)
        end
    end)
end

---------/// Streamer Mode ///---------

updateStatus("Setting Up Streamer Mode")

if streamer_mode then
    xpcall(function()
        local protectMessage = function(messageTarget, messageChange)
            local allSpace = game:GetDescendants()
            for i=1, #allSpace do
                if allSpace[i].ClassName == "TextLabel" or allSpace[i].ClassName == "TextButton" or allSpace[i].ClassName == "TextBox" then
                    if string.find(allSpace[i].Text, messageTarget) then
                        allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        pcall(function()
                            if not allSpace[i]:FindFirstChild("Ded") then
                                local UIGradient = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = allSpace[i]
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
                        allSpace[i].Changed:Connect(function()
                            allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        end)
                    end
                end
            end
            game.DescendantAdded:Connect(function(descendant)
                if descendant.ClassName == "TextLabel" or descendant.ClassName == "TextButton" or descendant.ClassName == "TextBox" then
                    if string.find(descendant.Text, messageTarget) then
                        descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        pcall(function()
                            if not descendant:FindFirstChild("Ded") then
                                local UIGradient = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = descendant
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
                        descendant.Changed:Connect(function()
                            descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        end)
                    end
                end
            end)
        end
        protectMessage(game.Players.LocalPlayer.Name, "[Protected]")
        protectMessage(game.Players.LocalPlayer.DisplayName, "[Protected]")
    end, function(err)
        warn(string.format("Streamer mode function error %s\n", err))
    end)
end

---------/// WhiteScreen & BlackScreen ///---------

updateStatus("Setting Up W/B Screen")

xpcall(function()
    if whitescreen or blackscreen then
        local setblackscreen = function(state) end
        local Blackscreen = nil
        local Blackscreen2 = {}
        if blackscreen then
            Blackscreen = Instance.new("ScreenGui")
            Blackscreen2 = Instance.new("Frame")
            Blackscreen.Name = "BLACK"
            Blackscreen.Parent = game:GetService("CoreGui")
            Blackscreen2.Name = "Blackscreen"
            Blackscreen2.Parent = Blackscreen
            Blackscreen2.Size = UDim2.new(500, 0, 500, 0)
            Blackscreen2.AnchorPoint = Vector2.new(0.5, 0.5)
            Blackscreen2.Position = UDim2.new(0.5, 0, 0.5, 0)
            Blackscreen2.BackgroundTransparency = 0
            Blackscreen2.BackgroundColor3 = Color3.new(0, 0, 0)
            Blackscreen2.Visible = false
            setblackscreen = function(state)
                Blackscreen2.Visible = state
            end
        end
        game:GetService("UserInputService").WindowFocusReleased:Connect(function()
            game:GetService("RunService"):Set3dRenderingEnabled(false)
            setblackscreen(true)
        end)
        game:GetService("UserInputService").WindowFocused:Connect(function()
            game:GetService("RunService"):Set3dRenderingEnabled(true)
            setblackscreen(false)
        end)
    end
end, function(err)
    warn(string.format("WhiteScreen function error %s\n", err))
end)

---------/// Fully Rejoin ///---------

updateStatus("Setting Up Fully Rejoin")

if fully_rejoin then
    getgenv().start_fully_rejoin = tick()
    task.spawn(function()
        while true do task.wait()
            xpcall(function()
                if tick() - start_fully_rejoin >= 1200 then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            end, function(err)
                warn(string.format("Fully rejoin function error %s\n", err))
            end)
        end
    end)
end

---------/// Anti AFK ///---------

updateStatus("Setting Up Anti-AFK")

spawn(function()
    xpcall(function()
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end, function(err)
        warn(string.format("Anti AFK function error %s\n", err))
    end)
end)

---------/// Load Blox Fruits Script ///---------

updateStatus("Starting"); task.wait(1); closeLoading()

if not getgenv().run_time then
    local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/ui/old.lua"))()
    local Notification = UILibrary:Notification()
    Notification.new({
        Title = "Script Loaded",
        Description = "Blox Fruits script loaded successfully!",
        Duration = 10
    })
    getgenv().run_time = true
    local loader = __f['__game']()
    __f['__load']("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/" .. loader)
end
