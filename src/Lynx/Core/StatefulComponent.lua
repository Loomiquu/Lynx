local coreDirectory = script.Parent
local mainDirectory = coreDirectory.Parent

local Types = require(mainDirectory.Types.PrivateTypes)

type StatefulComponent<T> = Types.StatefulComponent<T>
type State = Types.State

return function <T>(Element: string, props: { T }, Children: { any? }): StatefulComponent<T>
	local component: StatefulComponent<T> = {}

	local element
	local ok, err = pcall(function() element = Instance.new(Element) end)
	component.ClassName = `StatefulComponent<{element.ClassName}>`
	component._instance = element
	component.Children = {}

	if not ok then error(err) end

	for prop, value: State | any? in next, props do
		if prop == "Event" or prop == "Listener" then continue end
		if type(value) == "table" and value.ClassName == "State" then element[prop] = value:GetValue(); value._PairedComponents[#value._PairedComponents+1] = { Component = component, Property = prop} continue end
		element[prop] = value
	end

	for event, func in next, props.Event or {} do
		element[event]:Connect(func)
	end

	for property, func in next, props.Listener or {} do
		element:GetPropertyChangedSignal(property):Connect(func)
	end

	for name, childComponent in next, Children or {} do
		childComponent._instance.Name = name
		childComponent._instance.Parent = component._instance

		component.Children[name] = childComponent
	end

	component.GetProps = require(coreDirectory.Public.GetProps)
	component.Dispose = require(coreDirectory.Public.Dispose)
	component.SetProp = require(coreDirectory.Public.SetProp)

	return component
end