<cfoutput>
<!--- FieldForm --->
#html.startForm(name="fieldsForm",action=prc.xehFieldRemove)#
#html.hiddenField(name="fieldID",value="")#
#html.hiddenField(name="formID",value=prc.form.getFormID())#
<!--- Content Bar --->
<div class="contentBar">
	<!--- Create Form --->
	<div class="buttonBar">
		<!--- typeForm --->
		<label for="typeID" class="inline">Type:</label>
		#html.select(name="typeID",options=prc.types,column="typeID",nameColumn="typeName")#
		<button class="btn btn-danger" onclick="toForm(); return false;" title="Create new field">Create Field</button>
	</div>
	<!--- Filter Bar --->
	<div class="filterBar">
		<div>
			#html.label(field="fieldFilter",content="Quick Filter:",class="inline")#
			#html.textField(name="fieldFilter",size="30",class="textfield")#
		</div>
	</div>
</div>
<!--- fields --->
<table name="fields" id="fields" class="tablesorter table table-striped" width="98%">
	<thead>
		<tr>
			<th>Field Name</th>
			<th>Type</th>
			<th>Order</th>
			<th width="75" class="center {sorter:false}">Actions</th>
		</tr>
	</thead>
	<tbody>
		<cfloop array="#prc.fields#" index="field">
		<tr id="fieldid-#field.getFieldID()#">
			<td><a href="#event.buildLink(prc.xehFieldEditor)#/fieldID/#field.getFieldID()#"
				   title="Edit #field.getName()#">#field.getName()#</a></td>
			<td>#field.getTypeName()#</td>
			<td><div id="fieldid-#field.getFieldID()#_order">#field.getFieldOrder()#</div></td>
			<td class="center">
				<!--- Edit Command --->
				<a href="#event.buildLink(prc.xehFieldEditor)#/fieldID/#field.getFieldID()#"
				   title="Edit #field.getName()#"><i class="icon-edit icon-large"></i></a>
				<!--- Delete Command --->
				<a title="Delete Field" href="javascript:removeField('#field.getFieldID()#')" class="confirmIt" data-title="Delete Field?"><i id="delete_#field.getFieldID()#" class="icon-trash icon-large"></i></a>
			</td>
		</tr>
		</cfloop>
	</tbody>
</table>
#html.endForm()#
</cfoutput>

