-- PHẠM NGHĨA IOS - Skinned Lion Hub
repeat wait() until game:IsLoaded()

-- Hiển thị thông báo loading
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Phạm Nghĩa IOS",
    Text = "Đang tải script...",
    Duration = 3
})

-- Load script Lion gốc (giữ nguyên toàn bộ chức năng)
getgenv().Team = "Pirates"
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NHMdz/BloxFruit/refs/heads/main/Lion%20Hub.lua"))()
end)

if not success then
    warn("Không thể tải script Lion gốc:", err)
end

-- Sau khi GUI Lion hiện ra thì thay tên và ảnh
spawn(function()
    wait(5)
    local ui = game.CoreGui:FindFirstChildWhichIsA("ScreenGui", true)
    if ui then
        for _, lbl in pairs(ui:GetDescendants()) do
            if lbl:IsA("TextLabel") and lbl.Text:lower():find("lion") then
                lbl.Text = lbl.Text:gsub("Lion", "Phạm Nghĩa IOS")
            end
        end
        for _, img in pairs(ui:GetDescendants()) do
            if img:IsA("ImageLabel") and img.Image then
                img.Image = "https://i.imgur.com/JrgPMTO.jpeg"
            end
        end
    end
end)
