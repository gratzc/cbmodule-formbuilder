<cfoutput>
<!--- Custom JS --->
<script type="text/javascript">
function toFieldForm(){
	var typeID = $("##typeID").val();
	var rURL = '#event.buildLink(prc.xehFieldEditor)#/formID/#prc.field.getForm().getFormID()#/typeID/' + typeID;
	return to(rURL);
}
</script>
</cfoutput>