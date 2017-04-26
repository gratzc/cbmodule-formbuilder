<cfoutput>
	#renderView( "viewlets/assets" )#
	<!--============================Main Column============================-->
	<div class="row">
		<div class="col-md-12">
			<h1 class="h1">
				<i class="fa fa-list"></i> Forms
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-body">
					#getInstance("MessageBox@cbmessagebox").renderit()#

					#html.startForm(name="formsForm",action=prc.xehFormRemove)#
					#html.hiddenField(name="formID",value="")#

					<!--- Filter Bar --->
					<div class="well well-sm">
						<div class="btn-group btn-sm pull-right">
							<button class="btn btn-sm btn-primary" onclick="return to('#event.buildLink(prc.xehFormEditor)#')" title="Create new form">Create Form</button>
						</div>
						
						<div class="form-group form-inline no-margin">
							<input type="text" name="formsFilter" size="30" class="form-control" placeholder="Quick Filter" id="formsFilter">
						</div>
					</div>

					<!--- forms --->
					<table name="forms" id="forms" class="tablesorter table table-striped" width="98%">
						<thead>
							<tr>
								<th>Form</th>
								<th>Slug</th>
								<th>Create Date</th>
								<th width="85">Submissions</th>
								<th width="75" class="center {sorter:false}">Actions</th>
							</tr>
						</thead>
						<tbody>
							<cfloop array="#prc.forms#" index="myForm">
								<tr>
									<td>
										<a href="#event.buildLink(prc.xehFormEditor)#/formID/#myForm.getFormID()#"
										title="Edit #myForm.getName()#">#myForm.getName()#</a>
									</td>
									<td>#myForm.getSlug()#</td>
									<td>#dateFormat(myForm.getCreatedDate(),"short")# #timeFormat(myForm.getCreatedDate(),"short")#</td>
									<td style="text-align: center;">#myForm.getNumberOfSubmissions()# <a href="#event.buildLink(prc.xehSubmissionReport)#/formID/#myForm.getFormID()#"><i class="fa fa-eye"></i></a></td>
									<td class="center">
										<!--- Edit Command --->
										<a href="#event.buildLink(prc.xehFormEditor)#/formID/#myForm.getFormID()#"
										title="Edit #myForm.getName()#"><i class="fa fa-edit"></i></a>
										<!--- Delete Command --->
										<a title="Delete Form" href="javascript:removeForm('#myForm.getFormID()#')" class="confirmIt textRed" data-title="Delete Form?"><i id="delete_#myForm.getFormID()#" class="fa fa-trash"></i></a>
									</td>
								</tr>
							</cfloop>
						</tbody>
					</table>
					#html.endForm()#

				</div>
			</div>
		</div>

		<!--============================ Sidebar ============================-->
		<div class="col-md-3">
			<cfinclude template="../sidebar/actions.cfm" >
			<cfinclude template="../sidebar/help.cfm" >
			<cfinclude template="../sidebar/about.cfm" >
		</div>
	</div>
</cfoutput>