local Types = require(script.Types.PublicTypes)

export type State = Types.State
export type StaticComponent<T> = Types.StaticComponent<T>
export type StatefulComponent<U> = Types.StatefulComponent<U>

type Lynx = Types.Lynx

local function init()
	local Lynx = {}
	local metatable = {}
	metatable.__index = {}

	return require(script.constructor)(Lynx, metatable)
end

return init() :: Lynx