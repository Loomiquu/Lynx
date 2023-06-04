local Types = require(script.Types.PublicTypes)

export type GlobalState = Types.GlobalState
export type State = Types.State
export type StaticComponent<T> = Types.StaticComponent<T>
export type StatefulComponent<U> = Types.StatefulComponent<U>

type Lynx = {
	CreateStaticComponent: <T>(Element: string, Props: T, Children: { any }) -> StaticComponent<T>,
	CreateStatefulComponent: <U>(Element: string, Props: U, Children: { any }) -> StatefulComponent<U>,
	CreateGlobalState: (StateName: string, initValue: any?) -> nil,
	GlobalDispose: <T>(...StaticComponent<T> | StatefulComponent<T>) -> nil
}

local function init()
	local Lynx = {}
	local metatable = {}
	metatable.__index = {}

	return require(script.constructor)(Lynx, metatable)
end

return init() :: Lynx