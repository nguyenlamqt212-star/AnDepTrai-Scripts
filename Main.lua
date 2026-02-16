-- [[ ✨ AN ĐẸP TRAI HUB - REMIX EDITION ✨ ]] --

-- 1. Hệ thống Nhạc Remix (Auto Play & Loop)
local s = Instance.new("Sound", game:GetService("SoundService"))
s.SoundId = "rbxassetid://5410086218" -- ID Nhạc Remix cực cháy
s.Volume = 0.8
s.Looped = true
s:Play()

-- 2. Kích hoạt Script Gốc
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/longhihilonghihi-hub/Devs-LongHiHiV2/refs/heads/main/MainV2.txt"))()
    end)
end)

-- 3. Đổi Tên, Màu Sắc và ẢNH Logo (An Đẹp Trai)
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

-- 4. Siêu Tốc Độ Đánh (Fast Attack)
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

print("--- [Hệ Thống]: NHẠC REMIX ĐÃ LÊN - CHÚC AN ĐẸP TRAI FARM VUI VẺ! ---")
