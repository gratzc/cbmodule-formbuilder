<cfoutput>
	#renderView( "viewlets/assets" )#
	<!--============================Main Column============================-->
	<div class="row">
		<div class="col-md-12">
			<h1 class="h1">
				<i class="fa fa-file-text-o"></i>
				<cfif prc.form.isLoaded()>Editing "#prc.form.getName()#"<cfelse>Create Form</cfif>
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-body">
					#getInstance("MessageBox@cbmessagebox").renderit()#

					<div class="tabbable tabs-left">
						<ul class="nav nav-tabs">
							<li class="active"><a href="##formDetails" data-toggle="tab"><i class="fa fa-list"></i> Form Details</a></li>
							<cfif prc.form.isLoaded()>
								<li><a href="##formFields" data-toggle="tab"><i class="fa fa-list"></i> Form Fields</a></li>
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
										<div class="form-group">
											#html.textField(name="name",bind=prc.form,label="*Name:",required="required",class="form-control",title="A friendly name for your form")#
										</div>

										<div class="form-group">
											#html.textField(name="slug",bind=prc.form,label="*Slug:",required="required",class="form-control",title="A slug to identify the form.  Must be unique.")#
										</div>

										<div class="form-group">
											#html.textarea(label="Directions:",name="directions",bind=prc.form,rows="10",class="form-control",title="Type some directions for the form")#
										</div>

										<div class="form-group">
											#html.textarea(label="*Submit Message:",name="submitMessage",bind=prc.form,rows="10",class="form-control",required="required",title="The message I should display after the form is submitted")#
										</div>

										<div class="form-group">
											#html.textField(name="emailTo",bind=prc.form,label="Email To:",class="form-control",title="A comma seperated list of email address I should send the form responses to, leave blank for none")#
										</div>

										<div class="form-group">
											#html.textField(name="cssID",bind=prc.form,label="CSS ID:",class="form-control",title="The CSS ID for this form, used to style the form, if you don't know what this is kindly leave it blank")#
										</div>

										<div class="form-group">
											#html.textField(name="cssClass",bind=prc.form,label="CSS Class:",class="form-control",title="The CSS Class(s) for this form, used to style the form, if you don't know what this is kindly leave it blank")#
										</div>

										#html.checkbox(name="useCAPTCHA",bind=prc.form,label="Use CAPTCHA:",class="form-control",title="We highly suggest you leave this ON!!!")#
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
		<div class="col-md-3">
			<cfinclude template="../sidebar/actions.cfm" >
			<cfinclude template="../sidebar/help.cfm" >
			<cfinclude template="../sidebar/about.cfm" >
		</div>
	</div>
</cfoutput>