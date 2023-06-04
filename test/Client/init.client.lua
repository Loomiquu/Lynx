
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lynx = require(ReplicatedStorage.Lynx)

local x: Lynx.StaticComponent<Part> = Lynx.CreateStaticComponent("Part", {}, {})
local y = Lynx.CreateStaticComponent("Part", {}, {})
local z = Lynx.CreateStaticComponent("Part", {}, {})

Lynx.GlobalDispose(x,y,z)
