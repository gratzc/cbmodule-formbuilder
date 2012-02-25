<cfoutput>
<!--============================ Sidebar ============================-->
<div class="sidebar">
	<!--- Info Box --->
	<div class="small_box">
		<div class="header">
			<img src="#prc.cbroot#/includes/images/settings.png" alt="info" width="24" height="24" />Form Actions
		</div>
		<div class="body">
			<!--- Back button --->
			<p class="center">
				<button class="button" onclick="return to('#event.buildLink(prc.xehFormEditor)#/formID/#prc.field.getForm().getFormID()#/##fields')"> <img src="#prc.cbroot#/includes/images/go-back.png" alt="Back"/> Back To #prc.field.getForm().getName()#</button>
			</p>
			<cfif prc.field.isLoaded()>
			<!--- Create Form --->
			<p class="center">
				<!--- typeForm --->
				#html.select(label="Type:",name="typeID",options=prc.types,column="typeID",nameColumn="typeName",class="inline")#
				<button class="button2" onclick="toFieldForm(); return false;" title="Create new field">Create Field</button>
			</p>
			</cfif>
		</div>
	</div>
</div>
<!--End sidebar-->
<!--============================Main Column============================-->
<div class="main_column">
	<div class="box">
		<!--- Body Header --->
		<div class="header">
			<img src="#prc.cbroot#/includes/images/forms_icon.png" alt="sofa" width="30" height="30" />
			<cfif prc.field.isLoaded()>Editing #prc.field.getName()#<cfelse>Create Field</cfif>
		</div>
		<!--- Body --->
		<div class="body">
			#getPlugin("MessageBox").renderIt()#

			<!--- Vertical Nav --->
			<div class="body_vertical_nav clearfix">
				<!--- User Navigation Bar --->
				<ul class="vertical_nav">
					<li class="active"><a href="##fieldDetails"><img src="#prc.cbRoot#/includes/images/settings_black.png" alt="modifiers"/> Field Details</a></li>
					<cfif prc.field.isLoaded() and prc.showOptions>
					<li><a href="##options"><img src="#prc.cbRoot#/includes/images/active_sub_menu_bg.gif" alt="modifiers"/> Field Options</a></li>
					</cfif>
				</ul>
				<!--- Tab Content --->
				<div class="main_column">
					<div class="panes_vertical">
						<!--- Form Details --->
						<div>
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

								<div class="actionBar">
									<button class="button" onclick="return to('#event.buildLink(prc.xehFormEditor)#/formID/#prc.field.getForm().getFormID()#')">Cancel</button> or
									<input type="submit" value="Save" class="buttonred">
								</div>
								#html.endFieldSet()#
							#html.endForm()#
						</div>

						<!--- Options --->
						<div>
						#html.startFieldset(legend="Field Options")#
							#prc.fieldOptionsViewlet#
						#html.endFieldSet()#
						</div>

					</div>
					<!--- end panes_vertical --->
				</div>
				<!--- end panes content --->
			</div>
			<!--- end vertical nav --->

		</div>	<!--- body --->
	</div> <!--- main box --->
</div> <!--- main column --->
</cfoutput>