local coreDirectory = script.Parent.Parent
local mainDirectory = coreDirectory.Parent

local Types = require(mainDirectory.Types.PrivateTypes)

type StatefulComponent<T> = Types.StatefulComponent<T>

return function <T>(self: StatefulComponent<T>, prop: string, newValue: any?)
	
	self._instance[prop] = newValue
end