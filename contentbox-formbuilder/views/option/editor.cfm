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
				<button class="button" onclick="return to('#event.buildLink(prc.xehFieldEditor)#/fieldID/#prc.option.getField().getFieldID()#/##options')"> <img src="#prc.cbroot#/includes/images/go-back.png" alt="Back"/> Back To #prc.option.getField().getName()#</button>
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
			<cfif prc.option.isLoaded()>Editing #prc.option.getDisplayValue()#<cfelse>Create Option</cfif>
		</div>
		<!--- Body --->
		<div class="body">
			#getPlugin("MessageBox").renderIt()#

			<!--- Vertical Nav --->
			<div class="body_vertical_nav clearfix">
				<!--- User Navigation Bar --->
				<ul class="vertical_nav">
					<li class="active"><a href="##optionDetails"><img src="#prc.cbRoot#/includes/images/settings_black.png" alt="modifiers"/> Option Details</a></li>
				</ul>
				<!--- Tab Content --->
				<div class="main_column">
					<div class="panes_vertical">
						<!--- Option Details --->
						<div>
							#html.startForm(name="optionform",action=prc.xehOptionsave,novalidate="novalidate")#
								#html.startFieldSet(legend="Option Details")#
								#html.hiddenField(name="fieldOptionID",bind=prc.option)#
								#html.hiddenField(name="fieldID",value=prc.option.getField().getFieldID())#

								<!--- Standard Option --->
								#html.textField(name="displayValue",bind=prc.option,label="*Display Value:",required="required",size="50",class="textoption",title="Enter the value you want to display")#
								#html.textField(name="actualValue",bind=prc.option,label="Actual Value:",required="required",size="50",class="textoption",title="Enter the value you want the form to record")#
								#html.checkbox(name="isChecked",bind=prc.option,label="Checked/Selected:",class="checkbox",title="Should this option be selected/checked by default")#

								<div class="actionBar">
									<button class="button" onclick="return to('#event.buildLink(prc.xehFieldEditor)#/fieldID/#prc.option.getField().getFieldID()#/##options')">Cancel</button> or
									<input type="submit" value="Save" class="buttonred">
								</div>
								#html.endFieldSet()#
							#html.endForm()#
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