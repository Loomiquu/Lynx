
export type State = {
	ClassName: string,
	Update: (self: State, newValue: any?) -> nil,
	GetValue: (self: State) -> any?
}

export type StaticComponent<T> = {
	ClassName: string,
	Children: { any? },
	GetProps: (self: StaticComponent<T>, ...string) -> { any? },
	Dispose: (self: T) -> nil
}

export type StatefulComponent<U> = {
	ClassName: string,
	Children: { any? },
	GetProps: (self: StaticComponent<U>, ...string) -> { any? },
	SetProp: (self: StatefulComponent<U>, prop: string, value: any?) -> nil,
	Dispose: (self: U) -> nil
}

export type Lynx = {
	_VERSION: string,
	ClassName: string,
	CreateStaticComponent: <T>(Element: string, Props: T, Children: { any }) -> StaticComponent<T>,
	CreateStatefulComponent: <U>(Element: string, Props: U, Children: { any }) -> StatefulComponent<U>,
	ImportComponent: <V>(GuiObject: V) -> StatefulComponent<V>,
	CreateState: (initValue: any?) -> State,
	GlobalDispose: <T>(...StaticComponent<T> | StatefulComponent<T>) -> nil
}

return {}