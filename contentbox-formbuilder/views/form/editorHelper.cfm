<cfoutput>
<!--- Custom JS --->
<script type="text/javascript">
$(document).ready(function() {
	// pointers
	$formForm 	= $("##formForm");
	$formUsername = $formForm.find("##username");

	// initialize validator and add a custom form submission logic
	$formForm.validator({grouped:true});

});
</script>
</cfoutput>