<cfscript>
	function customField(html) {
		var h = arguments.html;

		h = replace(h, "{{name}}", field.getName(), "all");
		h = replace(h, "{{label}}", field.getLabel(), "all");
		h = replace(h, "{{required}}", field.getIsRequired(), "all");
		h = replace(h, "{{value}}", field.getDefaultValue(), "all");
		h = replace(h, "{{id}}", field.getCSSID(), "all");
		h = replace(h, "{{class}}", field.getCSSClass(), "all");

		return h;
	}
</cfscript>

<cfoutput>
	#customField(field.getCustomTemplate())#
</cfoutput>