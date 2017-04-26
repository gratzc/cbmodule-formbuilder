<cfoutput>
<script type="text/javascript">
	$(document).ready(function() {
		// quick filter
		$("##fieldsFilter").keyup(function(){
			$.uiTableFilter( $("##fields"), this.value );
		});

		$("##fields").dataTable({
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

		// quick filter
		$("##optionsFilter").keyup(function(){
			$.uiTableFilter( $("##options"), this.value );
		});

		$("##options").dataTable({
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

		// pointers
		$formForm 	= $("##formForm");
		$formUsername = $formForm.find("##username");
	});
</script>
</cfoutput>