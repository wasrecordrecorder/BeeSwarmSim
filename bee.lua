-- Создаем GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ClickerGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Создаем обводку
local borderFrame = Instance.new("Frame")
borderFrame.Size = UDim2.new(0, 304, 0, 204)
borderFrame.Position = UDim2.new(0.5, -102, 0.5, -52)
borderFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Черный цвет обводки
borderFrame.BorderSizePixel = 0
borderFrame.Visible = true -- Устанавливаем видимость в true
borderFrame.Parent = screenGui

local borderFrameCorner = Instance.new("UICorner")
borderFrameCorner.CornerRadius = UDim.new(0, 10)
borderFrameCorner.Parent = borderFrame

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Visible = true -- Устанавливаем видимость в true
frame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

-- Функция для синхронизации позиции borderFrame с frame
local function syncBorderFramePosition()
    borderFrame.Position = frame.Position - UDim2.new(0, 2, 0, 2)
end

-- Обработчик события для перетаскивания frame
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local connection
        connection = game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                syncBorderFramePosition()
            end
        end)
        frame.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                connection:Disconnect()
            end
        end)
    end
end)

local clickButton = Instance.new("TextButton")
clickButton.Size = UDim2.new(0, 100, 0, 50)
clickButton.Position = UDim2.new(0, 10, 0, 15)
clickButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
clickButton.Text = "Click Stickers"
clickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
clickButton.Font = Enum.Font.GothamBold
clickButton.TextSize = 14
clickButton.Parent = frame

local clickButtonCorner = Instance.new("UICorner")
clickButtonCorner.CornerRadius = UDim.new(0, 10)
clickButtonCorner.Parent = clickButton

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 100, 0, 50)
closeButton.Position = UDim2.new(0, 10, 0, 75)
closeButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
closeButton.Text = "Close"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Parent = frame

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 10)
closeButtonCorner.Parent = closeButton

-- Функция для клика по всем объектам в HiddenStickers
local function clickStickers()
    local hiddenStickers = game.Workspace:FindFirstChild("HiddenStickers")
    if hiddenStickers then
        for _, sticker in ipairs(hiddenStickers:GetChildren()) do
            if sticker:IsA("BasePart") then
                fireclickdetector(sticker:FindFirstChildOfClass("ClickDetector"))
            end
        end
    end
end

-- Обработчики событий для кнопок
clickButton.MouseButton1Click:Connect(clickStickers)
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Анимация нажатия на кнопки
local function buttonDown(button)
    button.Size = button.Size - UDim2.new(0, 5, 0, 5)
end

local function buttonUp(button)
    button.Size = button.Size + UDim2.new(0, 5, 0, 5)
end

clickButton.MouseButton1Down:Connect(function()
    buttonDown(clickButton)
end)

clickButton.MouseButton1Up:Connect(function()
    buttonUp(clickButton)
end)

closeButton.MouseButton1Down:Connect(function()
    buttonDown(closeButton)
end)

closeButton.MouseButton1Up:Connect(function()
    buttonUp(closeButton)
end)

-- Кнопка для открытия/закрытия GUI
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(1, -110, 0.5, -25)
toggleButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
toggleButton.Text = "Toggle GUI"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 14
toggleButton.Parent = screenGui

local toggleButtonCorner = Instance.new("UICorner")
toggleButtonCorner.CornerRadius = UDim.new(0, 10)
toggleButtonCorner.Parent = toggleButton

-- Функция для переключения видимости GUI
local function toggleGui()
    frame.Visible = not frame.Visible
    borderFrame.Visible = frame.Visible
end

-- Обработчик события для кнопки переключения
toggleButton.MouseButton1Click:Connect(toggleGui)

-- Анимация нажатия на кнопку переключения
toggleButton.MouseButton1Down:Connect(function()
    buttonDown(toggleButton)
end)

toggleButton.MouseButton1Up:Connect(function()
    buttonUp(toggleButton)
end)

-- Анимация открытия и закрытия GUI
local function animateGui(open)
    if open then
        frame:TweenSizeAndPosition(UDim2.new(0, 300, 0, 200), UDim2.new(0.5, -100, 0.5, -50), "Out", "Quad", 0.5, true)
        borderFrame:TweenSizeAndPosition(UDim2.new(0, 304, 0, 204), UDim2.new(0.5, -102, 0.5, -52), "Out", "Quad", 0.5, true)
    else
        frame:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, -100, 0.5, -50), "In", "Quad", 0.5, true)
        borderFrame:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, -102, 0.5, -52), "In", "Quad", 0.5, true)
    end
end

-- Обработчик события для кнопки переключения с анимацией
toggleButton.MouseButton1Click:Connect(function()
    toggleGui()
    animateGui(frame.Visible)
end)

-- Кнопка для полета
local flightButton = Instance.new("TextButton")
flightButton.Size = UDim2.new(0, 100, 0, 50)
flightButton.Position = UDim2.new(0, 120, 0, 15)
flightButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
flightButton.Text = "Flight: Off"
flightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flightButton.Font = Enum.Font.GothamBold
flightButton.TextSize = 14
flightButton.Parent = frame

local flightButtonCorner = Instance.new("UICorner")
flightButtonCorner.CornerRadius = UDim.new(0, 10)
flightButtonCorner.Parent = flightButton

-- Переменная для отслеживания состояния полета
local isFlightOn = false

-- Функция для создания твина
local function createTween(object, properties, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = game:GetService("TweenService"):Create(object, tweenInfo, properties)
    return tween
end

-- Функция для переключения состояния кнопки полета
local function toggleFlightButton()
    isFlightOn = not isFlightOn
    if isFlightOn then
        local tween = createTween(flightButton, {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}, 0.5)
        tween:Play()
        flightButton.Text = "Flight: On"
        sFLY(false)  -- Запуск полета
    else
        local tween = createTween(flightButton, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}, 0.5)
        tween:Play()
        flightButton.Text = "Flight: Off"
        NOFLY()  -- Остановка полета
    end
end

-- Обработчик события для кнопки полета
flightButton.MouseButton1Click:Connect(toggleFlightButton)

-- Анимация нажатия на кнопку полета
flightButton.MouseButton1Down:Connect(function()
    buttonDown(flightButton)
end)

flightButton.MouseButton1Up:Connect(function()
    buttonUp(flightButton)
end)