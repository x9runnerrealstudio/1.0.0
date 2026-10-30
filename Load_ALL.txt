local Players = game:GetService("Players")
local GameId = game.GameId
local IDgame = {
  [994732206] = "d2c2a9dc084ed3aebbc9423ef74a7e2166d9e", -- Blox Fruit (GameId)
  
}

local HANDLER_URL = "https://raw.githubusercontent.com/x9runnerrealstudio/1.0.0/refs/heads/main/x9runnerxdkl.lua"
local KEY_FILE = "X9Key.txt"
local function readKeyFile()
  local ok, v = pcall(function()
    if type(isfile) == "function" and type(readfile) == "function" and isfile(KEY_FILE) then
      return tostring(readfile(KEY_FILE) or "")
    end
  end)
  if ok and v then return (v:gsub("%s+$", "")) end
  return ""
end
local genv = (type(getgenv) == "function" and getgenv()) or _G
local waitFn = (type(task) == "table" and task.wait) or wait
for _ = 1, 30 do
  local ok, ready = pcall(function()
    return game:IsLoaded() and Players.LocalPlayer ~= nil
  end)
  if ok and ready then break end
  pcall(waitFn, 1)
end
local cfg = type(genv.Config) == "table" and genv.Config or {}
local key = tostring(genv.Key or genv.key or genv.X9_KEY or cfg.Key or cfg.key or "")
if key == "" then key = readKeyFile() end
if key == "" then return end
local forcedKey = genv.X9_GAMEKEY and tostring(genv.X9_GAMEKEY)
  or (cfg.GameKey and tostring(cfg.GameKey)) or nil
local gameKey = forcedKey or IDgame[GameId] or IDgame[game.PlaceId] or ""
if gameKey == "" then return end
genv.X9_GAMEKEY = gameKey
local ok, source = pcall(function() return game:HttpGet(HANDLER_URL) end)
if not ok or type(source) ~= "string" or source == "" then return end
local fn = loadstring(source, "X9")
if type(fn) ~= "function" then return end
pcall(fn)
