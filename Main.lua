-- Chống văng game (Anti-AFK)
local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- KHỞI TẠO CỬA SỔ
local Window = Rayfield:CreateWindow({
   Name = "AN ĐẸP TRAI HUB | Blox Fruits",
   LoadingTitle = "Đang khởi tạo AN ĐẸP TRAI HUB...",
   LoadingSubtitle = "by Gemini AI",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "AnDepTraiScripts"
   }
})

-- BIẾN TOÀN CỤC
_G.AutoFarm = false

-- HÀM DI CHUYỂN TWEEN (Mượt và an toàn)
function TweenTo(TargetCFrame)
    local Character = game.Players.LocalPlayer.Character
    if Character and Character:FindFirstChild("HumanoidRootPart") then
        local RootPart = Character.HumanoidRootPart
        local Distance = (TargetCFrame.p - RootPart.Position).Magnitude
        local Speed = 250 
        local TweenService = game:GetService("TweenService")
        local Info = TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear)
        
        -- Dừng các Tween cũ để tránh xung đột
        local Tween = TweenService:Create(RootPart, Info, {CFrame = TargetCFrame})
        Tween:Play()
        return Tween
    end
end

-- TAB CHÍNH
local MainTab = Window:CreateTab("Main Farm", 4483362458)
MainTab:CreateSection("Tự Động Cày Cấp")

local FarmToggle = MainTab:CreateToggle({
   Name = "Bật Auto Farm Level",
   CurrentValue = false,
   Flag = "FarmFlag", 
   Callback = function(Value)
      _G.AutoFarm = Value
      
      task.spawn(function()
         while _G.AutoFarm do
            task.wait(0.1)
            pcall(function() -- Dùng pcall để tránh lỗi văng script khi nhân vật chết
                local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
                local hasQuest = PlayerGui.Main.Quest.Visible
                
                if not hasQuest then
                    -- Tọa độ NPC nhận Quest (Ví dụ: Đảo Bandit)
                    TweenTo(CFrame.new(1059.4, 15.4, 1545.2))
                    task.wait(1)
                    -- Lệnh nhận Quest từ Server
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BanditQuest", 1)
                else
                    -- Tọa độ vị trí Quái (Thay đổi theo từng Quest)
                    TweenTo(CFrame.new(1060.5, 25.0, 1530.8))
                    
                    -- Tự động Click đánh quái
                    VirtualUser:CaptureController()
                    VirtualUser:Button1Down(Vector2.new(1280, 672))
                end
            end)
         end
      end)
   end,
})

-- TAB NGƯỜI CHƠI
local MiscTab = Window:CreateTab("Người Chơi", 4483362458)
MiscTab:CreateSection("Tùy Chỉnh Chỉ Số")

MiscTab:CreateSlider({
   Name = "Tốc độ chạy (WalkSpeed)",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(V) 
       local char = game.Players.LocalPlayer.Character
       if char and char:FindFirstChild("Humanoid") then
           char.Humanoid.WalkSpeed = V 
       end
   end,
})

MiscTab:CreateButton({
    Name = "Hủy Menu (Destroy UI)",
    Callback = function()
        Rayfield:Destroy()
    end,
})

Rayfield:Notify({
    Title = "AN ĐẸP TRAI HUB",
    Content = "Chào mừng bạn! Script đã tải thành công.",
    Duration = 5
})
