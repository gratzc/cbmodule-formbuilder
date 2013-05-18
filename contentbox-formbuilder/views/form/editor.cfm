<cfoutput>
#renderView( "viewlets/assets" )#
<!--============================Main Column============================-->
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="box">
			<!--- Body Header --->
			<div class="header">
				<i class="icon-file-alt"></i>
				<cfif prc.form.isLoaded()>Editing "#prc.form.getName()#"<cfelse>Create Form</cfif>
			</div>
			<!--- Body --->
			<div class="body">
				#getPlugin("MessageBox").renderIt()#

				<div class="tabbable tabs-left">
					<!--- User Navigation Bar --->
					<ul class="nav nav-tabs">
						<li class="active"><a href="##formDetails" data-toggle="tab"><i class="icon-list-alt"></i> Form Details</a></li>
						<cfif prc.form.isLoaded()>
						<li><a href="##formFields" data-toggle="tab"><i class="icon-list-ul"></i> Form Fields</a></li>
						</cfif>
					</ul>

					<div class="tab-content">
						<div class="tab-pane active" id="formDetails">
							<!--- Form Details --->
							#html.startForm(name="formForm",action=prc.xehFormsave,novalidate="novalidate")#
								#html.startFieldset(legend="Form Details")#
								#html.hiddenField(name="formID",bind=prc.form)#
								#html.hiddenField(name="sluggerURL",value=event.buildLink(prc.xehSlugify))#
								<!--- Fields --->
								#html.textField(name="name",bind=prc.form,label="*Name:",required="required",size="50",class="textfield",title="A friendly name for your form")#
								#html.textField(name="slug",bind=prc.form,label="*Slug:",required="required",size="50",class="textfield",title="A slug to identify the form.  Must be unique.")#
								#html.textarea(label="Directions:",name="directions",bind=prc.form,rows="10",title="Type some directions for the form")#
								#html.textarea(label="*Submit Message:",name="submitMessage",bind=prc.form,rows="10",required="required",title="The message I should display after the form is submitted")#
								#html.textField(name="emailTo",bind=prc.form,label="Email To:",size="50",class="textfield",title="A comma seperated list of email address I should send the form responses to, leave blank for none")#
								#html.textField(name="cssID",bind=prc.form,label="CSS ID:",size="50",class="textfield",title="The CSS ID for this form, used to style the form, if you don't know what this is kindly leave it blank")#
								#html.textField(name="cssClass",bind=prc.form,label="CSS Class:",size="50",class="textfield",title="The CSS Class(s) for this form, used to style the form, if you don't know what this is kindly leave it blank")#
								#html.checkbox(name="useCAPTCHA",bind=prc.form,label="Use CAPTCHA:",size="50",class="textfield",title="We highly suggest you leave this ON!!!")#
								<div class="form-actions">
									<button class="btn" onclick="return to('#event.buildLink(prc.xehForms)#')">Cancel</button>
									<input type="submit" value="Save" class="btn btn-danger">
								</div>
								#html.endFieldSet()#
							#html.endForm()#
						</div>

						<!--- Form Fields --->
						<div class="tab-pane" id="formFields">
							#html.startFieldset(legend="Form Fields")#
								#prc.fieldsViewlet#
							#html.endFieldSet()#
						</div>
					</div>
				</div>
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