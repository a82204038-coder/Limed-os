-- التأكد من تحميل اللاعب والشخصية بالكامل
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- إنشاء واجهة المستخدم (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProHubGUI"
ScreenGui.Parent = game.CoreGui

-- الإطار الرئيسي للـ GUI
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 220)
MainFrame.Position = UDim2.new(0.5, -125, 0.4, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- السماح بتحريك الواجهة في دلتا
MainFrame.Parent = ScreenGui

-- زوايا دائرية للـ GUI
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- عنوان الواجهة
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.Text = "🔥 Pro Script Hub 🔥"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

-- زر 1: تغيير خلفية الماب (Skybox عشوائي أو ليلي فخم)
local SkyButton = Instance.new("TextButton")
SkyButton.Size = UDim2.new(0.85, 0, 0, 40)
SkyButton.Position = UDim2.new(0.075, 0, 0.25, 0)
SkyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SkyButton.Text = "تغيير خلفية الماب 🌌"
SkyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SkyButton.TextSize = 14
SkyButton.Font = Enum.Font.SourceSansBold
SkyButton.Parent = MainFrame
Instance.new("UICorner", SkyButton)

SkyButton.MouseButton1Click:Connect(function()
    local lighting = game:GetService("Lighting")
    -- إزالة السكاي القديم إن وجد
    for _, v in pairs(lighting:GetChildren()) do
        if v:IsA("Sky") then v:Destroy() end
    end
    -- إضافة سكاي جديد فخم
    local newSky = Instance.new("Sky")
    newSky.SkyboxBk = "rbxassetid://159454299"
    newSky.SkyboxDn = "rbxassetid://159454296"
    newSky.SkyboxFt = "rbxassetid://159454293"
    newSky.SkyboxLf = "rbxassetid://159454286"
    newSky.SkyboxRt = "rbxassetid://159454300"
    newSky.SkyboxUp = "rbxassetid://159454303"
    newSky.Parent = lighting
end)

-- زر 2: ألوان عشوائية للماب (Ambient Lighting)
local ColorButton = Instance.new("TextButton")
ColorButton.Size = UDim2.new(0.85, 0, 0, 40)
ColorButton.Position = UDim2.new(0.075, 0, 0.47, 0)
ColorButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ColorButton.Text = "ألوان عشوائية للماب 🎨"
ColorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ColorButton.TextSize = 14
ColorButton.Font = Enum.Font.SourceSansBold
ColorButton.Parent = MainFrame
Instance.new("UICorner", ColorButton)

ColorButton.MouseButton1Click:Connect(function()
    spawn(function()
        for i = 1, 15 do
            game:GetService("Lighting").Ambient = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
            task.wait(0.5)
        end
    end)
end)

-- زر 3: تأثيرات على جسم المستخدم (Fire + Sparkles + Glowing)
local EffectButton = Instance.new("TextButton")
EffectButton.Size = UDim2.new(0.85, 0, 0, 40)
EffectButton.Position = UDim2.new(0.075, 0, 0.69, 0)
EffectButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
EffectButton.Text = "تأثيرات نارية على الجسم ✨"
EffectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EffectButton.TextSize = 14
EffectButton.Font = Enum.Font.SourceSansBold
EffectButton.Parent = MainFrame
Instance.new("UICorner", EffectButton)

EffectButton.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") then
        local targetPart = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
        
        -- إضافة نار
        local fire = Instance.new("Fire")
        fire.Size = 10
        fire.Heat = 15
        fire.Parent = targetPart
        
        -- إضافة شرار
        local sparkles = Instance.new("Sparkles")
        sparkles.Parent = targetPart
        
        -- تغيير لون أجزاء الجسم عشوائياً
        for _, part in pairs(char:GetChildren()) do
            if part:IsA("BasePart") then
                part.BrickColor = BrickColor.random()
            end
        end
    end
end)
