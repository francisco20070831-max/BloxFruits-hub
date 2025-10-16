-- Blox Fruits Hub v3.0 MEJORADO - Escudo Aleja + TP Sea + Brillantes + Nombres + Ataque Rápido + Velocidad Siempre + Auto Farm + Auto Rejoin + Streamer Mode + Anti AFK + Más (Inspirado en Redz Hub y Alchemy Hub)
-- Mejoras: UI con Kavo (similar a Redz Hub), posiciones actualizadas (octubre de 2025), TP suave, ataque optimizado, funciones de Alchemy como auto-reunión, modo streamer, anti-AFK, evitar jugadores, pantalla blanca/negra.
-- Créditos: Basado en v2.4, correcciones y agregados por Grok (2025).

Jugadores locales = juego:GetService("Jugadores")
local LocalPlayer = Jugadores.LocalPlayer
Almacenamiento replicado local = juego:GetService("Almacenamiento replicado")
Espacio de trabajo local = juego:GetService("Espacio de trabajo")
ServicioDeEntradaDeUsuario local = juego:ObtenerServicio("ServicioDeEntradaDeUsuario")
RunService local = juego:GetService("RunService")
UsuarioVirtual local = juego:ObtenerServicio("UsuarioVirtual")
ServicioTween local = juego:GetService("ServicioTween")
ServicioTeletransporte local = juego:ObtenerServicio("ServicioTeletransporte")
ServicioHttp local = juego:ObtenerServicio("ServicioHttp")

print("ðŸ”¥ CARGANDO v3.0 Mejorado...")

-- Reemplazo de Rayfield por Kavo UI (similar a Redz Hub, más estable en 2025)
local Kavo = loadstring(HttpService:Get("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
Ventana local = Kavo:CreateLib("Blox Fruits Hub v3.0 (Estilo Redz)", "Synapse")
Configuración local = {AutoFarm = falso, FruitSniper = falso, Escudo = falso, Modo de ataque = "Puñetazos", Velocidad = 16, Reincorporación automática = falso, Modo de transmisión = falso, Pantalla blanca = falso, Pantalla negra = falso}

-- Detectar mar actual (basado en nivel)
función local getCurrentSea()
    nivel local = LocalPlayer.Data.Level.Value
    si el nivel < 700 entonces
        regresar "1 de marzo"
    de lo contrario, si el nivel es < 1500 entonces
        regresar "2 de marzo"
    demás
        regresar "3 de marzo"
    fin
fin

-- Islands per Sea (actualizado Octubre 2025 de Beebom y Dexerto)
islas locales = {
    ["Mar 1"] = {"Isla de Inicio", "Jungla", "Pueblo Pirata", "Desierto", "Pueblo Congelado", "Fortaleza Marina", "Skylands", "Prisión", "Coliseo", "Pueblo Magma", "Ciudad Submarina", "Skylands Superior", "Ciudad Fuente"},
    ["Mar 2"] = {"Reino de las Rosas", "Café", "Zona Verde", "Isla Cementerio", "Arena Oscura", "Montaña Nevada", "Calor y Frío", "Barco Maldito", "Castillo de Hielo", "Isla Olvidada"},
    ["Mar 3"] = {"Puerto", "Isla Hidra", "Gran Árbol", "Tortuga Flotante", "Castillo Encantado", "Mar de Delicias", "Castillo en el Mar", "Puesto Tiki"}
}

-- Posiciones por Isla (actualizadas Octubre 2025 de fuentes como Beebom, Dexerto y Wiki)
posiciones locales = {
    ["Isla de inicio"] = CFrame.new(979, 28, 1392),
    ["Selva"] = CFrame.new(-1249, 11, -320),
    ["Pueblo Pirata"] = CFrame.new(-1169, 4, -1428),
    ["Desierto"] = CFrame.new(896, 6, 4390),
    ["Pueblo congelado"] = CFrame.new(1198, 57, -1142),
    ["Fortaleza Marina"] = CFrame.new(-5011, 29, 4326),
    ["Skylands"] = CFrame.new(-4607, 874, -1667),
    ["Prisión"] = CFrame.new(4875, 5, 734),
    ["Coliseo"] = CFrame.nuevo(-1428, 7, -3014),
    ["Pueblo Magma"] = CFrame.new(-5320, 17, -5465),
    ["Ciudad submarina"] = CFrame.new(61391, 6, 1425),
    ["Tierras del Cielo Superior"] = CFrame.new(-7894, 5545, -3801),
    ["Ciudad Fuente"] = CFrame.new(5154, 2, 4178),
    ["Reino de la Rosa"] = CFrame.new(-450, 138, 530),
    ["Café"] = CFrame.new(-380, 77, -110),
    ["Zona Verde"] = CFrame.new(-2200, 73, -2200),
    ["Isla del Cementerio"] = CFrame.new(-5411, 48, -722),
    ["Arena oscura"] = CFrame.new(3770, 14, -4240),
    ["Montaña nevada"] = CFrame.new(609, 400, -5370),
    ["Caliente y frío"] = CFrame.new(-6026, 14, -6481),
    ["Barco maldito"] = CFrame.new(-6508, 89, -132),
    ["Castillo de hielo"] = CFrame.new(5505, 40, -6178),
    ["Isla Olvidada"] = CFrame.new(-3043, 239, -10191),
    ["Ciudad portuaria"] = CFrame.new(-290, 30, 5358),
    ["Isla Hidra"] = CFrame.new(5229, 603, 345),
    ["Gran Árbol"] = CFrame.new(28282, 230, 8828),
    ["Tortuga flotante"] = CFrame.new(-13274, 332, -7579),
    ["Castillo encantado"] = CFrame.new(-9515, 142, 5535),
    ["Mar de delicias"] = CFrame.new(-2000, 50, -8000),
    ["Castillo en el mar"] = CFrame.new(-5000, 314, -3000),
    ["Puesto avanzado Tiki"] = CFrame.new(-16192, 500, -10238)
}

-- TAB 1: ESCUDO INVISIBLE (Mejorado con optimización de Alchemy)
local ShieldTab = Ventana:MakeTab({Nombre = "ðŸ›¡ï¸ Escudo", Icono = "rbxassetid://4483345998", PremiumOnly = falso})
Pestaña Escudo:AñadirAlternar({
    Nombre = "ðŸ›¡ï¸ Escudo (Aleja 3m)",
    Predeterminado = falso,
    Devolución de llamada = función(Valor)
        Config.Shield = Valor
        spawn(función()
            mientras Config.Shield lo hace
                pcall(función()
                    para _, enemigo en pares(Workspace.Enemies:GetChildren()) hacer
                        si enemigo:FindFirstChild("HumanoidRootPart") y LocalPlayer.Character y LocalPlayer.Character:FindFirstChild("HumanoidRootPart") entonces
                            distancia local = (enemigo.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitud
                            si la distancia < 3 entonces
                                enemigo.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                            fin
                        fin
                    fin
                fin)
                task.wait(0.05) -- Optimizado para menos retraso
            fin
        fin)
        Kavo:ToggleNotification({Título = "Escudo", Contenido = Valor y "ON" o "OFF", Duración = 3})
    fin
})

-- TAB 2: TELETRANSPORTE POR MAR (Con TP suave)
local TpTab = Ventana:MakeTab({Nombre = "ðŸš€ TP", Icono = "rbxassetid://4483345998", PremiumOnly = falso})
TpTab:AñadirDesplegable({
    Nombre = "ðŸŒŠ TP Isla (Mar Actual: " .. getCurrentSea() .. ")",
    Predeterminado = islas[getCurrentSea()][1],
    Opciones = islas[getCurrentSea()],
    Devolución de llamada = función(Opción)
        si LocalPlayer.Character y LocalPlayer.Character:FindFirstChild("HumanoidRootPart") entonces
            targetCFrame local = posiciones[Opción]
            TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = targetCFrame}):Reproducir()
            Kavo:ToggleNotification({Título = "TP", Contenido = "TP suave a " .. Opción, Duración = 3})
        demás
            Kavo:ToggleNotification({Título = "Error", Contenido = "Personaje no cargado.", Duración = 3})
        fin
    fin
})

-- TAB 3: VISUALES BRILLANTES + NOMBRES (Mejorado con ESP de Redz/Alchemy)
VisualTab local = Ventana:MakeTab({Nombre = "ðŸ'¡ Visuales", Icono = "rbxassetid://4483345998", PremiumOnly = false})
VisualTab:AddToggle({
    Nombre = "âœ¨ Enemigos Brillantes",
    Predeterminado = falso,
    Devolución de llamada = función(Valor)
        para _, enemigo en pares(Workspace.Enemies:GetChildren()) hacer
            si enemigo:FindFirstChild("HumanoidRootPart") entonces
                enemy.HumanoidRootPart.Transparency = Valor y 0 o 1
                enemigo.HumanoidRootPart.Material = Valor y Enum.Material.Neon o Enum.Material.Plastic
                enemigo.HumanoidRootPart.Color = Valor y Color3.fromRGB(255, 255, 0) o Color3.fromRGB(139, 139, 139)
            fin
        fin
        Kavo:ToggleNotification({Título = "Visual", Contenido = Valor y "ACTIVADO" o "DESACTIVADO", Duración = 3})
    fin
})

VisualTab:AddToggle({
    Nombre = "ðŸ ' Frutas Brillantes",
    Predeterminado = falso,
    Devolución de llamada = función(Valor)
        para _, fruta en pares(Workspace:GetChildren()) hacer
            Si fruta.Nombre:match("Fruta") y fruta:FindFirstChild("Manejador") entonces
                fruit.Handle.Transparency = Valor y 0 o 1
                fruta.Mango.Material = Valor y Enum.Material.Neon o Enum.Material.Plastic
                fruta.Manejar.Color = Valor y Color3.fromRGB(255, 165, 0) o Color3.fromRGB(255, 0, 0)
            fin
        fin
        Kavo:ToggleNotification({Título = "Visual", Contenido = Valor y "ACTIVADO" o "DESACTIVADO", Duración = 3})
    fin
})

VisualTab:AddToggle({
    Nombre = "ðŸ“› Nombres Jugadores Visibles Siempre",
    Predeterminado = falso,
    Devolución de llamada = función(Valor)
        para _, jugador en pares(Jugadores:ObtenerJugadores()) hacer
            si jugador ~= LocalPlayer y jugador.Character y jugador.Character:FindFirstChild("Head") entonces
                cartelera local = jugador.Personaje.Cabeza:FindFirstChild("EtiquetaDeNombre") o Instancia.nueva("BillboardGui", jugador.Personaje.Cabeza)
                cartelera.Nombre = "Etiqueta de nombre"
                cartelera.SiempreEnCima = Valor
                cartelera.Tamaño = UDim2.nuevo(0, 200, 0, 50)
                cartelera.StudsOffset = Vector3.new(0, 2, 0)
                texto local = Instancia.new("TextLabel", cartelera)
                texto.Transparencia de fondo = 1
                texto.Tamaño = UDim2.new(1, 0, 1, 0)
                texto.Texto = jugador.Nombre
                texto.TextColor3 = Color3.fromRGB(255, 255, 255)
                texto.TextSize = 14
                cartelera.Habilitado = Valor
            fin
        fin
        Kavo:ToggleNotification({Título = "Visual", Contenido = Valor y "ACTIVADO" o "DESACTIVADO", Duración = 3})
    fin
})

-- TAB 4: ATAQUE RÁPIDO (Optimizado con auto-target)
local AttackTab = Ventana:MakeTab({Nombre = "âš”ï¸ Ataque", Icono = "rbxassetid://4483345998", PremiumOnly = false})
Pestaña de ataque: Agregar alternar({
    Nombre = "âš”ï¸ Ataque Rápido",
    Predeterminado = falso,
    Devolución de llamada = función(Valor)
        Si Valor entonces
            spawn(función()
                mientras que Valor lo hace
                    pcall(función()
                        si LocalPlayer.Character y LocalPlayer.Character:FindFirstChild("Humanoid") y LocalPlayer.Character.Humanoid.Health > 0 entonces
                            si Config.AttackMode == "Gun" entonces
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("EquipTool", "Gun")
                            de lo contrario, si Config.AttackMode == "Fruta", entonces
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("FruitAbility", verdadero)
                            fin
                            UsuarioVirtual:Botón1Abajo(Vector2.nuevo(0, 0))
                            UsuarioVirtual:Botón1Arriba(Vector2.nuevo(0, 0))
                        fin
                    fin)
                    task.wait(0.01) -- Más rápido
                fin
            fin)
            Kavo:ToggleNotification({Título = "Ataque", Contenido = "ACTIVADO", Duración = 3})
        demás
            Kavo:ToggleNotification({Título = "Ataque", Contenido = "DESACTIVADO", Duración = 3})
        fin
    fin
})

Pestaña de ataque: Agregar menú desplegable ({
    Nombre = "Modo Ataque",
    Predeterminado = "Puños",
    Opciones = {"Puños", "Pistola", "Fruta"},
    Devolución de llamada = función(Opción)
        Config.AttackMode = Opción
        Kavo:ToggleNotification({Título = "Ataque", Contenido = "Modo: " .. Opción, Duración = 3})
    fin
})

-- PESTAÃ'A 5: VELOCIDAD SIEMPRE
SpeedTab local = Ventana:MakeTab({Nombre = "ðŸ ƒ Velocidad", Icono = "rbxassetid://4483345998", PremiumOnly = falso})
SpeedTab:Añadir control deslizante({
    Nombre = "ðŸ ƒ Velocidad (16-200)",
    Mínimo = 16,
    Máx. = 200,
    Valor predeterminado = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Incremento = 10,
    ValueName = "Velocidad",
    Devolución de llamada = función(Valor)
        LocalPlayer.Character.Humanoid.WalkSpeed ​​= Valor
        Kavo:ToggleNotification({Título = "Velocidad", Contenido = Valor.. "Siempre", Duración = 3})
    fin
})

-- NUEVA TAB: AUTO FARM (Inspirado en Redz Hub)
FarmTab local = Ventana:MakeTab({Nombre = "ðŸŒ¾ Auto Farm", Icono = "rbxassetid://4483345998", PremiumOnly = falso})
FarmTab:AddToggle({
    Nombre = "Nivel de granja automática",
    Predeterminado = falso,
    Devolución de llamada = función(Valor)
        Config.AutoFarm = Valor
        spawn(función()
            mientras Config.AutoFarm lo hace
                pcall(función()
                    -- Lógica simple de auto-farm: TP a enemigos cercanos y ataca (expandir según necesidad)
                    para _, enemigo en pares(Workspace.Enemies:GetChildren()) hacer
                        si enemigo:FindFirstChild("Humanoid") y enemigo.Humanoid.Health > 0 entonces
                            JugadorLocal.Personaje.ParteRaízHumanoid.CFrame = enemigo.ParteRaízHumanoid.CFrame * CFrame.new(0, 0, -5)
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("Establecer punto de reaparición")
                            esperar(0.5)
                        fin
                    fin
                fin)
                esperar(0.1)
            fin
        fin)
        Kavo:ToggleNotification({Título = "Granja", Contenido = Valor y "ACTIVADO" o "DESACTIVADO", Duración = 3})
    fin
})

-- NUEVA PESTAÃ'A: MISC (Funciones de Alchemy: Reinicio automático, Modo Streamer, Pantalla blanca/negra, Anti AFK)
local MiscTab = Ventana:MakeTab({Nombre = "ðŸ”§ Misc (Estilo Alchemy)", Icono = "rbxassetid://4483345998", PremiumOnly = falso})
Pestaña Misc:AddToggle({
    Nombre = "ðŸ”" Reincorporación automática",
    Predeterminado = falso,
    Devolución de llamada = función(Valor)
        Config.AutoRejoin = Valor
