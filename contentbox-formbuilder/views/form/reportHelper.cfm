<cfoutput>
<script type="text/javascript">
$(document).ready(function() {
	$("##submissions").tablesorter();
	$("##formSubmissionFilter").keyup(function(){
		$.uiTableFilter( $("##submissions"), this.value );
	})
});
function removeSubmission(submissionID){
	$("##formSubmissionID").val( submissionID );
	$("##formSubmissions").submit();
}
</script>
</cfoutput>