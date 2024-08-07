-- Клиентский скрипт
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- Параметры
local exemptUsername = "was_record"
local webhookUrl = "https://discord.com/api/webhooks/1270755667149590538/9DAwK79Z8iyvYNYAD0yOAtchgVo7lERxPVbTmiI7lPqgROETlLDmvpotIP6qDkA3-_KK"

-- Функция для генерации случайного кода
local function generateRandomCode()
    return HttpService:GenerateGUID(false):sub(1, 12)
end

-- Функция для отправки кода на Discord
local function sendCodeToDiscord(playerName, code)
    local data = {
        content = "Создан новый код для игрока " .. playerName .. ", вот код: " .. code
    }
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local success, result = pcall(function()
        return HttpService:PostAsync(webhookUrl, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson, false, headers)
    end)
    if not success then
        warn("Failed to send code to Discord: " .. result)
    end
end

-- Функция для создания красивого GUI ввода кода
local function createCodeInputGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CodeInputGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.3, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "Enter the code:"
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextScaled = true
    textLabel.Parent = frame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.8, 0, 0.3, 0)
    textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
    textBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.BorderSizePixel = 0
    textBox.TextScaled = true
    textBox.ClearTextOnFocus = false
    textBox.Parent = frame

    local checkButton = Instance.new("TextButton")
    checkButton.Size = UDim2.new(0.6, 0, 0.3, 0)
    checkButton.Position = UDim2.new(0.2, 0, 0.7, 0)
    checkButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    checkButton.Text = "Check"
    checkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkButton.TextScaled = true
    checkButton.BorderSizePixel = 0
    checkButton.Parent = frame

    -- Анимация для кнопки при наведении
    checkButton.MouseEnter:Connect(function()
        TweenService:Create(checkButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(90, 90, 90)}):Play()
    end)
    checkButton.MouseLeave:Connect(function()
        TweenService:Create(checkButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(75, 75, 75)}):Play()
    end)

    -- Анимация для кнопки при нажатии
    checkButton.MouseButton1Down:Connect(function()
        TweenService:Create(checkButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
    end)
    checkButton.MouseButton1Up:Connect(function()
        TweenService:Create(checkButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(75, 75, 75)}):Play()
    end)

    return screenGui, textBox, checkButton
end

-- Проверка игрока и запуск соответствующего кода
if Player.Name ~= exemptUsername then
    local code = generateRandomCode()
    sendCodeToDiscord(Player.Name, code)

    local screenGui, textBox, checkButton = createCodeInputGui()

    checkButton.MouseButton1Click:Connect(function()
        if textBox.Text == code then
            screenGui:Destroy()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/wasrecordrecorder/BeeSwarmSim/main/beesw.lua"))()
        else
            textBox.Text = ""
            textBox.PlaceholderText = "Wrong code, try again"
        end
    end)
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wasrecordrecorder/BeeSwarmSim/main/bee.lua"))()
end
