-- سكربت دلتا للعشوائية والمرح (Client-side)
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- تأكد من تحميل الشخصية بالكامل
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- إشعار بسيط لتأكيد التفعيل (يظهر لك إنت بس)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Cyber Bot Script",
    Text = "تم تفعيل وضع العشوائية بنجاح!",
    Duration = 3
})

-- حلقة عشوائية تعمل في الخلفية بدون ما تضر اللعبة
task.spawn(function()
    while true do
        -- اختيار حركة عشوائية كل فترة (بين 5 إلى 10 ثواني)
        local randomWait = math.random(5, 10)
        task.wait(randomWait)
        
        -- التأكد من أن اللاعب حي يرزق
        if not character or not humanoid or humanoid.Health <= 0 then
            character = player.Character or player.CharacterAdded:Wait()
            humanoid = character:WaitForChild("Humanoid")
            rootPart = character:WaitForChild("HumanoidRootPart")
            task.wait(2)
        end
        
        local action = math.random(1, 3)
        
        if action == 1 then
            -- حركة 1: سرعة مؤقتة عشوائية
            local oldSpeed = humanoid.WalkSpeed
            humanoid.WalkSpeed = math.random(25, 45)
            task.wait(3)
            humanoid.WalkSpeed = oldSpeed
            
        elseif action == 2 then
            -- حركة 2: قفزة خفيفة (Jump Boost)
            local oldJump = humanoid.JumpPower
            humanoid.JumpPower = math.random(70, 100)
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            task.wait(2)
            humanoid.JumpPower = oldJump
            
        elseif action == 3 then
            -- حركة 3: دوران عشوائي سريع وممتع
            for i = 1, 10 do
                rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(36), 0)
                task.wait(0.05)
            end
        end
    end
end)
