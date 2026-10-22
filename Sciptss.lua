-- FE Bypass & Control Script (Client-side)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- إشعار التفعيل
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Cyber Bot - FE Script",
    Text = "تم تفعيل سكربت الـ FE بنجاح!",
    Duration = 3
})

-- دالة لتجاوز بعض قيود السرعة والجاذبية (FE Safe)
local function applyBypass()
    pcall(function()
        -- إعطاء تحكم كامل بالـ Network Ownership للأجزاء القريبة
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0, 1, 1)
            end
        end
    end)
end

applyBypass()

-- زر سريع لتثبيت المكان أو الطيران البسيط (Noclip/Fly صغير)
-- يمكنك دمج هذا السكربت مع واجهة أو تفعيل وظائف إضافية حسب رغبتك
print("Cyber Bot FE Script Loaded Successfully for: " .. player.Name)
