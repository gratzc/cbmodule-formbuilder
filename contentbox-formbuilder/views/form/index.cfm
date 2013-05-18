<cfoutput>
#renderView( "viewlets/assets" )#
<!--============================Main Column============================-->
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="box">
			<!--- Body Header --->
			<div class="header">
				<i class="icon-list-alt icon-large"></i>
				Forms
			</div>
			<!--- Body --->
			<div class="body">

				<!--- MessageBox --->
				#getPlugin("MessageBox").renderit()#

				<!--- Forms Form --->
				#html.startForm(name="formsForm",action=prc.xehFormRemove)#
				#html.hiddenField(name="formID",value="")#

				<!--- Filter Bar --->
				<div class="well well-small">
					<div class="buttonBar">
						<button class="btn btn-danger" onclick="return to('#event.buildLink(prc.xehFormEditor)#')" title="Create new form">Create Form</button>
					</div>
					<div class="filterBar">
						<div>
							#html.label(field="formFilter",content="Quick Filter:",class="inline")#
							#html.textField(name="formFilter",size="30",class="textfield")#
						</div>
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
							<td><a href="#event.buildLink(prc.xehFormEditor)#/formID/#myForm.getFormID()#"
								   title="Edit #myForm.getName()#">#myForm.getName()#</a></td>
							<td>#myForm.getSlug()#</td>
							<td>#dateFormat(myForm.getCreatedDate(),"short")# #timeFormat(myForm.getCreatedDate(),"short")#</td>
							<td style="text-align: center;">#myForm.getNumberOfSubmissions()# <a href="#event.buildLink(prc.xehSubmissionReport)#/formID/#myForm.getFormID()#"><i class="icon-eye-open icon-large"></i></a></td>
							<td class="center">
								<!--- Edit Command --->
								<a href="#event.buildLink(prc.xehFormEditor)#/formID/#myForm.getFormID()#"
								   title="Edit #myForm.getName()#"><i class="icon-edit icon-large"></i></a>
								<!--- Delete Command --->
								<a title="Delete Form" href="javascript:removeForm('#myForm.getFormID()#')" class="confirmIt textRed" data-title="Delete Form?"><i id="delete_#myForm.getFormID()#" class="icon-trash icon-large"></i></a>
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