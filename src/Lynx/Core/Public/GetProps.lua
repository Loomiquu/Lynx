local coreDirectory = script.Parent.Parent
local mainDirectory = coreDirectory.Parent

local Types = require(mainDirectory.Types.PrivateTypes)

type StaticComponent<T> = Types.StaticComponent<T>
type StatefulComponent<U> = Types.StatefulComponent<U>

local function GetProps<T>(self: StaticComponent<T> | StatefulComponent<T>, ...: string)
	local indeces = type(...) == "table" and ... or { ... }
	for i, value in next, indeces do
		assert(self._instance[value] ~= nil, "Property doesn't exist")
		if indeces[i] == nil then break end

		local prop = self._instance[value]
		table.remove(indeces, i)

		return prop, GetProps(self, indeces)
	end
end

return GetProps