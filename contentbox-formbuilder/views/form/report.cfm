<cfoutput>
<!--============================Sidebar============================-->
<div class="sidebar">
	<!--- Saerch Box --->
	<div class="small_box">
		<div class="header">
			<img src="#prc.cbroot#/includes/images/help.png" alt="info" width="24" height="24" />Actions
		</div>
		<div class="body">
			<!--- Back button --->
			<p class="center">
				<button class="button" onclick="return to('#event.buildLink(prc.xehFormEditor)#/formID/#rc.formID#')"> <img src="#prc.cbroot#/includes/images/go-back.png" alt="Back"/> Back To #rc.Form.getName()#</button>
			</p>
			<!--- Back button --->
			<p class="center">
				<button class="button" onclick="return to('#event.buildLink(prc.xehForms)#')"> <img src="#prc.cbroot#/includes/images/go-back.png" alt="help"/> Back To Forms</button>
			</p>
		</div>
	</div>
</div>
<!--End sidebar-->
<!--============================Main Column============================-->
<div class="main_column">
	<div class="box">
		<!--- Body Header --->
		<div class="header">
			<img src="#prc.cbroot#/includes/images/forms_icon.png" alt="forms" width="30" height="30" />
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
			<div class="contentBar">
				<!--- Create Form --->
				<div class="buttonBar">
					<button class="button2" onclick="return to('#event.buildLink(prc.xehFormEditor)#')" title="Create new form">Create Form</button>
				</div>
				<!--- Filter Bar --->
				<div class="filterBar">
					<div>
						#html.label(field="formSubmissionFilter",content="Quick Filter:",class="inline")#
						#html.textField(name="formSubmissionFilter",size="30",class="textfield")#
					</div>
				</div>
			</div>

			<!--- submissions --->
			<table name="submissions" id="submissions" class="tablesorter" width="98%">
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
							<a title="Delete Form" href="javascript:removeSubmission('#submission.getFormSubmissionID()#')" class="confirmIt" data-title="Delete Form?"><img id="delete_#submission.getFormSubmissionID()#" src="#prc.cbroot#/includes/images/delete.png" border="0" alt="delete"/></a>
						</td>
					</tr>
					</cfloop>
				</tbody>
			</table>
			#html.endForm()#

		</div>
	</div>
</div>
</cfoutput>