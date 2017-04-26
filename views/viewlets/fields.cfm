<cfoutput>
	<!--- FieldForm --->
	#html.startForm(name="fieldsForm",action=prc.xehFieldRemove)#
	#html.hiddenField(name="fieldID",value="")#
	#html.hiddenField(name="formID",value=prc.form.getFormID())#
	<!--- Content Bar --->
	<div class="contentBar">
		<!--- Filter Bar --->
		<div class="well well-sm">
			<div class="pull-right" style="margin-top: 5px">
				<!--- typeForm --->
				<label for="typeID" class="inline">Type:</label>
				<select id="typeID">
					<cfloop array="#prc.Types#" index="type">
						<option value="#type.typeID#">#type.typeName#</option>
					</cfloop>
				</select>
				<button class="btn btn-sm btn-primary" onclick="toForm(); return false;" title="Create new field">Create Field</button>
			</div>

			<div class="form-group form-inline no-margin">
				<input type="text" name="formFilter" size="30" class="form-control" placeholder="Quick Filter" id="formFilter">
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
							title="Edit #field.getName()#"><i class="fa fa-edit"></i></a>
							<!--- Delete Command --->
							<a title="Delete Field" href="javascript:removeField('#field.getFieldID()#')" class="confirmIt" data-title="Delete Field?"><i id="delete_#field.getFieldID()#" class="fa fa-trash"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
		#html.endForm()#
	</cfoutput>

