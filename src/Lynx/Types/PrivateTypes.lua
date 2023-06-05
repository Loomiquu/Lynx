
export type State = {
	ClassName: string,
	_value: any?,
	_PairedComponents: {{ Component: StatefulComponent<any?>, Property: string }},
	Update: (self: State, newValue: any?) -> nil,
	GetValue: (self: State) -> any?
}

export type StaticComponent<T> = {
	ClassName: string,
	_instance: T,
	Children: { any? },
	GetProps: (self: StaticComponent<T>, ...string) -> { any? },
	Dispose: (self: T) -> nil
}

export type StatefulComponent<U> = {
	ClassName: string,
	_instance: U,
	_states: { State },
	Children: { any? },
	GetProps: (self: StatefulComponent<U>, ...string) -> { any? },
	SetProp: (self: StatefulComponent<U>, prop: string, value: any?) -> nil,
	Dispose: (self: U) -> nil
}

return {}