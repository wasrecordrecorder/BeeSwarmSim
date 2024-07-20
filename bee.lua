-- Создаем ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomScrollGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Создаем Frame для ScrollGui
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.25, 0, -0.5, 0)
mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
mainFrame.BorderColor3 = Color3.new(0, 0, 0)
mainFrame.BorderSizePixel = 3
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Закругляем края
local roundedCorner = Instance.new("UICorner")
roundedCorner.CornerRadius = UDim.new(0.05, 0)
roundedCorner.Parent = mainFrame

-- Создаем ScrollFrame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ScrollFrame"
scrollFrame.Size = UDim2.new(1, 0, 0.8, 0)
scrollFrame.Position = UDim2.new(0, 0, 0.1, 0)
scrollFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 10
scrollFrame.Parent = mainFrame

local roundedCorner = Instance.new("UICorner")
roundedCorner.CornerRadius = UDim.new(0.05, 0)
roundedCorner.Parent = scrollFrame

-- Создаем TextLabel для текста
local textLabel = Instance.new("TextLabel")
textLabel.Name = "TextLabel"
textLabel.Size = UDim2.new(1, 0, 0.1, 0)
textLabel.Position = UDim2.new(0, 0, 0.9, 0)
textLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
textLabel.BorderSizePixel = 0
textLabel.Text = "[Right Ctrl to open/close]"
textLabel.TextColor3 = Color3.new(0.5, 0.5, 0.5)
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
textLabel.TextStrokeTransparency = 0.5
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 18
textLabel.Parent = mainFrame

local roundedCorner = Instance.new("UICorner")
roundedCorner.CornerRadius = UDim.new(0.05, 0)
roundedCorner.Parent = textLabel

-- Создаем TextLabel для текста
local textLabel = Instance.new("TextLabel")
textLabel.Name = "ByText"
textLabel.Size = UDim2.new(0.9, 0, 0.05, 0)
textLabel.Position = UDim2.new(-0.2, 0, 0.02, 0)
textLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
textLabel.BackgroundTransparency = 1 -- Полностью прозрачный фон
textLabel.BorderSizePixel = 0
textLabel.Text = "Created By was_record | Full Free"
textLabel.TextColor3 = Color3.new(0.5, 0.5, 0.5)
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
textLabel.TextStrokeTransparency = 0.5
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 18
textLabel.Parent = mainFrame

local roundedCorner = Instance.new("UICorner")
roundedCorner.CornerRadius = UDim.new(0.05, 0)
roundedCorner.Parent = textLabel

-- Создаем кнопку Destroy
local destroyButton = Instance.new("TextButton")
destroyButton.Name = "DestroyButton"
destroyButton.Size = UDim2.new(0.1, 0, 0.06, 0)
destroyButton.Position = UDim2.new(0.885, 0, 0.029, 0)
destroyButton.BackgroundColor3 = Color3.new(0.8, 0, 0)
destroyButton.BorderSizePixel = 0
destroyButton.Text = "Destroy"
destroyButton.TextColor3 = Color3.new(1, 1, 1)
destroyButton.Font = Enum.Font.SourceSansBold
destroyButton.TextSize = 18
destroyButton.Parent = mainFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = destroyButton

-- Функция для уничтожения GUI с анимацией
destroyButton.MouseButton1Click:Connect(function()
    mainFrame:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true, function()
        screenGui:Destroy()
    end)
end)

-- Создаем кнопку для клика по объектам в папке HiddenStickers
local clickButton = Instance.new("TextButton")
clickButton.Name = "ClickButton"
clickButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Уменьшенный размер
clickButton.Position = UDim2.new(0.01, 0, 0.01, 0) -- Смещение в левый верхний угол
clickButton.BackgroundColor3 = Color3.new(71/255, 74/255, 81/255) -- Новый цвет
clickButton.BorderSizePixel = 0
clickButton.Text = "Bring Stickers"
clickButton.TextColor3 = Color3.new(1, 1, 1)
clickButton.Font = Enum.Font.SourceSansBold
clickButton.TextSize = 16
clickButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = clickButton

-- Анимация нажатия кнопки
clickButton.MouseButton1Click:Connect(function()
    clickButton.BackgroundColor3 = Color3.new(78/255, 87/255, 84/255) -- Темнее при нажатии
    clickButton.TextSize = 14 -- Уменьшаем размер текста при нажатии
    wait(0.1)
    clickButton.BackgroundColor3 = Color3.new(71/255, 74/255, 81/255) -- Возвращаем исходный цвет
    clickButton.TextSize = 16 -- Возвращаем исходный размер текста

    -- Функция для клика по объектам в папке HiddenStickers
    local hiddenStickers = game.Workspace.HiddenStickers:GetChildren()
    for _, sticker in ipairs(hiddenStickers) do
        if sticker:IsA("BasePart") then
            fireclickdetector(sticker:FindFirstChildOfClass("ClickDetector"))
        end
    end
end)

local noClipButton = Instance.new("TextButton")
noClipButton.Name = "NoClipButton"
noClipButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
noClipButton.Position = UDim2.new(0.17, 0, 0.01, 0) -- Позиция рядом с кнопкой "Bring Stickers"
noClipButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
noClipButton.BorderSizePixel = 0
noClipButton.Text = "NoClip: off"
noClipButton.TextColor3 = Color3.new(1, 1, 1)
noClipButton.Font = Enum.Font.SourceSansBold
noClipButton.TextSize = 16
noClipButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = noClipButton

-- Переменная для хранения состояния NoClip
local noClipEnabled = false

local function enableNoclip()
    steppedConnection = game:GetService("RunService").Stepped:Connect(function()
        local character = game.Players.LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

-- Функция для выключения Noclip
local function disableNoclip()
    if steppedConnection then
        steppedConnection:Disconnect()
        steppedConnection = nil
    end
    local character = game.Players.LocalPlayer.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

-- Функция для переключения NoClip
local function toggleNoClip()
    noClipEnabled = not noClipEnabled
    if noClipEnabled then
        noClipButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Зеленый цвет
        noClipButton.Text = "NoClip: on"
        enableNoclip()
    else
        noClipButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет
        noClipButton.Text = "NoClip: off"
        disableNoclip()
    end
end

-- Обработка нажатия кнопки NoClip
noClipButton.MouseButton1Click:Connect(toggleNoClip)

-- Создаем кнопку Flight
local flightButton = Instance.new("TextButton")
flightButton.Name = "FlightButton"
flightButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
flightButton.Position = UDim2.new(0.33, 0, 0.01, 0) -- Позиция рядом с кнопкой "NoClip"
flightButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
flightButton.BorderSizePixel = 0
flightButton.Text = "Flight: off"
flightButton.TextColor3 = Color3.new(1, 1, 1)
flightButton.Font = Enum.Font.SourceSansBold
flightButton.TextSize = 16
flightButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = flightButton

-- Переменная для хранения состояния Flight
local flightEnabled = false

FLYING = false
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1

-- Функция для запуска полета
function sFLY(vfly)
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    repeat wait() until game.Players.LocalPlayer:GetMouse()
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

    local T = game.Players.LocalPlayer.Character.HumanoidRootPart
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = 0

    local function FLY()
        FLYING = true
        local BG = Instance.new('BodyGyro')
        local BV = Instance.new('BodyVelocity')
        BG.P = 9e4
        BG.Parent = T
        BV.Parent = T
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = T.CFrame
        BV.velocity = Vector3.new(0, 0, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        task.spawn(function()
            repeat wait()
                if not vfly and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                end
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                    SPEED = 50
                elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                    SPEED = 0
                end
                if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                    BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                    BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                else
                    BV.velocity = Vector3.new(0, 0, 0)
                end
                BG.cframe = workspace.CurrentCamera.CoordinateFrame
            until not FLYING
            CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            SPEED = 0
            BG:Destroy()
            BV:Destroy()
            if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
            end
        end)
    end
    flyKeyDown = game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KEY)
        if KEY:lower() == 'w' then
            CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY:lower() == 's' then
            CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY:lower() == 'a' then
            CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY:lower() == 'd' then
            CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
        elseif QEfly and KEY:lower() == 'e' then
            CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
        elseif QEfly and KEY:lower() == 'q' then
            CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
        end
        pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
    end)
    flyKeyUp = game.Players.LocalPlayer:GetMouse().KeyUp:Connect(function(KEY)
        if KEY:lower() == 'w' then
            CONTROL.F = 0
        elseif KEY:lower() == 's' then
            CONTROL.B = 0
        elseif KEY:lower() == 'a' then
            CONTROL.L = 0
        elseif KEY:lower() == 'd' then
            CONTROL.R = 0
        elseif KEY:lower() == 'e' then
            CONTROL.Q = 0
        elseif KEY:lower() == 'q' then
            CONTROL.E = 0
        end
    end)
    FLY()
end

-- Функция для остановки полета
function NOFLY()
    FLYING = false
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
    if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
    end
    pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end


-- Функция для переключения Flight
local function toggleFlight()
    flightEnabled = not flightEnabled
    if flightEnabled then
        flightButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Зеленый цвет
        flightButton.Text = "Flight: on"
        sFLY()
    else
        flightButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет
        flightButton.Text = "Flight: off"
        NOFLY()
    end
end

-- Обработка нажатия кнопки Flight
flightButton.MouseButton1Click:Connect(toggleFlight)

-- Создаем кнопку Auto Hive
local autoHiveButton = Instance.new("TextButton")
autoHiveButton.Name = "AutoHiveButton"
autoHiveButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
autoHiveButton.Position = UDim2.new(0.65, 0, 0.01, 0) -- Позиция рядом с кнопкой "Flight"
autoHiveButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
autoHiveButton.BorderSizePixel = 0
autoHiveButton.Text = "Auto Hive: off"
autoHiveButton.TextColor3 = Color3.new(1, 1, 1)
autoHiveButton.Font = Enum.Font.SourceSansBold
autoHiveButton.TextSize = 16
autoHiveButton.Parent = scrollFrame -- Убедитесь, что кнопка добавлена в правильный контейнер

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = autoHiveButton

-- Функция для телепортации к объекту
local function teleportToObject(object)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = object.CFrame
end

-- Функция для нажатия клавиши "E"
local function pressE()
    local virtualInputManager = game:GetService("VirtualInputManager")
    virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.1)
    virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

-- Обработчик нажатия кнопки
autoHiveButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local hives = game.Workspace.Honeycombs:GetChildren()
    local foundOwnObject = false

    for _, hive in ipairs(hives) do
        print("Checking Hive: " .. tostring(hive.Name))
        local ownerValue = hive:FindFirstChild("Owner")
        if ownerValue then
            if ownerValue.Value == player then
                print("Owner matches player")
                local patharrowBase = hive:FindFirstChild("patharrow") and hive.patharrow:FindFirstChild("Base")
                if patharrowBase then
                    print("Found patharrow Base, teleporting...")
                    teleportToObject(patharrowBase)
                    foundOwnObject = true
                    break
                else
                    print("patharrow Base not found")
                end
            else
                print("Owner does not match player")
            end
        else
            print("Owner not found in Hive: " .. tostring(hive.Name))
        end
    end

    if not foundOwnObject then
        for _, hive in ipairs(hives) do
            local ownerValue = hive:FindFirstChild("Owner")
            if ownerValue and ownerValue.Value == nil then
                print("Found Hive with nil Owner, teleporting...")
                local patharrowBase = hive:FindFirstChild("patharrow") and hive.patharrow:FindFirstChild("Base")
                if patharrowBase then
                    teleportToObject(patharrowBase)
                    task.wait(0.4) -- Добавляем задержку в 2 секунды
                    pressE()
                    break
                else
                    print("patharrow Base not found")
                end
            end
        end
    end
end)

local tpSproutButton = Instance.new("TextButton")
tpSproutButton.Name = "TpSproutButton"
tpSproutButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
tpSproutButton.Position = UDim2.new(0.49, 0, 0.01, 0) -- Позиция рядом с кнопкой "Flight"
tpSproutButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
tpSproutButton.BorderSizePixel = 0
tpSproutButton.Text = "Tp-Sprout"
tpSproutButton.TextColor3 = Color3.new(1, 1, 1)
tpSproutButton.Font = Enum.Font.SourceSansBold
tpSproutButton.TextSize = 16
tpSproutButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = tpSproutButton

-- Функция для телепортации к случайному объекту из Sprouts
local function teleportToSprout()
    local sprouts = game.Workspace.Sprouts:GetChildren()
    if #sprouts > 0 then
        local randomIndex = math.random(1, #sprouts)
        local sprout = sprouts[randomIndex]
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        humanoidRootPart.CFrame = sprout.CFrame
    else
        print("No sprouts found in game.Workspace.Sprouts")
    end
end

-- Обработка нажатия кнопки Tp-Sprout
tpSproutButton.MouseButton1Click:Connect(teleportToSprout)

-- Создаем кнопку Bring Items
local bringItemsButton = Instance.new("TextButton")
bringItemsButton.Name = "BringItemsButton"
bringItemsButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
bringItemsButton.Position = UDim2.new(0.81, 0, 0.01, 0) -- Позиция рядом с кнопкой "Tp-Sprout"
bringItemsButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
bringItemsButton.BorderSizePixel = 0
bringItemsButton.Text = "Bring Items: off"
bringItemsButton.TextColor3 = Color3.new(1, 1, 1)
bringItemsButton.Font = Enum.Font.SourceSansBold
bringItemsButton.TextSize = 16
bringItemsButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = bringItemsButton

-- Переменная для хранения состояния цикла и счетчика телепортаций
local bringItemsEnabled = false
local bringItemsThread = nil
local teleportCounter = 0
local lastTeleportedCollectible = nil
local collectedItems = {} -- Список для хранения всех собранных предметов

-- Функция для телепортации к ближайшему объекту из Collectibles
local function teleportToCollectibles()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local playerPosition = humanoidRootPart.Position

    local collectibles = game.Workspace.Collectibles:GetChildren()
    local nearestCollectible = nil
    local nearestDistance = math.huge

    for _, collectible in ipairs(collectibles) do
        if collectible.Transparency == 0 and collectible ~= lastTeleportedCollectible and not table.find(collectedItems, collectible) then
            local distance = (collectible.Position - playerPosition).Magnitude
            if distance < nearestDistance and distance <= 60 then -- Добавлено условие на расстояние
                nearestDistance = distance
                nearestCollectible = collectible
            end
        end
    end

    if nearestCollectible then
        print("Teleporting to nearest collectible: " .. nearestCollectible.Name .. ", Distance: " .. nearestDistance) -- Отладочная информация
        humanoidRootPart.CFrame = nearestCollectible.CFrame
        table.insert(collectedItems, nearestCollectible) -- Добавление предмета в список собранных предметов
        lastTeleportedCollectible = nearestCollectible -- Обновление последнего телепортированного предмета
    else
        print("No collectibles found within 60 meters or all collectibles have been teleported to recently")
    end
end

-- Функция для заморозки персонажа
local function freezeCharacter()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Отключение анимаций и физики
    humanoid.PlatformStand = true
    humanoidRootPart.Anchored = true
end

-- Функция для разморозки персонажа
local function unfreezeCharacter()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Включение анимаций и физики
    humanoid.PlatformStand = false
    humanoidRootPart.Anchored = false
end

-- Функция для включения/выключения цикла телепортации
local function toggleBringItems()
    bringItemsEnabled = not bringItemsEnabled
    if bringItemsEnabled then
        bringItemsButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Зеленый цвет
        bringItemsButton.Text = "Bring Items: on"
        teleportCounter = 0 -- Сброс счетчика телепортаций
        bringItemsThread = coroutine.create(function()
            while bringItemsEnabled do
                freezeCharacter() -- Заморозка персонажа
                teleportToCollectibles()
                teleportCounter = teleportCounter + 1
                if teleportCounter >= 200 then
                    print("Reached 50 teleports, reloading place...")
                    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                end
                wait(0.05) -- Задержка перед разморозкой
                unfreezeCharacter() -- Разморозка персонажа
                wait(0.05) -- Задержка перед следующей заморозкой
            end
        end)
        coroutine.resume(bringItemsThread)
    else
        bringItemsButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет
        bringItemsButton.Text = "Bring Items: off"
        if bringItemsThread then
            bringItemsEnabled = false
            coroutine.close(bringItemsThread)
            bringItemsThread = nil
        end
        unfreezeCharacter() -- Разморозка персонажа
    end
end

-- Обработка нажатия кнопки Bring Items
bringItemsButton.MouseButton1Click:Connect(toggleBringItems)

-- Создаем кнопку Reconnect
local reconnectButton = Instance.new("TextButton")
reconnectButton.Name = "ReconnectButton"
reconnectButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
reconnectButton.Position = UDim2.new(0.17, 0, 0.07, 0) -- Позиция ниже кнопки "Bring Stickers"
reconnectButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
reconnectButton.BorderSizePixel = 0
reconnectButton.Text = "Reconnect"
reconnectButton.TextColor3 = Color3.new(1, 1, 1)
reconnectButton.Font = Enum.Font.SourceSansBold
reconnectButton.TextSize = 16
reconnectButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = reconnectButton

-- Функция для перезагрузки сервера
local function reconnectToServer()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end

-- Обработка нажатия кнопки Reconnect
reconnectButton.MouseButton1Click:Connect(reconnectToServer)



-- Функция для анимации открытия/закрытия
local function toggleGui()
    if mainFrame.Position.Y.Scale == -0.5 then
        mainFrame:TweenPosition(UDim2.new(0.25, 0, 0.25, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    else
        mainFrame:TweenPosition(UDim2.new(0.25, 0, -0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    end
end

-- Обработка нажатия клавиши Right Ctrl
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightControl then
        toggleGui()
    end
end)

-- Функция для перемещения GUI
local dragging = false
local dragStart = nil
local startPos = nil

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)