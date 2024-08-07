-- Клиентский скрипт
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- Параметры
local exemptUsername = "was_record"
local fixedCode = "88033326057295521020315"

-- Функция для создания красивого GUI ввода кода
local function createCodeInputGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CodeInputGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    frame.ClipsDescendants = true

    local UICornerFrame = Instance.new("UICorner")
    UICornerFrame.CornerRadius = UDim.new(0, 10)
    UICornerFrame.Parent = frame

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.3, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "Enter the code:"
    textLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    textLabel.TextScaled = true
    textLabel.Parent = frame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.8, 0, 0.3, 0)
    textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
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
    checkButton.Size = UDim2.new(0.6, 0, 0.3, 0)
    checkButton.Position = UDim2.new(0.2, 0, 0.7, 0)
    checkButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    checkButton.Text = "Check"
    checkButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    checkButton.TextScaled = true
    checkButton.BorderSizePixel = 0
    checkButton.Parent = frame

    local UICornerButton = Instance.new("UICorner")
    UICornerButton.CornerRadius = UDim.new(0, 5)
    UICornerButton.Parent = checkButton

    -- Анимация для кнопки при наведении
    checkButton.MouseEnter:Connect(function()
        TweenService:Create(checkButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
    end)
    checkButton.MouseLeave:Connect(function()
        TweenService:Create(checkButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
    end)

    -- Анимация для кнопки при нажатии
    checkButton.MouseButton1Down:Connect(function()
        TweenService:Create(checkButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
    end)
    checkButton.MouseButton1Up:Connect(function()
        TweenService:Create(checkButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
    end)

    return screenGui, textBox, checkButton
end

-- Проверка игрока и запуск соответствующего кода
if Player.Name ~= exemptUsername then
    local screenGui, textBox, checkButton = createCodeInputGui()

    checkButton.MouseButton1Click:Connect(function()
        if textBox.Text == fixedCode then
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
