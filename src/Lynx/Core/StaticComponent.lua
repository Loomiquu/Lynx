local coreDirectory = script.Parent
local mainDirectory = coreDirectory.Parent

local Types = require(mainDirectory.Types.PrivateTypes)

type StaticComponent<T> = Types.StaticComponent<T>

return function <T>(Element: string, props: { T }, children: { any? }): StaticComponent<T>
	local component: StaticComponent<T> = {}

	local element
	local ok, err = pcall(function() element = Instance.new(Element) end)
	component._instance = element
	component.Children = {}

	if not ok then error(err) end

	for prop, value in next, props do
		if prop == "Event" then continue end

		element[prop] = value
	end

	for event, func in next, props.Event or {} do
		element[event]:Connect(func)
	end

	for name, childComponent in next, children or {} do
		childComponent._instance.Name = name
		childComponent._instance.Parent = component._instance

		component.Children[name] = childComponent
	end

	component.GetProps = require(coreDirectory.Public.GetProps)
	component.Dispose = require(coreDirectory.Public.Dispose)

	return component
end