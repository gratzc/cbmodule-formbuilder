<cfoutput>
<script type="text/javascript">
	$(document).ready(function() {
		$('##options').tableDnD({
			onDragClass: "selected",
			onDragStart : function(table,row){
				$(row).css("cursor","grab");
				$(row).css("cursor","-moz-grabbing");
				$(row).css("cursor","-webkit-grabbing");
			},
			onDrop: function(table, row){
				$(row).css("cursor","progress");
				var newOptionsOrder  =  $(table).tableDnDSerialize();
				var rows = table.tBodies[0].rows;
				$.post('#event.buildLink(prc.xehOptionOrder)#',{newOptionsOrder:newOptionsOrder},function(){
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
		var rURL = '#event.buildLink(prc.xehFieldOptionEditor)#/fieldID/#prc.field.getFieldID()#';
		return to(rURL);
	}

	function removeOption(optionID){
		$("##optionID").val( optionID );
		$("##fieldOptionForm").submit();
	}
</script>
</cfoutput>