<cfoutput>
#renderView( "viewlets/assets" )#
<!--============================Main Column============================-->
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="box">
			<!--- Body Header --->
			<div class="header">
				<i class="icon-share"></i>
				Form Submissions
			</div>
			<!--- Body --->
			<div class="body">

				<!--- MessageBox --->
				#getPlugin("MessageBox").renderit()#

				<!--- FormsForm --->
				#html.startForm(name="formSubmissions",action=prc.xehFormSubmissionRemove)#
				#html.hiddenField(name="formSubmissionID",value="")#
				#html.hiddenField(name="formID",value="#rc.formID#")#

				<!--- Content Bar --->
				<div class="well well-small">
					<!--- Create Form --->
					<div class="buttonBar">
						<button class="btn btn-danger" onclick="return to('#event.buildLink(prc.xehFormEditor)#')" title="Create new form">Create Form</button>
					</div>
					<!--- Filter Bar --->
					<div class="filterBar">
						<div>
							#html.label(field="formSubmissionFilter",content="Quick Filter:",class="inline")#
							#html.textField(name="formSubmissionFilter",size="30",class="textfield")#
						</div>
					</div>
				</div>

				<div class="alert alert-info">
					<i class="icon-info-sign"></i>
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
								<a title="Delete Submission" href="javascript:removeSubmission('#submission.getFormSubmissionID()#')" class="confirmIt textRed" data-title="Delete Submission?"><i id="delete_#submission.getFormSubmissionID()#" class="icon-trash icon-large" /></i></a>
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
	<div class="span3" id="main-sidebar">
		<cfinclude template="../sidebar/actions.cfm" >
		<cfinclude template="../sidebar/help.cfm" >
		<cfinclude template="../sidebar/about.cfm" >
	</div>
</div>
</cfoutput>