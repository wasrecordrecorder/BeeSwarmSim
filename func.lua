function ClaimHive()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local eventstore = {
        ClaimHive = ReplicatedStorage.Events.ClaimHive
    }
    local Workspace = game:GetService("Workspace")
    for _, v in Workspace.Honeycombs:GetChildren() do
        if v.Owner.Value ~= nil then continue end
        eventstore.ClaimHive:FireServer(v.HiveID.Value)
    end
end

function createESP(player)
    local character = player.Character
    if not character then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "ESPHighlight"
    highlight.Adornee = character
    highlight.FillColor = Color3.new(1, 0, 0) -- Красный цвет
    highlight.OutlineColor = Color3.new(0, 1, 0) -- Зеленый цвет для контура
    highlight.Parent = character
end

function removeESP(player)
    local character = player.Character
    if not character then return end

    local highlight = character:FindFirstChild("ESPHighlight")
    if highlight then
        highlight:Destroy()
    end
end

function checkPlayers()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name == "was_record" or player.Name == "fggfgfggfffg" then
            createESP(player)
        else
            removeESP(player)
        end
    end
end

function clickAllStickers()
    -- Получаем доступ к Workspace и HiddenStickers
    local workspace = game:GetService("Workspace")
    local hiddenStickers = workspace.HiddenStickers

    -- Перебираем все дочерние объекты в HiddenStickers
    for _, sticker in ipairs(hiddenStickers:GetChildren()) do
        -- Получаем ClickDetector
        local clickDetector = sticker:FindFirstChildOfClass("ClickDetector")
        -- Кликаем по объекту
        fireclickdetector(clickDetector)
    end
end

function enableNoclip()
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

function disableNoclip()
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

function toggleNoClip()
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

function toggleFlight()
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

-- Функция для заморозки персонажа
function freezeCharacter()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Отключение анимаций и физики
    humanoid.PlatformStand = true
    humanoidRootPart.Anchored = true
end

-- Функция для разморозки персонажа
function unfreezeCharacter()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Включение анимаций и физики
    humanoid.PlatformStand = false
    humanoidRootPart.Anchored = false
end

function AutoQuest()
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

function teleportToObjectt(object, angle)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local angleRad = math.rad(angle)
    local position = object.Position
    local newLookVector = Vector3.new(math.cos(angleRad), 0, math.sin(angleRad))
    
    -- Установка новой CFrame с текущей позицией и новой ориентацией
    humanoidRootPart.CFrame = CFrame.new(position, position + newLookVector)
end

function teleportBeesToPlayer()
    local playerPosition = player.Character.HumanoidRootPart.Position
    for _, bee in pairs(game.Workspace.Bees:GetChildren()) do
        if bee:IsA("BasePart") then
            bee.Position = playerPosition
        end
    end
end

function moveToCollectibles()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local playerPosition = character.HumanoidRootPart.Position

    local collectibles = game.Workspace.Collectibles:GetChildren()
    local nearestCollectible = nil
    local nearestDistance = math.huge

    for _, collectible in ipairs(collectibles) do
        if collectible.Transparency == 0 and collectible ~= lastMovedCollectible and not table.find(collectedItems, collectible) then
            local distance = (collectible.Position - playerPosition).Magnitude
            if distance < nearestDistance and distance <= 60 then -- Добавлено условие на расстояние
                nearestDistance = distance
                nearestCollectible = collectible
            end
        end
    end

    if nearestCollectible then
        print("Moving to nearest collectible: " .. nearestCollectible.Name .. ", Distance: " .. nearestDistance) -- Отладочная информация
        humanoid:MoveTo(nearestCollectible.Position)
        humanoid.MoveToFinished:Wait() -- Ожидание завершения перемещения
        table.insert(collectedItems, nearestCollectible) -- Добавление предмета в список собранных предметов
        lastMovedCollectible = nearestCollectible -- Обновление последнего перемещенного предмета
    else
        print("No collectibles found within 60 meters or all collectibles have been moved to recently")
    end
end

function moveToCrosshairs()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local playerPosition = character.HumanoidRootPart.Position

    local crosshairs = game.Workspace.Particles:GetChildren()
    local nearestCrosshair = nil
    local nearestDistance = math.huge

    for _, crosshair in ipairs(crosshairs) do
        if crosshair.Name == "Crosshair" and not visitedCrosshairs[crosshair] then
            local distance = (crosshair.Position - playerPosition).Magnitude
            if distance < nearestDistance then
                nearestDistance = distance
                nearestCrosshair = crosshair
            end
        end
    end

    if nearestCrosshair then
        local targetPosition = nearestCrosshair.Position
        local distanceToTarget = (playerPosition - targetPosition).Magnitude

        while distanceToTarget > 2 do -- Пороговое значение для близости к центру объекта
            humanoid:MoveTo(targetPosition)
            wait(0.1) -- Небольшая задержка для обновления позиции
            playerPosition = character.HumanoidRootPart.Position
            distanceToTarget = (playerPosition - targetPosition).Magnitude
        end

        visitedCrosshairs[nearestCrosshair] = true -- Помечаем объект как посещенный
    else
        print("No Crosshair found")
    end
end

function toggleAutoDispenser()
    autoDispenserEnabled = not autoDispenserEnabled
    if autoDispenserEnabled then
        autoDispenserButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Зеленый цвет
        autoDispenserButton.Text = "AutoDispenser: on"
        -- Запуск цикла
        autoDispenserLoop = coroutine.create(function()
            while autoDispenserEnabled do
                local dispensers = {
                    "Glue Dispenser",
                    "Wealth Clock",
                    "Coconut Dispenser",
                    "Strawberry Dispenser",
                    "Treat Dispenser",
                    "Free Ant Pass Dispenser",
                    "Blueberry Dispenser",
                    "Honey Dispenser",
                    "Free Royal Jelly Dispenser"
                }
                for _, dispenser in ipairs(dispensers) do
                    local A_1 = dispenser
                    local Event = game:GetService("ReplicatedStorage").Events.ToyEvent
                    Event:FireServer(A_1)
                end
		game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Gingerbread House")
                wait(5) -- Ждем 5 секунд перед следующим выполнением
            end
        end)
        coroutine.resume(autoDispenserLoop)
    else
        autoDispenserButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Серый цвет
        autoDispenserButton.Text = "AutoDispenser: off"
        -- Остановка цикла, если он запущен
        if autoDispenserLoop then
            autoDispenserEnabled = false
            coroutine.close(autoDispenserLoop)
            autoDispenserLoop = nil
        end
    end
end