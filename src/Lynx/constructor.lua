local mainDirectory = script.Parent
local coreDirectory = mainDirectory.Core
local _version = "0.1.0"

local Types = require(mainDirectory.Types.PublicTypes)

type Lynx = Types.Lynx

return function (Lynx: Lynx, metatable: {})
	Lynx.ClassName = "Lynx"
	Lynx._VERSION = _version

	Lynx.CreateStaticComponent = require(coreDirectory.StaticComponent)
	Lynx.CreateStatefulComponent = require(coreDirectory.StatefulComponent)
	Lynx.GlobalDispose = require(coreDirectory.GlobalDispose)
	Lynx.CreateState = require(coreDirectory.CreateState)

	return setmetatable(Lynx, metatable)
end