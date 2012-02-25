<cfoutput>
	#html.label(field=field.getName(),content=field.getLabel())#
	<cfloop array="#field.getFieldOptions()#" index="option" >
	#html.radioButton(
		id=field.getCSSID(),
		name=field.getName(),
		value=option.getActualValue(),
		label=option.getDisplayValue(),
		required=Field.getIsRequired(),
		size=Field.getMaxLength,
		class=Field.getCSSClass()
	)#
	</cfloop>
</cfoutput>