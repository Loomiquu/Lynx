local coreDirectory = script.Parent
local mainDirectory = coreDirectory.Parent

local Types = require(mainDirectory.Types.PrivateTypes)

type State = Types.State

function GetValue(self: State)
	return self._value
end

function Update(self: State, newValue)
	if self._PairedComponents == nil then error("State has not been assigned") end
	self._value = newValue

	for _, pairedComponent in next, self._PairedComponents do
		pairedComponent.Component:SetProp(pairedComponent.Property, newValue)
	end
end

return function (initValue: any?)
	local State: State = {}
	State.ClassName = "State"
	State._PairedComponents = {}
	State._value = initValue

	State.GetValue = GetValue
	State.Update = Update

	return State
end