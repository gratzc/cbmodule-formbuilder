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
			<img src="#prc.cbroot#/includes/images/forms_icon.png" alt="sofa" width="30" height="30" />
			<cfif prc.form.isLoaded()>Editing #prc.form.getName()#<cfelse>Create Form</cfif>
		</div>
		<!--- Body --->
		<div class="body">
			#getPlugin("MessageBox").renderIt()#

			<!--- Vertical Nav --->
			<div class="body_vertical_nav clearfix">
				<!--- User Navigation Bar --->
				<ul class="vertical_nav">
					<li class="active"><a href="##formDetails"><img src="#prc.cbRoot#/includes/images/settings_black.png" alt="modifiers"/> Form Details</a></li>
					<cfif prc.form.isLoaded()>
					<li><a href="##fields"><img src="#prc.cbRoot#/includes/images/active_sub_menu_bg.gif" alt="modifiers"/> Form Fields</a></li>
					</cfif>
				</ul>
				<!--- Tab Content --->
				<div class="main_column">
					<div class="panes_vertical">
						<!--- Form Details --->
						<div>
							<!--- FormForm --->
							#html.startForm(name="formForm",action=prc.xehFormsave,novalidate="novalidate")#
								#html.startFieldset(legend="Form Details")#
								#html.hiddenField(name="formID",bind=prc.form)#
								#html.hiddenField(name="sluggerURL",value=event.buildLink(prc.xehSlugify))#
								<!--- Fields --->
								#html.textField(name="name",bind=prc.form,label="*Name:",required="required",size="50",class="textfield",title="A friendly name for your form")#
								#html.textField(name="slug",bind=prc.form,label="*Slug:",required="required",size="50",class="textfield",title="A slug to identify the form")#
								#html.textarea(label="Directions:",name="directions",bind=prc.form,rows="10",title="Type some directions for the form")#
								#html.textarea(label="*Submit Message:",name="submitMessage",bind=prc.form,rows="10",required="required",title="The message I should display after the form is submitted")#
								#html.textField(name="emailTo",bind=prc.form,label="Email To:",size="50",class="textfield",title="A comma seperated list of email address I should send the form respones to, leave blank for none")#
								#html.textField(name="cssID",bind=prc.form,label="CSS ID:",size="50",class="textfield",title="The CSS ID for this form, used to style the form, if you don't know what this is kindly leave it blank")#
								#html.textField(name="cssClass",bind=prc.form,label="CSS Class:",size="50",class="textfield",title="The CSS Class(s) for this form, used to style the form, if you don't know what this is kindly leave it blank")#
								<div class="actionBar">
									<button class="button" onclick="return to('#event.buildLink(prc.xehForms)#')">Cancel</button> or
									<input type="submit" value="Save" class="buttonred">
								</div>
								#html.endFieldSet()#
							#html.endForm()#
						</div>

						<!--- My Entries --->
						<div>
						#html.startFieldset(legend="Form Fields")#
							#prc.fieldsViewlet#
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