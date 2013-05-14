<cfoutput>
<script type="text/javascript">
	$(document).ready(function() {
		// quick filter
		$("##fields").tablesorter();
		$("##fieldFilter").keyup(function(){
			$.uiTableFilter( $("##fields"), this.value );
		})

		// pointers
		$formForm 	= $("##formForm");
		$formUsername = $formForm.find("##username");

		// initialize validator and add a custom form submission logic
		$formForm.validator({grouped:true});

	});
</script>
</cfoutput>