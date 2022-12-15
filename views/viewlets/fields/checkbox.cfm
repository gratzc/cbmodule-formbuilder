<cfoutput>
	#prc.html.checkBox(
		name     = variables.args.field.getName(),
		label    = variables.args.field.getLabel(),
		required = variables.args.field.getIsRequired(),
		value    = variables.args.field.getDefaultValue(),
		id       = variables.args.field.getCSSID(),
		class    = variables.args.field.getCSSClass()
	)#
</cfoutput>