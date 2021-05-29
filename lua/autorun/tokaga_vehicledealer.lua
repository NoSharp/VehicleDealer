local file_Find = file.Find
local ipairs = ipairs
local AddCSLuaFile = AddCSLuaFile
local include = include

DTVM = DTVM or {}
DTVM.Config = DTVM.Config or {}
DTVM.Utils = DTVM.Utils or {}

local function load_directory(dir)
    local fil, fol = file.Find(dir .. "/*", "LUA")
    for k,v in ipairs(fol) do
        load_directory(dir .. "/" .. v)
    end
    for k,v in ipairs(fil) do
        local dirs = dir .. "/" .. v
        if v:StartWith("cl_") then
            if SERVER then
                AddCSLuaFile(dirs)
            else
                include(dirs)
            end
        elseif v:StartWith("sh_") then
            AddCSLuaFile(dirs)
            include(dirs)
        else
            if SERVER then
                include(dirs)
            end
        end
    end
end

hook.Add("InitPostEntity", "DTVM_autorun", function()
    load_directory("DTVM/utils")
    load_directory("DTVM/config")
    load_directory("DTVM/meta")
    load_directory("DTVM/main")
    load_directory("DTVM/net")
    load_directory("DTVM/ui")
end)
