local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local function simulateCombat(npcName)
    for _, npc in pairs(workspace:GetChildren()) do
        if npc.Name == npcName and npc:FindFirstChild("HumanoidRootPart") then
            root.CFrame = npc.HumanoidRootPart.CFrame + Vector3.new(0, math.random(2,3), math.random(2,4))
            wait(math.random(0.5, 1.2))
            -- Alternatif saldırı simülasyonu
            local tool = character:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate()
                wait(math.random(0.4, 0.8))
            end
            return
        end
    end
end

while true do
    simulateCombat("TargetDummy")
    wait(math.random(2,4))
end
