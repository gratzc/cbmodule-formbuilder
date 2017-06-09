<cfscript>
	function customField(html) {
		var h = arguments.html;

		h = replace(h, "{{name}}", field.getName());
		h = replace(h, "{{label}}", field.getLabel());
		h = replace(h, "{{required}}", field.getIsRequired());
		h = replace(h, "{{value}}", field.getDefaultValue());
		h = replace(h, "{{id}}", field.getCSSID());
		h = replace(h, "{{class}}", field.getCSSClass());

		return h;
	}
</cfscript>

<cfoutput>
	#customField(field.getCustomTemplate())#
</cfoutput>