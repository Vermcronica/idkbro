--[[
    Idk why I publish this, I make (maybe) a bypass of anticheat in One Kill Tower, taht game sucks. OPEN SOURCE (its not viruses bruh)
    made by Prystalism.
    discord: https://discord.gg/BBXnm9R5Cj
]]


local remotes = {
    "BPCheck", "DonationGUI", "ReportUIS", "DamageEvent", "AFKRemote",
    "PingPong", "LogErrorToClient", "NextbotAnalytic", "ServerNotify", "SummonGui",
    "ToolkitCm", "NextbotPos", "ForceLowGPU", "ChangeLighting", "ConvertPlayerRig",
    "CheckIfCC", "CharToolCheck", "InstantRestart"
}

local function isUUIDFormat(name)
    local pattern = "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$"
    return name:match(pattern) ~= nil
end

local storage = game:GetService("ReplicatedStorage")
local remotesFolder = storage:FindFirstChild("Remotes")

if not storage then
    warn(":: Malfunction :: 'ReplicatedStorage' Not Found (IMPOSSIBLE)!")
    return
end

local count = 0
local success = 0
local failure = 0
local total = 20

if remotesFolder then
    for _, remoteName in ipairs(remotes) do
        local remote = remotesFolder:FindFirstChild(remoteName)
        count = count + 1
        if remote then
            remote:Destroy()
            success = success + 1
            print(string.format(":: Malfunction :: Destroying '%s'. Operation completed... (%d/%d)", remoteName, count, total))
        else
            failure = failure + 1
            warn(string.format(":: Malfunction :: '%s' not found or already destroyed. Skipping... (%d/%d)", remoteName, count, total))
        end
    end
else
    warn(":: Malfunction :: Folder 'Remotes' tidak ditemukan!")
end

local uuidList = {}
for _, remote in pairs(storage:GetChildren()) do
    if remote:IsA("RemoteEvent") and isUUIDFormat(remote.Name) then
        table.insert(uuidList, remote)
    end
end

total = total + #uuidList
if #uuidList > 0 then
    for _, remote in ipairs(uuidList) do
        count = count + 1
        remote:Destroy()
        success = success + 1
        print(string.format(":: Malfunction :: Destroying UUID RemoteEvent '%s'. Operation balanced... (%d/%d)", remote.Name, count, total))
    end
else
    count = count + 1
    failure = failure + 1
    print(string.format(":: Malfunction :: No UUID RemoteEvent found. Skipping... (%d/%d)", count, total))
end

local StarterP = game:GetService("StarterPlayer")
local Players = game:GetService("Players")

local flip = StarterP:WaitForChild("StarterPlayerScripts"):FindFirstChild("Flip")
local flip1 = Players.LocalPlayer.PlayerScripts:FindFirstChild("Flip")
local hevnt = StarterP:WaitForChild("StarterCharacterScripts"):FindFirstChild("HumanoidEvent")
local hevnt1 = Players.LocalPlayer.Character:FindFirstChild("HumanoidEvent")

if flip then
    count = count + 1
    flip:Destroy()
    flip1:Destroy()
    success = success + 1
    print(string.format(":: Malfunction :: Flip Localscript destroyed. Operation completed... (%d/%d)", count, total))
else
    count = count + 1
    failure = failure + 1
    warn(string.format(":: Malfunction :: Flip is not found. Skipping... (%d/%d)", count, total))
end

if hevnt then
    count = count + 1
    hevnt:Destroy()
    hevnt1:Destroy()
    success = success + 1
    print(string.format(":: Malfunction :: HumanoidEvent Localscript destroyed. Operation completed... (%d/%d)", count, total))
else
    count = count + 1
    failure = failure + 1
    warn(string.format(":: Malfunction :: HumanoidEvent is not found. Skipping... (%d/%d)", count, total))
end

local successRate = (success / total) * 100
local failureRate = (failure / total) * 100

print(":: Malfunction :: Cleanup Summary")
print(string.format(":: Malfunction :: Success: %d (%.2f%%)", success, successRate))
print(string.format(":: Malfunction :: Failure: %d (%.2f%%)", failure, failureRate))
print(":: Malfunction:: --[[ Diac.logs Removed Successfull ]]--")
wait(1)
print("Look above, Adonis crying in my room, btw you get kicked in >300 seconds, only got kicked, you can rejoin back to the game.")
