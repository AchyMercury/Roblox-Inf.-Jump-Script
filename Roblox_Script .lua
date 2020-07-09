-- Made By AchyMercury
local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local jump = Instance.new("TextButton")
local esp = Instance.new("TextButton")
local close = Instance.new("TextButton")
local open = Instance.new("Frame")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Position = UDim2.new(0.731906176, 0, 0.656387687, 0)
main.Size = UDim2.new(0, 249, 0, 146)
main.Visible = false
main.Active = true
main.Draggable = true

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
TextLabel.BorderColor3 = Color3.fromRGB(170, 0, 0)
TextLabel.Size = UDim2.new(0, 249, 0, 30)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Achy's  Infinite Jump"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

jump.Name = "jump"
jump.Parent = main
jump.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
jump.Position = UDim2.new(0.0883534104, 0, 0.452054799, 0)
jump.Size = UDim2.new(0, 81, 0, 36)
jump.Font = Enum.Font.SourceSans
jump.Text = "Inf. Jump"
jump.TextColor3 = Color3.fromRGB(0, 0, 0)
jump.TextSize = 14.000

jump.MouseButton1Down:connect(function()
    InfiniteJumpEnabled = true
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfiniteJumpEnabled then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
        end
    end)
end)

esp.Name = "esp"
esp.Parent = main
esp.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
esp.Position = UDim2.new(0.586345375, 0, 0.452054799, 0)
esp.Size = UDim2.new(0, 81, 0, 36)
esp.Font = Enum.Font.SourceSans
esp.Text = "ESP"
esp.TextColor3 = Color3.fromRGB(0, 0, 0)
esp.TextSize = 14.000

faces = {"Front","Back","Bottom","Left","Right","Top"}

function actualESP(obj)
    for i = 0, 5 do
        surface = Instance.new("SurfaceGui", obj)
        surface.Face = Enum.NormalId[faces[i + 1]]
        surface.AlwaysOnTop = true
 
        frame = Instance.new("Frame", surface)
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BorderSizePixel = 0
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(255, 0, 0)
    end
end

function checkPart(obj)
    if (obj:IsA("Part") or obj:IsA("MeshPart")) and obj.Name~="HumanoidRootPart" then
        return true
    end
end

function createESP(c)
    for i, v in pairs(c:GetChildren()) do
        if checkPart(v) then
            actualESP(v)
        end
    end
end

esp.MouseButton1Down:connect(function()
    for i, player in ipairs(game:GetService("Players"):GetPlayers()) do
        createESP(player.Character)
    end
end)

close.Name = "close"
close.Parent = main
close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close.BorderSizePixel = 0
close.Position = UDim2.new(0.879518032, 0, 0, 0)
close.Size = UDim2.new(0, 30, 0, 30)
close.Font = Enum.Font.GothamBold
close.Text = "X"
close.TextColor3 = Color3.fromRGB(0, 0, 0)
close.TextSize = 14.000
close.MouseButton1Down:connect(function()
    main.Visible = false
    open.Visible = true
end)

open.Name = "open"
open.Parent = ScreenGui
open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
open.Position = UDim2.new(0.0101937056, 0, 0.449339211, 0)
open.Size = UDim2.new(0, 50, 0, 26)
open.Active = true
open.Draggable = true

TextButton.Parent = open
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
TextButton.Size = UDim2.new(0, 50, 0, 26)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "OPEN"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000
TextButton.MouseButton1Down:connect(function()
    TextButton.Visible = false
    main.Visible = true	
end)