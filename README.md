-- Gerçek oyuncu gibi davranan AutoFarm + Roll + Dungeon sistemi
-- Mehmet için optimize edildi 💙

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local function simulateCombat(npcName)
    for _, npc in pairs(workspace:GetChildren()) do
        if npc.Name == npcName and npc:FindFirstChild("HumanoidRootPart") then
            root.CFrame = npc.HumanoidRootPart.CFrame + Vector3.new(0, math.random(2,3), math.random(2,4))
            wait(math.random(0.5, 1.2))
            for i = 1, math.random(1, 2) do
                mouse1click()
                wait(math.random(0.4, 0.8))
            end
            return
        end
    end
end

local function autoRoll()
    local rollButton = player.PlayerGui:FindFirstChild("RollGUI")
    if rollButton then
        rollButton:Fire()
        wait(math.random(6, 10))
    end
end

local function dungeonSequence()
    local portals = workspace:FindFirstChild("DungeonPortal")
    if portals then
        root.CFrame = portals.CFrame + Vector3.new(0, 2, 4)
        wait(math.random(4,6))
    end
end

while true do
    simulateCombat("TargetDummy")
    wait(math.random(2,4))
    if math.random() > 0.5 then autoRoll() end
    if math.random() > 0.7 then dungeonSequence() end
    root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(math.random(3,12)), 0)
    wait(math.random(3,6))
end
