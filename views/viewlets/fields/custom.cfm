<cfscript>
	function customField(html) {
		var h = arguments.html;

		h = replace(h, "{{name}}",     variables.args.field.getName(), "all");
		h = replace(h, "{{label}}",    variables.args.field.getLabel(), "all");
		h = replace(h, "{{required}}", variables.args.field.getIsRequired(), "all");
		h = replace(h, "{{value}}",    variables.args.field.getDefaultValue(), "all");
		h = replace(h, "{{id}}",       variables.args.field.getCSSID(), "all");
		h = replace(h, "{{class}}",    variables.args.field.getCSSClass(), "all");

		return h;
	}
</cfscript>

<cfoutput>
	#customField(variables.args.field.getCustomTemplate())#
</cfoutput>