local coreDirectory = script.Parent.Parent
local mainDirectory = coreDirectory.Parent

local Types = require(mainDirectory.Types.PrivateTypes)

type StaticComponent<T> = Types.StaticComponent<T>
type StatefulComponent<U> = Types.StatefulComponent<U>

return function (self: StaticComponent<GuiObject?> | StaticComponent<GuiObject?>)
	assert(self._instance ~= nil, "Given Component has no Instance, Dispose Cancelled")
	self._instance:Destroy()
	table.clear(self)
	self = nil
end