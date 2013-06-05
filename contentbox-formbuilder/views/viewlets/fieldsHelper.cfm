<cfoutput>
<script type="text/javascript">
	$(document).ready(function() {
		$('##fields').tableDnD({
			onDragClass: "selected",
			onDragStart : function(table,row){
				$(row).css("cursor","grab");
				$(row).css("cursor","-moz-grabbing");
				$(row).css("cursor","-webkit-grabbing");
			},
			onDrop: function(table, row){
				$(row).css("cursor","progress");
				var newFieldsOrder  =  $(table).tableDnDSerialize();
				var rows = table.tBodies[0].rows;
				$.post('#event.buildLink(prc.xehFieldOrder)#',{newFieldsOrder:newFieldsOrder},function(){
					for (var i = 0; i < rows.length; i++) {
						var oID = '##' + rows[i].id + '_order';
						$(oID).html(i+1);
					}
					$(row).css("cursor","move");
				});
			}
		});
	});

	function toForm(){
		var typeID = $("##typeID").val();
		var rURL = '#event.buildLink(prc.xehFieldEditor)#/formID/#prc.form.getFormID()#/typeID/' + typeID;
		return to(rURL);
	}

	function removeField(fieldID){
		$("##fieldID").val( fieldID );
		$("##fieldsForm").submit();
	}
</script>
</cfoutput>