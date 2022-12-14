<cfdump var="#variables.args.field.getFieldOptions()#" label="options" abort="1">
<cfoutput>
	#prc.html.select(
		name       = variables.args.field.getName(),
		label      = variables.args.field.getLabel(),
		required   = variables.args.field.getIsRequired(),
		help       = variables.args.field.getHelpText(),
		id         = variables.args.field.getCSSID(),
		class      = variables.args.field.getCSSClass(),
		options    = variables.args.field.getFieldOptions(),
		column     = "actualValue",
		nameColumn = "displayValue"
	)#
</cfoutput>