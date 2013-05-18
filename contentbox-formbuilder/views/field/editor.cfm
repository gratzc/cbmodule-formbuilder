<cfoutput>
#renderView( "viewlets/assets" )#
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="box">
			<!--- Body Header --->
			<div class="header">
				<i class="icon-file-alt"></i>
				<cfif prc.field.isLoaded()>Editing "#prc.field.getName()#"<cfelse>Create Field</cfif>
			</div>
			<!--- Body --->
			<div class="body">
				#getPlugin("MessageBox").renderIt()#
				<div class="tabbable tabs-left">
					<ul class="nav nav-tabs">
						<li class="active"><a href="##fieldDetails" data-toggle="tab"><i class="icon-reorder"></i> Field Details</a></li>

						<cfif prc.field.isLoaded() and prc.showOptions>
						<li><a href="##fieldOptions" data-toggle="tab"><i class="icon-th-large"></i> Field Options</a></li>
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
								#html.textField(name="name",bind=prc.field,label="*Name:",required="required",size="50",class="textfield",title="The name of this field")#
								#html.textField(name="label",bind=prc.field,label="Label:",required="required",size="50",class="textfield",title="The label for this field, if left blank it will default to the same as the name")#
								#html.checkbox(name="isRequired",bind=prc.field,label="Is Required:",class="checkbox",title="Should I require this field")#
								<cfif !prc.showOptions>
									#html.textField(name="defaultValue",bind=prc.field,label="Default Value:",size="50",class="textfield",title="Default Value for this field")#
								</cfif>
								#html.textField(name="maxLength",bind=prc.field,label="Max Length:",size="50",class="textfield",title="Max Length of data allowed in this field")#
								#html.textField(name="helpText",bind=prc.field,label="Help Text:",size="50",class="textfield",title="Please enter some help text that will help your users know what you want in this field")#
								#html.textField(name="cssID",bind=prc.field,label="CSS ID:",size="50",class="textfield",title="The CSS ID for this field, used to style the form, if you don't know what this is kindly leave it blank")#
								#html.textField(name="cssClass",bind=prc.field,label="CSS Class:",size="50",class="textfield",title="The CSS Class(s) for this field, used to style the form, if you don't know what this is kindly leave it blank")#

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
	<div class="span3" id="main-sidebar">
		<cfinclude template="../sidebar/actions.cfm" >
		<cfinclude template="../sidebar/help.cfm" >
		<cfinclude template="../sidebar/about.cfm" >
	</div>
</div>
</cfoutput>