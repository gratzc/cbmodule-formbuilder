<cfoutput>
#renderView( "viewlets/assets" )#
<!--- FieldForm --->
#html.startForm(name="fieldOptionForm",action=prc.xehOptionRemove)#
#html.hiddenField(name="optionID",value="")#
#html.hiddenField(name="fieldID",value=prc.field.getFieldID())#
<!--- Content Bar --->
<div class="contentBar">
	<!--- Create Form --->
	<div class="buttonBar">
		<!--- typeForm --->
		<button class="btn btn-danger" onclick="toForm(); return false;" title="Create new option">Create Option</button>
	</div>
	<!--- Filter Bar --->
	<div class="filterBar">
		<div>
			#html.label(field="optionFilter",content="Quick Filter:",class="inline")#
			#html.textField(name="optionFilter",size="30",class="textfield")#
		</div>
	</div>
</div>
<!--- Usage --->
<div class="alert alert-info">
	<i class="icon-info-sign"></i>
	You can drag and drop the rows to the desired order of display.
</div>
<!--- Options --->
<table name="options" id="options" class="tablesorter table table-striped" width="98%">
	<thead>
		<tr>
			<th>Display Value</th>
			<th>Actual Value</th>
			<th>Order</th>
			<th width="75" class="center {sorter:false}">Actions</th>
		</tr>
	</thead>
	<tbody>
		<cfloop array="#prc.options#" index="option">
		<tr id="optionid-#option.getFieldOptionID()#">
			<td><a href="#event.buildLink(prc.xehFieldOptionEditor)#/optionID/#option.getFieldOptionID()#" title="option #option.getDisplayValue()#">#option.getDisplayValue()#</a></td>
			<td>#option.getActualValue()#</td>
			<td>#option.getOrder()#</td>
			<td class="center">
				<!--- Edit Command --->
				<a href="#event.buildLink(prc.xehFieldOptionEditor)#/optionID/#option.getFieldOptionID()#" title="Edit #option.getDisplayValue()#"><i class="icon-edit icon-large"></i></a>
				<!--- Delete Command --->
				<a title="Delete Option" href="javascript:removeOption('#option.getFieldOptionID()#')" class="confirmIt" data-title="Delete Option?"><i id="delete_#option.getFieldOptionID()#" class="icon-trash icon-large"></i></a>
			</td>
		</tr>
		</cfloop>
	</tbody>
</table>
#html.endForm()#
</cfoutput>

