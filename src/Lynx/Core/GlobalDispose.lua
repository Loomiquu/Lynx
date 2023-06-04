local mainDirectory = script.Parent.Parent

local Types = require(mainDirectory.Types.PrivateTypes)

type StatefulComponent<T> = Types.StatefulComponent<T>
type StaticComponent<U> = Types.StaticComponent<U>

return function (...)
	assert(type(...) == "table", "Given Instance is not a Component")

	for _, component: StaticComponent<Instance?> | StatefulComponent <Instance?> in next, { ... } do
		assert(component._instance ~= nil, "Given Component has no Instance, Dispose Cancelled")
		component._instance:Destroy()
		table.clear(component)
		component = nil
	end
end