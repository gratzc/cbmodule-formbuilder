<cfscript>
	function formatHTML(content) {
		arguments.content = replace(arguments.content, "<", "&lt;", "all");
		arguments.content = replace(arguments.content, ">", "&gt;", "all");

		return arguments.content;
	}
</cfscript>

<cfoutput>
	#renderView( "viewlets/assets" )#
	<!--============================Main Column============================-->
	<div class="row">
		<div class="col-md-12">
			<h1 class="h1">
				<i class="fa fa-file-text-o"></i>
				<cfif prc.field.isLoaded()>Editing "#prc.field.getName()#"<cfelse>Create Field</cfif>
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
							<li class="active"><a href="##fieldDetails" data-toggle="tab"><i class="fa fa-reorder"></i> Field Details</a></li>

							<cfif prc.field.isLoaded() and prc.showOptions>
								<li><a href="##fieldOptions" data-toggle="tab"><i class="fa fa-th-large"></i> Field Options</a></li>
							</cfif>
						</ul>

						<div class="tab-content">
							<!--- Form Details --->
							<div class="tab-pane active" id="fieldDetails">
								#html.startForm(name="fieldform",action=prc.xehFieldsave,novalidate="novalidate")#
									#html.startFieldset(legend="Field Details")#
										#html.hiddenField(name="fieldID",bind=prc.field)#
										#html.hiddenField(name="formID",value=prc.field.getForm().getFormID())#
										#html.hiddenField(name="typeID",bind=prc.field)#

										<!--- Standard Field --->
										<div class="form-group">
											#html.textField(name="name",bind=prc.field,label="*Name:",required="required",class="form-control",title="The name of this field")#
										</div>

										<div class="form-group">
											#html.textField(name="label",bind=prc.field,label="Label:",required="required",class="form-control",title="The label for this field, if left blank it will default to the same as the name")#
										</div>

										<div class="form-group">
											#html.checkbox(name="isRequired",bind=prc.field,label="Is Required:",class="checkbox",title="Should I require this field")#
										</div>

										<cfif !prc.showOptions>
											<div class="form-group">
												#html.textField(name="defaultValue",bind=prc.field,label="Default Value:",class="form-control",title="Default Value for this field")#
											</div>

										</cfif>
										<div class="form-group">
											#html.textField(name="maxLength",bind=prc.field,label="Max Length:",class="form-control",title="Max Length of data allowed in this field")#
										</div>

										<div class="form-group">
											#html.textField(name="helpText",bind=prc.field,label="Help Text:",class="form-control",title="Please enter some help text that will help your users know what you want in this field")#
										</div>

										<div class="form-group">
											#html.textField(name="cssID",bind=prc.field,label="CSS ID:",class="form-control",title="The CSS ID for this field, used to style the form, if you don't know what this is kindly leave it blank")#
										</div>

										<div class="form-group">
											#html.textField(name="cssClass",bind=prc.field,label="CSS Class:",class="form-control",title="The CSS Class(s) for this field, used to style the form, if you don't know what this is kindly leave it blank")#
										</div>

										<div class="form-group"<cfif prc.field.getTypeID() neq 7> style="display: none"</cfif>>
											#html.textArea(name="customTemplate",value=formatHTML(prc.field.getCustomTemplate()),label="Custom Template:",class="form-control",title="The custom HTML for this field.",rows=10)#
										</div>

										<div class="form-actions">
											<button class="btn" onclick="return to('#event.buildLink(prc.xehFormEditor)#/formID/#prc.field.getForm().getFormID()#')">Cancel</button>
											<input type="submit" value="Save" class="btn btn-danger">
										</div>
									#html.endFieldSet()#
								#html.endForm()#
							</div>

							<!--- Options --->
							<cfif prc.field.isLoaded() and prc.showOptions>
								<div class="tab-pane" id="fieldOptions">
									#html.startFieldset(legend="Field Options")#
									#prc.fieldOptionsViewlet#
									#html.endFieldSet()#
								</div>
							</cfif>
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