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
                if teleportCounter >= 3000 then
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
reconnectButton.Position = UDim2.new(0.33, 0, 0.07, 0) -- Позиция ниже кнопки "Bring Stickers"
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

local speedHackButton = Instance.new("TextButton")
speedHackButton.Name = "SpeedHackButton"
speedHackButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
speedHackButton.Position = UDim2.new(0.17, 0, 0.07, 0) -- Позиция ниже кнопки "Reconnect"
speedHackButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
speedHackButton.BorderSizePixel = 0
speedHackButton.Text = "SpeedHack: off"
speedHackButton.TextColor3 = Color3.new(1, 1, 1)
speedHackButton.Font = Enum.Font.SourceSansBold
speedHackButton.TextSize = 16
speedHackButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = speedHackButton

local speedInput = Instance.new("TextBox")
speedInput.Name = "SpeedInput"
speedInput.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер поля ввода
speedInput.Position = UDim2.new(0.01, 0, 0.07, 0) -- Позиция поля ввода
speedInput.BackgroundColor3 = Color3.new(0.4, 0.5, 0.5) -- Темный фон
speedInput.BackgroundTransparency = 0.6 -- Прозрачность
speedInput.BorderSizePixel = 1 -- Убираем границу
speedInput.Text = "90" -- Значение по умолчанию
speedInput.TextColor3 = Color3.new(1, 1, 1) -- Белый текст для лучшей видимости на темном фоне
speedInput.Font = Enum.Font.SourceSans
speedInput.TextSize = 16
speedInput.Parent = scrollFrame

-- Закругляем края TextBox
local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0.3, 0) -- Задаем радиус закругления
inputCorner.Parent = speedInput

-- Переменные для хранения стандартной и текущей скорости
local defaultSpeed = 18 -- Стандартная скорость игрока
local currentSpeed = defaultSpeed

-- Переменная для хранения состояния SpeedHack
local speedHackEnabled = false

-- Функция для изменения скорости игрока
local function updateSpeed()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    if speedHackEnabled then
        local inputSpeed = tonumber(speedInput.Text)
        if inputSpeed then
            currentSpeed = inputSpeed
        else
            currentSpeed = defaultSpeed
        end
        humanoid.WalkSpeed = currentSpeed
    else
        humanoid.WalkSpeed = defaultSpeed
    end
end

-- Функция для переключения состояния SpeedHack
local function toggleSpeedHack()
    speedHackEnabled = not speedHackEnabled
    updateSpeed()

    if speedHackEnabled then
        speedHackButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Зеленый цвет
        speedHackButton.Text = "SpeedHack: on"
    else
        speedHackButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет
        speedHackButton.Text = "SpeedHack: off"
    end
end

-- Обработка нажатия кнопки SpeedHack
speedHackButton.MouseButton1Click:Connect(toggleSpeedHack)

-- Обработка изменений в текстовом поле
speedInput.Changed:Connect(function(property)
    if property == "Text" and speedHackEnabled then
        updateSpeed()
    end
end)

-- Используем RunService.RenderStepped для постоянного обновления скорости
game:GetService("RunService").RenderStepped:Connect(function()
    if speedHackEnabled then
        updateSpeed()
    end
end)

------------------------------------------------------
local autoQuestButton = Instance.new("TextButton")
autoQuestButton.Name = "AutoQuestButton"
autoQuestButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
autoQuestButton.Position = UDim2.new(0.49, 0, 0.07, 0) -- Позиция ниже кнопки "AutoDig"
autoQuestButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
autoQuestButton.BorderSizePixel = 0
autoQuestButton.Text = "Auto Quest: off"
autoQuestButton.TextColor3 = Color3.new(1, 1, 1)
autoQuestButton.Font = Enum.Font.SourceSansBold
autoQuestButton.TextSize = 16
autoQuestButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = autoQuestButton

local autoQuestEnabled = false
local questThread = nil

local function AutoQuest()
    while autoQuestEnabled do
        wait(5)
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Pepper")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Coconut")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Playtime")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Honey")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Quest")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Battle")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Ability")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Goo")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Sunflower")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Dandelion")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Mushroom")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Blue Flower")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Clover")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Spider")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Bamboo")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Strawberry")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Pineapple")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Pumpkin")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Cactus")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Rose")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Pine Tree")
        game.ReplicatedStorage.Events.BadgeEvent:FireServer("Collect", "Stump")
        game.ReplicatedStorage.Events.ToyEvent:FireServer("Glue Dispenser")
        game.ReplicatedStorage.Events.ToyEvent:FireServer("Free Royal Jelly Dispenser")
        game.ReplicatedStorage.Events.ToyEvent:FireServer("Blueberry Dispenser")
        game.ReplicatedStorage.Events.ToyEvent:FireServer("Strawberry Dispenser")
        game.ReplicatedStorage.Events.ToyEvent:FireServer("Treat Dispenser")
        game.ReplicatedStorage.Events.ToyEvent:FireServer("Wealth Clock")
        game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Brown Bear")
        game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Polar Bear")
        game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Honey Bee")
        game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Black Bear")
        game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Bucko Bee")
        game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Riley Bee")
        game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Brown Bear")
        game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Polar Bear")
        game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Honey Bee")
        game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Black Bear")
        game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Bucko Bee")
        game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Riley Bee")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Treat Tutorial")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Treat Tutorial")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Bonding With Bees")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Bonding With Bees")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Search For A Sunflower Seed")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Search For A Sunflower Seed")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("The Gist Of Jellies")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("The Gist Of Jellies")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Search For Strawberries")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Search For Strawberries")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Binging On Blueberries")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Binging On Blueberries")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Royal Jelly Jamboree")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Royal Jelly Jamboree")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Search For Sunflower Seeds")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Search For Sunflower Seeds")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Picking Out Pineapples")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Picking Out Pineapples")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Seven To Seven")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Seven To Seven")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Mother Bears Midterm")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Mother Bears Midterm")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Eight To Eight")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Eight To Eight")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Sights On The Stars")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Sights On The Stars")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("The Family Final")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("The Family Final")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Preliminary Research")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Preliminary Research")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Biology Study")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Biology Study")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Proving The Hypothesis")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Proving The Hypothesis")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Bear Botany")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Bear Botany")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Kingdom Collection")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Kingdom Collection")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Defensive Adaptions")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Devensive Adaptions")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Benefits Of Technology")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Benefits Of Technology")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Spider Study")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Spider Study")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Roses And Weeds")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Roses And Weeds")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Blue Review")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Blue Review")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Ongoing Progress")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Ongoing Progress")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Red / Blue Duality")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Red / Blue Duality")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Costs Of Computation")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Costs Of Computation")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pollination Practice")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pollination Practice")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Optimizing Abilities")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Optimizing Abilities")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Ready For Infrared")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Ready For Infrared")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Breaking Down Badges")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Breaking Down Badges")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Subsidized Agriculture")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Subsidized Agriculture")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Meticulously Crafted")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Meticulously Crafted")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Smart, Not Hard")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Smart, Not Hard")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Limits of Language")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Limits of Language")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Patterns and Probability")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Patterns and Probability")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Chemical Analysis")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Chemical Analysis")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Mark Mechanics")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Mark Mechanics")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Meditating On Phenomenon")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Meditating On Phenomenon")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Beesperanto")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Beesperanto")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Hive Minded Bias")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Hive Minded Bias")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Mushroom Measurement Monotony")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Mushroom Measurement Monotony")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("The Power Of Information")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("The Power Of Information")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Testing Teamwork")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Testing Teamwork")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Epistemological Endeavor")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Epistemological Endeavor")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Egg Hunt: Panda Bear")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Egg Hunt: Panda Bear")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Lesson On Ladybugs")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Lesson On Ladybugs")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Rhino Rumble")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Rhino Rumble")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Beetle Battle")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Beetle Battle")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Spider Slayer")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Spider Slayer")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Ladybug Bonker")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Ladybug Bonker")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Spider Slayer 2")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Spider Slayer 2")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Rhino Wrecking")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Rhino Wrecking")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Final Showdown")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Final Showdown")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Werewolf Hunter")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Werewolf Hunter")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Skirmish with Scorpions")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Skirmish with Scorpions")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Mantis Massacre")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Mantis Massacre")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("The REAL Final Showdown")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("The REAL Final Showdown")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Ant Arrival")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Ant Arrival")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Winged Wack Attack")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Winged Wack Attack")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Fire Fighter")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Fire Fighter")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Army Ant Assault")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Army Ant Assault")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Colossal Combat")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Colossal Combat")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Eager Exterminator")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Eager Exterminator")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Leaper Lickin'")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Leaper Lickin'")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Colossal Combat 2")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Colossal Combat 2")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Outrageous Onslaught")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Outrageous Onslaught")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Royal Rumble")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Royal Rumble")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Ultimate Ant Annihilation 1")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Ultimate Ant Annihilation 1")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Ultimate Ant Annihilation 2")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Ultimate Ant Annihilation 2")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Ultimate Ant Annihilation 3")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Ultimate Ant Annihilation 3")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Ultimate Ant Annihilation 4")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Ultimate Ant Annihilation 4")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Ultimate Ant Annihilation 5")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Ultimate Ant Annihilation 5")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Star Journey 1")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Star Journey 1")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Star Journey 2")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Star Journey 2")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Star Journey 3")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Star Journey 3")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Star Journey 4")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Star Journey 4")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Star Journey 5")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Star Journey 5")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Egg Hunt: Riley Bee")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Egg Hunt: Riley Bee")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Egg Hunt: Bucko Bee")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Egg Hunt: Bucko Bee")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Sunflower Start")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Sunflower Start")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Dandelion Deed")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Dandelion Deed")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pollen Fetcher")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pollen Fetcher")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Red Request")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Red Request")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Into The Blue")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Into The Blue")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Variety Fetcher")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Variety Fetcher")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Bamboo Boogie")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Bamboo Boogie")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Red Request 2")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Red Request 2")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Cobweb Sweeper")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Cobweb Sweeper")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Leisure Loot")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Leisure Loot")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("White Pollen Wrangler")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("White Pollen Wrangler")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pineapple Picking")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pineapple Picking")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pollen Fetcher 2")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pollen Fetcher 2")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Weed Wacker")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Weed Wacker")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Red + Blue = Gold")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Red + Blue = Gold")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Colorless Collection")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Colorless Collection")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Spirit of Springtime")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Spirit of Springtime")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Weed Wacker 2")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Weed Wacker 2")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pollen Fetcher 3")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pollen Fetcher 3")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Lucky Landscaping")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Lucky Landscaping")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Azure Adventure")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Azure Adventure")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pink Pineapples")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pink Pineapples")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Blue Mushrooms")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Blue Mushrooms")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Cobweb Sweeper 2")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Cobweb Sweeper 2")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Rojo-A-Go-Go")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Rojo-A-Go-Go")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pumpkin Plower")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pumpkin Plower")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pollen Fetcher 4")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pollen Fetcher 4")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Bouncing Around Biomes")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Bouncing Around Biomes")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Blue Pineapples")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Blue Pineapples")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Rose Request")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Rose Request")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Search For The White Clover")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Search For The White Clover")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Stomping Grounds")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Stomping Grounds")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Collecting Cliffside")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Collecting Cliffside")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Mountain Meandering")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Mountain Meandering")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Quest Of Legends")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Quest Of Legends")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("High Altitude")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("High Altitude")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Blissfully Blue")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Blissfully Blue")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Rouge Round-up")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Rouge Round-up")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("White As Snow")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("White As Snow")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Solo On The Stump")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Solo On The Stump")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Colorful Craving")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Colorful Craving")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pumpkins, Please!")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pumpkins, Please!")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Smorgasbord")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Smorgasbord")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pollen Fetcher 5")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pollen Fetcher 5")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("White Clover Redux")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("White Clover Redux")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Strawberry Field Forever")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Strawberry Field Forever")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Tasting The Sky")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Tasting The Sky")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Whispy and Crispy")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Whispy and Crispy")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Walk Through The Woods")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Walk Through The Woods")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Get Red-y")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Get Red-y")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("One Stop On The Tip Top")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("One Stop On The Tip Top")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Blue Mushrooms 2")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Blue Mushrooms 2")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pretty Pumpkins")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pretty Pumpkins")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Black Bear, Why?")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Black Bear, Why?")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Bee A Star")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Bee A Star")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Spirit's Starter")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Spirit's Starter")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("The First Offering")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("The First Offering")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Rules of The Road")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Rules of The Road")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("QR Quest")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("QR Quest")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pleasant Pastimes")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pleasant Pastimes")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Nature's Lessons")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Nature's Lessons")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("The Gifts Of Life")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("The Gifts Of Life")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Out-Questing Questions")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Out-Questing Questions")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Forcefully Friendly")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Forcefully Friendly")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Sway Away")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Sway Away")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Memories of Memories")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Memories of Memories")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Beans Becoming")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Beans Becoming")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Do You Bee-lieve In Magic?")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Do You Bee-lieve In Magic?")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("The Ways Of The Winds / The Wind And Its Way")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("The Ways Of The Winds / The Wind And Its Way")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Beauty Duty")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Beauty Duty")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Witness Grandeur")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Witness Grandeur")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Beeternity")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Beeternity")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("A Breath Of Blue")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("A Breath Of Blue")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Glory Of Goo")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Glory Of Goo")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Tickle The Wind")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Tickle The Wind")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Rhubarb That Could Have Been")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Rhubarb That Could Have Been")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Dreams Of Being A Bee")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Dreams Of Being A Bee")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("The Sky Over The Stump")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("The Sky Over The Stump")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Space Oblivion")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Space Oblivion")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Pollenpalooza")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Pollenpalooza")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Dancing With Stick Bug")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Dancing With Stick Bug")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Bean Bug Busser")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Bean Bug Busser")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Bombs, Blueberries, and Bean Bugs")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Bombs, Blueberries, and Bean Bugs")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Bean Bugs And Boosts")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Bean Bugs And Boosts")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Make It Hasty")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Make It Hasty")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Total Focus")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Total Focus")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("On Your Marks")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("On Your Marks")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Look In The Leaves")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Look In The Leaves")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("What About Sprouts")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("What About Sprouts")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Bean Bug Beatdown")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Bean Bug Beatdown")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Bear Without Despair")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Bear Without Despair")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Spirit Spree")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Spirit Spree")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Echoing Call")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Echoing Call")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Spring Out Of The Mountain")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Spring Out Of The Mountain")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Goo")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Goo")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Medley")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Medley")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Mushrooms")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Mushrooms")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Picnic")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Picnic")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Pollen")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Pollen")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Rampage")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Rampage")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Roses")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Roses")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Scavenge")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Scavenge")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Skirmish")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Skirmish")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Strawberries")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Strawberries")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Tango")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Tango")
        game.ReplicatedStorage.Events.GiveQuest:FireServer("Riley Bee: Tour")
        game.ReplicatedStorage.Events.CompleteQuest:FireServer("Riley Bee: Tour") 
    end
end

local function toggleAutoQuest()
    autoQuestEnabled = not autoQuestEnabled
    if autoQuestEnabled then
        autoQuestButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Красный цвет для включения
        autoQuestButton.Text = "Auto Quest: on"
        -- Запуск автоматического завершения квестов в отдельном потоке
        questThread = coroutine.create(AutoQuest)
        coroutine.resume(questThread)
    else
        autoQuestButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет для выключения
        autoQuestButton.Text = "Auto Quest: off"
        -- Остановка потока, если он запущен
        if questThread then
            autoQuestEnabled = false
            questThread = nil
        end
    end
end

autoQuestButton.MouseButton1Click:Connect(toggleAutoQuest)
------------------------------------------------------

-- Создаем кнопку для вывода ивентов
local eventsButton = Instance.new("TextButton")
eventsButton.Name = "EventsButton"
eventsButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
eventsButton.Position = UDim2.new(0.65, 0, 0.07, 0) -- Позиция рядом с кнопкой "Auto Quest"
eventsButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
eventsButton.BorderSizePixel = 0
eventsButton.Text = "Print Events"
eventsButton.TextColor3 = Color3.new(1, 1, 1)
eventsButton.Font = Enum.Font.SourceSansBold
eventsButton.TextSize = 16
eventsButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = eventsButton

-- Функция для вывода ивентов в консоль
local function printEvents()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local events = replicatedStorage:GetDescendants()
    for _, event in ipairs(events) do
        if event:IsA("RemoteEvent") then
            local path = event.Name
            local parent = event.Parent
            while parent and parent ~= replicatedStorage do
                path = parent.Name .. "/" .. path
                parent = parent.Parent
            end
            print("Event found:", event.Name, "Location:", path)
        end
    end
end

-- Обработка нажатия кнопки
eventsButton.MouseButton1Click:Connect(printEvents)

-- Создаем кнопку для управления AutoDig
local autoDigButton = Instance.new("TextButton")
autoDigButton.Name = "AutoDigButton"
autoDigButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
autoDigButton.Position = UDim2.new(0.81, 0, 0.07, 0) -- Позиция рядом с кнопкой "Print Events"
autoDigButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
autoDigButton.BorderSizePixel = 0
autoDigButton.Text = "AutoDig: off"
autoDigButton.TextColor3 = Color3.new(1, 1, 1)
autoDigButton.Font = Enum.Font.SourceSansBold
autoDigButton.TextSize = 16
autoDigButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = autoDigButton

-- Переменная для хранения состояния AutoDig
local autoDigEnabled = false
local autoDigConnection = nil

-- Функция для включения или выключения AutoDig
local function toggleAutoDig()
    autoDigEnabled = not autoDigEnabled
    if autoDigEnabled then
        autoDigButton.Text = "AutoDig: on"
        autoDigButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Зеленый цвет
        autoDigConnection = game:GetService("RunService").RenderStepped:Connect(function()
            game:GetService("ReplicatedStorage").Events.ToolCollect:FireServer()
        end)
    else
        autoDigButton.Text = "AutoDig: off"
        autoDigButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет
        if autoDigConnection then
            autoDigConnection:Disconnect()
            autoDigConnection = nil
        end
    end
end

-- Обработка нажатия кнопки
autoDigButton.MouseButton1Click:Connect(toggleAutoDig)

local jumpHackButton = Instance.new("TextButton")
jumpHackButton.Name = "JumpHackButton"
jumpHackButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
jumpHackButton.Position = UDim2.new(0.17, 0, 0.13, 0) -- Позиция ниже кнопки "Reconnect"
jumpHackButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
jumpHackButton.BorderSizePixel = 0
jumpHackButton.Text = "JumpHack: off"
jumpHackButton.TextColor3 = Color3.new(1, 1, 1)
jumpHackButton.Font = Enum.Font.SourceSansBold
jumpHackButton.TextSize = 16
jumpHackButton.Parent = scrollFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = jumpHackButton

local jumpInput = Instance.new("TextBox")
jumpInput.Name = "JumpInput"
jumpInput.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер поля ввода
jumpInput.Position = UDim2.new(0.01, 0, 0.13, 0) -- Позиция поля ввода
jumpInput.BackgroundColor3 = Color3.new(0.4, 0.5, 0.5) -- Темный фон
jumpInput.BackgroundTransparency = 0.6 -- Прозрачность
jumpInput.BorderSizePixel = 1 -- Убираем границу
jumpInput.Text = "90" -- Значение по умолчанию для силы прыжка
jumpInput.TextColor3 = Color3.new(1, 1, 1) -- Белый текст для лучшей видимости на темном фоне
jumpInput.Font = Enum.Font.SourceSans
jumpInput.TextSize = 16
jumpInput.Parent = scrollFrame

-- Закругляем края TextBox
local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0.3, 0) -- Задаем радиус закругления
inputCorner.Parent = jumpInput

-- Переменные для хранения стандартной и текущей силы прыжка
local defaultJumpPower = 50 -- Стандартная сила прыжка игрока
local currentJumpPower = defaultJumpPower

-- Переменная для хранения состояния JumpHack
local jumpHackEnabled = false

-- Функция для изменения силы прыжка игрока
local function updateJumpPower()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    if jumpHackEnabled then
        local inputJumpPower = tonumber(jumpInput.Text)
        if inputJumpPower then
            currentJumpPower = inputJumpPower
        else
            currentJumpPower = defaultJumpPower
        end
        humanoid.JumpPower = currentJumpPower
    else
        humanoid.JumpPower = defaultJumpPower
    end
end

-- Функция для переключения состояния JumpHack
local function toggleJumpHack()
    jumpHackEnabled = not jumpHackEnabled
    updateJumpPower()

    if jumpHackEnabled then
        jumpHackButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Зеленый цвет
        jumpHackButton.Text = "JumpHack: on"
    else
        jumpHackButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет
        jumpHackButton.Text = "JumpHack: off"
    end
end

-- Обработка нажатия кнопки JumpHack
jumpHackButton.MouseButton1Click:Connect(toggleJumpHack)

-- Обработка изменения текста в поле ввода
jumpInput.Changed:Connect(function(property)
    if property == "Text" then
        updateJumpPower()
    end
end)

local saveDeathButton = Instance.new("TextButton")
saveDeathButton.Name = "SaveDeathButton"
saveDeathButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
saveDeathButton.Position = UDim2.new(0.33, 0, 0.13, 0) -- Позиция кнопки
saveDeathButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
saveDeathButton.BorderSizePixel = 0
saveDeathButton.Text = "SaveDeath: off"
saveDeathButton.TextColor3 = Color3.new(1, 1, 1)
saveDeathButton.Font = Enum.Font.SourceSansBold
saveDeathButton.TextSize = 16
saveDeathButton.Parent = scrollFrame

-- Закругляем края кнопки
local saveDeathButtonCorner = Instance.new("UICorner")
saveDeathButtonCorner.CornerRadius = UDim.new(0.3, 0)
saveDeathButtonCorner.Parent = saveDeathButton

-- Переменные для хранения состояния SaveDeath и последнего местоположения
local saveDeathEnabled = false
local lastSavedPosition = nil
local savingAfterTeleport = false

-- Функция для сохранения текущего местоположения
local function saveCurrentPosition()
    local player = game.Players.LocalPlayer
    if not player then return end
    local character = player.Character or player.CharacterAdded:Wait()
    if not character then return end
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    lastSavedPosition = nil
    wait(0.1)
    lastSavedPosition = humanoidRootPart.Position
end

-- Функция для телепортации в последнее сохраненное местоположение
local function teleportToLastPosition()
    local player = game.Players.LocalPlayer
    if not player then return end
    local character = player.Character or player.CharacterAdded:Wait()
    if not character then return end
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart or not lastSavedPosition then return end
    humanoidRootPart.CFrame = CFrame.new(lastSavedPosition)
    wait(0.5)
    humanoidRootPart.CFrame = CFrame.new(lastSavedPosition)
end

-- Функция для переключения состояния SaveDeath
local function toggleSaveDeath()
    saveDeathEnabled = not saveDeathEnabled

    if saveDeathEnabled then
        saveDeathButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Зеленый цвет
        saveDeathButton.Text = "SaveDeath: on"
        saveCurrentPosition()
    else
        saveDeathButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет
        saveDeathButton.Text = "SaveDeath: off"
    end
end

-- Обработка нажатия кнопки SaveDeath
saveDeathButton.MouseButton1Click:Connect(toggleSaveDeath)

-- Обработка смерти и возрождения персонажа
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    if saveDeathEnabled then
        wait(0.5) -- Задержка в 0.5 секунды перед телепортацией
        teleportToLastPosition()
        savingAfterTeleport = true
    end
end)

-- Обработка события смерти
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
    if saveDeathEnabled then
        saveCurrentPosition()
        print("сохранил позицию перед смертью")
    end
end)


-- Создаем текстовое поле для ввода радиуса
local radiusTextBox = Instance.new("TextBox")
radiusTextBox.Name = "RadiusTextBox"
radiusTextBox.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер текстового поля
radiusTextBox.Position = UDim2.new(0.01, 0, 0.19, 0) -- Позиция текстового поля
radiusTextBox.BackgroundColor3 = Color3.new(0.4, 0.5, 0.5) -- Темный фон
radiusTextBox.BackgroundTransparency = 0.6 -- Серый цвет по умолчанию
radiusTextBox.BorderSizePixel = 0
radiusTextBox.Text = "30" -- Значение по умолчанию
radiusTextBox.TextColor3 = Color3.new(1, 1, 1)
radiusTextBox.Font = Enum.Font.SourceSansBold
radiusTextBox.TextSize = 16
radiusTextBox.ClearTextOnFocus = false
radiusTextBox.Parent = scrollFrame

local radiusTextBoxCorner = Instance.new("UICorner")
radiusTextBoxCorner.CornerRadius = UDim.new(0.3, 0)
radiusTextBoxCorner.Parent = radiusTextBox

-- Создаем вторую кнопку для хождения в радиусе, указанном в текстовом поле
local randomWalkButton = Instance.new("TextButton")
randomWalkButton.Name = "RandomWalkButton"
randomWalkButton.Size = UDim2.new(0.15, 0, 0.05, 0) -- Размер кнопки
randomWalkButton.Position = UDim2.new(0.17, 0, 0.19, 0) -- Позиция кнопки рядом с первой
randomWalkButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет по умолчанию
randomWalkButton.BorderSizePixel = 0
randomWalkButton.Text = "Random Walk"
randomWalkButton.TextColor3 = Color3.new(1, 1, 1)
randomWalkButton.Font = Enum.Font.SourceSansBold
randomWalkButton.TextSize = 16
randomWalkButton.Parent = scrollFrame

-- Закругляем края второй кнопки
local randomWalkButtonCorner = Instance.new("UICorner")
randomWalkButtonCorner.CornerRadius = UDim.new(0.3, 0)
randomWalkButtonCorner.Parent = randomWalkButton

-- Переменная для хранения состояния случайного хождения
local walkingRandom = false

-- Функция для случайного хождения в радиусе, указанном в текстовом поле
local function walkRandom()
    if walkingRandom then return end
    walkingRandom = true

    local player = game.Players.LocalPlayer
    if not player then return end
    local character = player.Character or player.CharacterAdded:Wait()
    if not character then return end
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end

    local radius = tonumber(radiusTextBox.Text) or 30
    local centerPosition = character.HumanoidRootPart.Position

    local function getRandomPoint()
        local angle = math.random() * 2 * math.pi
        local distance = math.random() * radius
        local x = centerPosition.X + distance * math.cos(angle)
        local z = centerPosition.Z + distance * math.sin(angle)
        return Vector3.new(x, centerPosition.Y, z)
    end

    while walkingRandom do
        local targetPoint = getRandomPoint()
        humanoid:MoveTo(targetPoint)
        humanoid.MoveToFinished:Wait()
    end

    walkingRandom = false
end

-- Обработка изменения текста в текстовом поле
radiusTextBox.Changed:Connect(function(property)
    if property == "Text" then
        local radius = tonumber(radiusTextBox.Text)
        if not radius or radius <= 0 then
            radiusTextBox.Text = "30" -- Возвращаем значение по умолчанию, если введено некорректное значение
        end
    end
end)

-- Обработка нажатия кнопки Random Walk
randomWalkButton.MouseButton1Click:Connect(function()
    if not walkingRandom then
        randomWalkButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Зеленый цвет
        randomWalkButton.Text = "Walking..."
        walkRandom()
    else
        randomWalkButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет
        randomWalkButton.Text = "Random Walk"
        walkingRandom = false
    end
end)

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