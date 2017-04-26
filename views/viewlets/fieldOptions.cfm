<cfoutput>
	#renderView( "viewlets/assets" )#
	<!--- FieldForm --->
	#html.startForm(name="fieldOptionForm",action=prc.xehOptionRemove)#
		#html.hiddenField(name="optionID",value="")#
		#html.hiddenField(name="fieldID",value=prc.field.getFieldID())#

		<!--- Filter Bar --->
		<div class="well well-sm">
			<div class="btn-group btn-sm pull-right">
				<button class="btn btn-sm btn-primary" onclick="toForm(); return false;" title="Create new option">Create Option</button>
			</div>
			
			<div class="form-group form-inline no-margin">
				<input type="text" name="optionsFilter" size="30" class="form-control" placeholder="Quick Filter" id="optionsFilter">
			</div>
		</div>

		<!--- Usage --->
		<div class="alert alert-info">
			<i class="fa fa-info-sign"></i>
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
						<td><div id="optionid-#option.getFieldOptionID()#_order">#option.getOrder()#</div></td>
						<td class="center">
							<!--- Edit Command --->
							<a href="#event.buildLink(prc.xehFieldOptionEditor)#/optionID/#option.getFieldOptionID()#" title="Edit #option.getDisplayValue()#"><i class="fa fa-edit"></i></a>
							<!--- Delete Command --->
							<a title="Delete Option" href="javascript:removeOption('#option.getFieldOptionID()#')" class="confirmIt" data-title="Delete Option?"><i id="delete_#option.getFieldOptionID()#" class="fa fa-trash"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	#html.endForm()#
</cfoutput>

