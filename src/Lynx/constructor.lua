local mainDirectory = script.Parent
local coreDirectory = mainDirectory.Core

local Types = require(mainDirectory.Types.PublicTypes)

type Lynx = Types.Lynx

return function (Lynx: Lynx, metatable: {})
	
	Lynx.CreateStaticComponent = require(coreDirectory.StaticComponent)
	Lynx.GlobalDispose = require(coreDirectory.GlobalDispose)

	return setmetatable(Lynx, metatable)
end