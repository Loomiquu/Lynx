export type GlobalState = {
	Update: (self: GlobalState, newValue: any?) -> nil,
	AppendToComponent: (self: GlobalState, StatefulComponent: StatefulComponent<GuiObject>) -> nil
}

export type State = {
	Update: (self: State, state: string, newValue: any?) -> nil,
	GetGlobalState: (self: State, state: string) -> GlobalState
}

export type StaticComponent<T> = {
	props: T,
	Children: { any? },
	GetProps: (self: StaticComponent<T>, ...string) -> { any? },
	OnDisposed: RBXScriptSignal,
	Dispose: (self: T) -> nil
}

export type StatefulComponent<U> = {
	props: U,
	Children: { any? },
	states: State,
	OnDisposed: RBXScriptSignal,
	Dispose: (self: U) -> nil
}

export type Lynx = {
	CreateStaticComponent: <T>(Element: string, Props: T, Children: { any }) -> StaticComponent<T>,
	CreateStatefulComponent: <U>(Element: string, Props: U, Children: { any }) -> StatefulComponent<U>,
	CreateGlobalState: (StateName: string, initValue: any?) -> nil,
	GlobalDispose: <T>(...StaticComponent<T> | StatefulComponent<T>) -> nil
}

return {}