
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lynx = require(ReplicatedStorage.Lynx)

local state = Lynx.CreateState(UDim2.new(0.25,0,0.25,0))

local mainGui = Lynx.CreateStaticComponent("ScreenGui", 
{
	IgnoreGuiInset = true,
	Parent = Players.LocalPlayer.PlayerGui
},
{
	label = Lynx.CreateStatefulComponent("TextLabel",
	{
		Size = state,
		Position = UDim2.new(0.25,0,0,20)
	}),

	label2 = Lynx.CreateStatefulComponent("TextLabel",
	{
		Size = UDim2.new(0.25,0,0,20),
		Position = state
	})
})

local switch = false
while true do

	if switch then
		state:Update(UDim2.new(0.1,0,0.1,0))
		else
		state:Update(UDim2.new(0.25,0,0.25,0))
	end

	switch = not switch
	task.wait(1)
end