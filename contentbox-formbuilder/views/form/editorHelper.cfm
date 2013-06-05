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
	});
</script>
</cfoutput>