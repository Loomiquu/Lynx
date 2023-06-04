export type GlobalState = {
	Update: (self: GlobalState, newValue: any?) -> nil,
	AppendToComponent: (self: GlobalState, StatefulComponent: StatefulComponent<GuiObject>) -> nil
}

export type State = {
	_states: { StaticComponent<any?> | StatefulComponent<any?>},
	Update: (self: State, state: string, newValue: any?) -> nil,
	GetGlobalState: (self: State, state: string) -> GlobalState
}

export type StaticComponent<T> = {
	_instance: T,
	Children: { any? },
	GetProps: (self: StaticComponent<T>, ...string) -> { any? },
	OnDisposed: RBXScriptSignal,
	Dispose: (self: T) -> nil
}

export type StatefulComponent<U> = {
	_instance: U,
	children: { any? },
	props: U,
	states: State,
	OnDisposed: RBXScriptSignal,
	Dispose: (self: U) -> nil
}

return {}