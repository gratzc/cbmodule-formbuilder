<cfoutput>
	#renderView( "viewlets/assets" )#
	<!--============================Main Column============================-->
	<div class="row">
		<div class="col-md-12">
			<h1 class="h1">
				<i class="fa fa-share"></i> Form Submissions
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-body">
					#getInstance("MessageBox@cbmessagebox").renderit()#

					<!--- FormsForm --->
					#html.startForm(name="formSubmissions",action=prc.xehFormSubmissionRemove)#
						#html.hiddenField(name="formSubmissionID",value="")#
						#html.hiddenField(name="formID",value="#rc.formID#")#

						<!--- Filter Bar --->
						<div class="well well-sm">
							<div class="btn-group btn-sm pull-right">
								<button class="btn btn-sm btn-primary" onclick="return to('#event.buildLink(prc.xehFormEditor)#')" title="Create new form">Create Form</button>
							</div>
							
							<div class="form-group form-inline no-margin">
								<input type="text" name="submissionsFilter" size="30" class="form-control" placeholder="Quick Filter" id="submissionsFilter">
							</div>
						</div>

						<div class="alert alert-info">
							<i class="fa fa-info-sign"></i>
							Form mailings will use your ContentBox mail settings.
						</div>

						<!--- submissions --->
						<table name="submissions" id="submissions" class="tablesorter table table-striped" width="98%">
							<thead>
								<tr>
									<th>Date</th>
									<th>IP Address</th>
									<th>Data</th>
									<th width="75" class="center {sorter:false}">Actions</th>
								</tr>
							</thead>
							<tbody>
								<cfloop array="#prc.submissions#" index="submission">
									<tr>
										<td>#dateFormat(submission.getSubmissionDate(),"short")# #timeFormat(submission.getSubmissionDate(),"short")#</td>
										<td>#submission.getSubmissionIP()#</td>
										<cfset prc.formData = deserializeJSON(submission.getFormData())>
										<td>#renderView(view="viewlets/renderSubmission",module="contentbox-formbuilder")#</td>
										<td class="center">
											<!--- Delete Command --->
											<a title="Delete Submission" href="javascript:removeSubmission('#submission.getFormSubmissionID()#')" class="confirmIt textRed" data-title="Delete Submission?"><i id="delete_#submission.getFormSubmissionID()#" class="fa fa-trash" /></i></a>
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