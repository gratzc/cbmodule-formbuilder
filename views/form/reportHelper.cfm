<script type="text/javascript">
	$(document).ready(function() {
		// quick filter
		$("#submissionsFilter").keyup(function(){
			$.uiTableFilter( $("#submissions"), this.value );
		});

		$("#submissions").dataTable({
			"paging": false,
			"info": false,
			"searching": false,
			"columnDefs": [
			{ 
				"orderable": false, 
				"targets": '{sorter:false}' 
			}
			],
			"order": []
		});
	});

	function removeSubmission(submissionID){
		$("#formSubmissionID").val( submissionID );
		$("#formSubmissions").submit();
	}
</script>
