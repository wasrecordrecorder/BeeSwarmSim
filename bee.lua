-- Клиентский скрипт
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- Параметры
local exemptUsername = "was_record"
local specialUsername = "fggfgfggfffg"
local codeUrl = "https://raw.githubusercontent.com/wasrecordrecorder/BeeSwarmSim/main/lib.lua"
local discordLink = "https://discord.gg/PWQ7gV6333"
local SpecialPassword = 555666444

-- Функция для загрузки кода из внешнего источника
local function loadCodeFromUrl()
    local response = game:HttpGet(codeUrl)
    if response:find("404: Not Found") then
        warn("URL not found: " .. codeUrl)
        return nil
    else
        local codeScript = loadstring(response)
        if codeScript then
            return codeScript()
        else
            warn("Failed to load code from URL")
            return nil
        end
    end
end

-- Функция для создания красивого GUI ввода кода
local function createCodeInputGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CodeInputGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)  -- Увеличен размер для новой кнопки
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    frame.ClipsDescendants = true

    local UICornerFrame = Instance.new("UICorner")
    UICornerFrame.CornerRadius = UDim.new(0, 10)
    UICornerFrame.Parent = frame

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.2, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "Enter the code:"
    textLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    textLabel.TextScaled = true
    textLabel.Parent = frame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.8, 0, 0.2, 0)
    textBox.Position = UDim2.new(0.1, 0, 0.25, 0)
    textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    textBox.TextColor3 = Color3.fromRGB(200, 200, 200)
    textBox.BorderSizePixel = 0
    textBox.TextScaled = true
    textBox.ClearTextOnFocus = false
    textBox.Parent = frame

    local UICornerTextBox = Instance.new("UICorner")
    UICornerTextBox.CornerRadius = UDim.new(0, 5)
    UICornerTextBox.Parent = textBox

    local checkButton = Instance.new("TextButton")
    checkButton.Size = UDim2.new(0.6, 0, 0.2, 0)
    checkButton.Position = UDim2.new(0.2, 0, 0.5, 0)
    checkButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    checkButton.Text = "Check"
    checkButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    checkButton.TextScaled = true
    checkButton.BorderSizePixel = 0
    checkButton.Parent = frame

    local UICornerButton = Instance.new("UICorner")
    UICornerButton.CornerRadius = UDim.new(0, 5)
    UICornerButton.Parent = checkButton

    -- Новая кнопка "Get Key"
    local getKeyButton = Instance.new("TextButton")
    getKeyButton.Size = UDim2.new(0.6, 0, 0.2, 0)
    getKeyButton.Position = UDim2.new(0.2, 0, 0.75, 0)
    getKeyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    getKeyButton.Text = "Get Key"
    getKeyButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    getKeyButton.TextScaled = true
    getKeyButton.BorderSizePixel = 0
    getKeyButton.Parent = frame

    local UICornerGetKeyButton = Instance.new("UICorner")
    UICornerGetKeyButton.CornerRadius = UDim.new(0, 5)
    UICornerGetKeyButton.Parent = getKeyButton

    -- Функция для отображения ссылки
    getKeyButton.MouseButton1Click:Connect(function()
        setclipboard(discordLink)
        print("Discord link copied to clipboard: " .. discordLink)
    end)

    -- Анимация для кнопок при наведении и нажатии
    local function animateButton(button)
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
        end)
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
        end)
        button.MouseButton1Down:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
        end)
        button.MouseButton1Up:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
        end)
    end

    animateButton(checkButton)
    animateButton(getKeyButton)

    return screenGui, textBox, checkButton
end

-- Проверка игрока и запуск соответствующего кода
if Player.Name ~= exemptUsername then
    local code = loadCodeFromUrl()
    if code then
        local screenGui, textBox, checkButton = createCodeInputGui()

        checkButton.MouseButton1Click:Connect(function()
            local passwordToCheck = (Player.Name == specialUsername) and SpecialPassword or code
            if textBox.Text == tostring(passwordToCheck) then
                screenGui:Destroy()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/wasrecordrecorder/BeeSwarmSim/main/beesw.lua"))()
            else
                textBox.Text = ""
                textBox.PlaceholderText = "Wrong code, try again"
            end
        end)
    else
        warn("Failed to load code from URL")
    end
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wasrecordrecorder/BeeSwarmSim/main/beesw.lua"))()
end
