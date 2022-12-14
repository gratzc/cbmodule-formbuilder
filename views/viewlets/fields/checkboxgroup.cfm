<cfoutput>
	#prc.html.chooseGroup(
		type="checkbox",
		field   = variables.args.field.getName(),
		label   = variables.args.field.getLabel(),
		name    = variables.args.field.getName(),
		options = variables.args.field.getFieldOptions(),
		id      = variables.args.field.getCSSID(),
		class   = variables.args.field.getCSSClass()
	)#
	<!---
		required=field.getIsRequired(),
		value=option.getActualValue(),
	--->
</cfoutput>