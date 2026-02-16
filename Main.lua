-- [[ ✨ AN ĐẸP TRAI HUB - FINAL VERSION ✨ ]] --

-- 1. Hệ Thống Antiban (Chống Kick & Bảo vệ tài khoản)
task.spawn(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "kick" then return nil end
        return old(self, ...)
    end)
    setreadonly(mt, true)
end)

-- 2. Hệ Thống Nhạc (ID: 140236066554230)
task.spawn(function()
    local s = Instance.new("Sound", game:GetService("SoundService"))
    s.SoundId = "rbxassetid://140236066554230"
    s.Volume = 0.8
    s.Looped = true
    s:Play()
end)

-- 3. Kích hoạt Script Chính của AN ĐẸP TRAI
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nguyenlamqt212-star/AnDepTrai-Scripts/refs/heads/main/Main.lua"))()
    end)
end)

-- 4. Thay đổi Giao diện (Tên 7 màu & Logo)
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                -- Đổi toàn bộ Text liên quan thành tên của bạn
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Long") or v.Text:find("Hub") or v.Text:find("Script") then
                        v.Text = "🔥 AN ĐẸP TRAI HUB 🔥"
                        v.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    end
                end
                -- Thay đổi mọi Icon thành Logo của bạn
                if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                    v.Image = "rbxassetid://112243866513809"
                end
            end
        end)
    end
end)

-- 5. Fast Attack (Tự động đánh siêu tốc)
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then 
            tool:Activate() 
            if tool:FindFirstChild("Attack") then tool.Attack:Destroy() end
        end
    end)
end)

print("--- [Hệ Thống]: SCRIPT AN ĐẸP TRAI ĐÃ KÍCH HOẠT THÀNH CÔNG! ---")
