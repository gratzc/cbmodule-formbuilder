<cfoutput>
<script type="text/javascript">
	$(document).ready(function() {
		$("##forms").tablesorter();
		$("##formFilter").keyup(function(){
			$.uiTableFilter( $("##forms"), this.value );
		})
	});
	function removeForm(formID){
		$("##formID").val( formID );
		$("##formsForm").submit();
	}
</script>
</cfoutput>