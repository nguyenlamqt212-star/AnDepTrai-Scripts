-- [[ ✨ AN ĐẸP TRAI HUB - PREMIUM EDITION ✨ ]] --
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/longhihilonghihi-hub/Devs-LongHiHiV2/refs/heads/main/MainV2.txt"))()
    end)
end)

task.spawn(function()
    while task.wait(0.5) do -- Tăng tốc độ quét để đè tên nhanh hơn
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                -- Đổi tên và hiệu ứng Rainbow 7 màu
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Long") or v.Text:find("Hub") or v.Text:find("V2") then
                        v.Text = "🔥 AN ĐẸP TRAI HUB 🔥"
                        v.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    end
                end
                -- Thay đổi Logo chính chủ của bạn
                if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                    v.Image = "rbxassetid://112243866513809"
                end
            end
        end)
    end
end)

-- Siêu tốc độ đánh (Fast Attack) tối ưu
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

print("--- [AN ĐẸP TRAI]: SCRIPT ĐÃ SẴN SÀNG TÁC CHIẾN! ---")
