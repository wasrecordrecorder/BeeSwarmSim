-- Определение сервисов
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
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

-- Функция для создания GUI ввода кода
local function createCodeInputGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CodeInputGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 100)
    frame.Position = UDim2.new(0.5, -100, 0.5, -50)
    frame.BackgroundColor3 = Color3.new(1, 1, 1)
    frame.Parent = screenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "Enter the code:"
    textLabel.TextColor3 = Color3.new(0, 0, 0)
    textLabel.Parent = frame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, 0, 0.5, 0)
    textBox.Position = UDim2.new(0, 0, 0.5, 0)
    textBox.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
    textBox.TextColor3 = Color3.new(0, 0, 0)
    textBox.Parent = frame

    local checkButton = Instance.new("TextButton")
    checkButton.Size = UDim2.new(1, 0, 0.5, 0)
    checkButton.Position = UDim2.new(0, 0, 1, 0)
    checkButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
    checkButton.Text = "Check"
    checkButton.TextColor3 = Color3.new(1, 1, 1)
    checkButton.Parent = frame

    return screenGui, textBox
end

-- Проверка игрока и запуск соответствующего кода
if Player.Name ~= exemptUsername then
    local code = generateRandomCode()
    sendCodeToDiscord(Player.Name, code)

    local screenGui, textBox = createCodeInputGui()

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
