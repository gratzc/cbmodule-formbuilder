<cfoutput>
	#prc.html.chooseGroup(
		name     = variables.args.field.getName(),
		label    = variables.args.field.getLabel(),
		required = variables.args.field.getIsRequired(),
		field    = variables.args.field.getName(),
		options  = variables.args.field.getFieldOptions(),
		id       = variables.args.field.getCSSID(),
		class    = variables.args.field.getCSSClass(),
		type     = "radio"
	)#
</cfoutput>