<cfoutput>
	<script type="text/javascript">
		$(document).ready(function() {
			// quick filter
			$("##formsFilter").keyup(function(){
				$.uiTableFilter( $("##forms"), this.value );
			});

			$("##forms").dataTable({
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

		function removeForm(formID){
			$("##formID").val( formID );
			$("##formsForm").submit();
		}
	</script>
</cfoutput>