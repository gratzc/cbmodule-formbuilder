<cfoutput>
<!--- Custom JS --->
<script type="text/javascript">
	$(document).ready(function() {
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
	});

	function toFieldForm(){
		var typeID = $("##typeID").val();
		var rURL = '#event.buildLink(prc.xehFieldEditor)#/formID/#prc.field.getForm().getFormID()#/typeID/' + typeID;
		return to(rURL);
	}
</script>
</cfoutput>