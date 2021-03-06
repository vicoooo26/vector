package metadata

remap: functions: assert: {
	arguments: [
		{
			name:        "condition"
			description: "The condition to check."
			required:    true
			type: ["boolean"]
		},
		{
			name:        "message"
			description: "Should condition be false, message will be reported as the failure message."
			required:    true
			type: ["string"]
		},
	]
	internal_failure_reasons: [
		"`condition` evaluates to `false`",
	]
	return: ["null"]
	category: "Debug"
	description: #"""
		Checks a given condition.

		If that condition evaluates to `false` the event is aborted with the provided `message`.
		"""#
	examples: [
		{
			title: "Assertion (true)"
			input: log: foo: "foo"
			source: #"""
				assert(.foo == "foo", message: "Foo must be foo!")
				"""#
			output: input
		},
		{
			title: "Assertion (false)"
			input: log: foo: "bar"
			source: #"""
				assert(.foo == "foo", message: "Foo must be foo!")
				"""#
			raises: "Foo must be foo!"
		},
	]
}
