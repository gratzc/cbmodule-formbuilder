<cfoutput>
<!--============================ Sidebar ============================-->
<div class="sidebar">
	<cfinclude template="../sidebar/actions.cfm" >
	<cfinclude template="../sidebar/help.cfm" >
	<cfinclude template="../sidebar/about.cfm" >
</div>

<!--============================Main Column============================-->
<div class="main_column">
	<div class="box">
		<!--- Body Header --->
		<div class="header">
			<img src="#prc.cbroot#/includes/images/forms_icon.png" alt="forms" width="30" height="30" />
			Forms
		</div>
		<!--- Body --->
		<div class="body">

			<!--- MessageBox --->
			#getPlugin("MessageBox").renderit()#

			<!--- FormsForm --->
			#html.startForm(name="formsForm",action=prc.xehFormRemove)#
			#html.hiddenField(name="formID",value="")#

			<!--- Content Bar --->
			<div class="contentBar">
				<!--- Create Form --->
				<div class="buttonBar">
					<button class="button2" onclick="return to('#event.buildLink(prc.xehFormEditor)#')" title="Create new form">Create Form</button>
				</div>
				<!--- Filter Bar --->
				<div class="filterBar">
					<div>
						#html.label(field="formFilter",content="Quick Filter:",class="inline")#
						#html.textField(name="formFilter",size="30",class="textfield")#
					</div>
				</div>
			</div>

			<!--- forms --->
			<table name="forms" id="forms" class="tablesorter" width="98%">
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
						<td><a href="#event.buildLink(prc.xehFormEditor)#/formID/#myForm.getFormID()#"
							   title="Edit #myForm.getName()#">#myForm.getName()#</a></td>
						<td>#myForm.getSlug()#</td>
						<td>#dateFormat(myForm.getCreatedDate(),"short")# #timeFormat(myForm.getCreatedDate(),"short")#</td>
						<td><a href="#event.buildLink(prc.xehSubmissionReport)#/formID/#myForm.getFormID()#">#myForm.getNumberOfSubmissions()#</a></td>
						<td class="center">
							<!--- Edit Command --->
							<a href="#event.buildLink(prc.xehFormEditor)#/formID/#myForm.getFormID()#"
							   title="Edit #myForm.getName()#"><img src="#prc.cbroot#/includes/images/edit.png" alt="edit" border="0" /></a>
							<!--- Delete Command --->
							<a title="Delete Form" href="javascript:removeForm('#myForm.getFormID()#')" class="confirmIt" data-title="Delete Form?"><img id="delete_#myForm.getFormID()#" src="#prc.cbroot#/includes/images/delete.png" border="0" alt="delete"/></a>
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