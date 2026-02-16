-- [[ ✨ AN ĐẸP TRAI HUB - ULTIMATE EDITION ✨ ]] --

-- 1. Hệ Thống Antiban & Safety
task.spawn(function()
    local g = game
    local mt = getrawmetatable(g)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "kick" then
            print("🛡️ [Antiban]: Đã chặn một nỗ lực Kick!")
            return nil
        end
        return old(self, ...)
    end)
    setreadonly(mt, true)
end)

-- 2. Nhạc Mới (ID: 140236066554230)
local s = Instance.new("Sound", game:GetService("SoundService"))
s.SoundId = "rbxassetid://140236066554230" 
s.Volume = 0.7
s.Looped = true 
s:Play()

-- 3. Kích hoạt Script Gốc
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/longhihilonghihi-hub/Devs-LongHiHiV2/refs/heads/main/MainV2.txt"))()
    end)
end)

-- 4. Đổi Tên & Logo AN ĐẸP TRAI
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Long") or v.Text:find("Hub") or v.Text:find("V2") then
                        v.Text = "🔥 AN ĐẸP TRAI HUB 🔥"
                        v.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    end
                end
                if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                    v.Image = "rbxassetid://112243866513809"
                end
            end
        end)
    end
end)

-- 5. Fast Attack
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        local tool = char and char:FindFirstChildOfClass("Tool")
        if tool then 
            tool:Activate() 
            if tool:FindFirstChild("Attack") then tool.Attack:Destroy() end
        end
    end)
end)

print("--- [Hệ Thống]: ĐÃ CẬP NHẬT NHẠC MỚI - QUẨY THÔI AN ĐẸP TRAI! ---")
