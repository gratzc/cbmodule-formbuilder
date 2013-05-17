<cfoutput>
<!--============================Main Column============================-->
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="box">
			<!--- Body Header --->
			<div class="header">
				<img src="#prc.cbroot#/includes/images/forms_icon.png" alt="sofa" width="30" height="30" />
				<cfif prc.option.isLoaded()>Editing "#prc.option.getDisplayValue()#"<cfelse>Create Option</cfif>
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
								#html.startForm(name="optionform",action=prc.xehOptionSave,novalidate="novalidate")#
									#html.startFieldSet(legend="Option Details")#
									#html.hiddenField(name="fieldOptionID",bind=prc.option)#
									#html.hiddenField(name="fieldID",value=prc.option.getField().getFieldID())#

									<!--- Standard Option --->
									#html.textField(name="displayValue",bind=prc.option,label="*Display Value:",required="required",size="50",class="textoption",title="Enter the value you want to display")#
									#html.textField(name="actualValue",bind=prc.option,label="Actual Value:",required="required",size="50",class="textoption",title="Enter the value you want the form to record")#
									#html.checkbox(name="isChecked",bind=prc.option,label="Checked/Selected:",class="checkbox",title="Should this option be selected/checked by default")#

									<div class="actionBar">
										<button class="button" onclick="return to('#event.buildLink(prc.xehFieldEditor)#/fieldID/#prc.option.getField().getFieldID()#/##options')">Cancel</button>
										<input type="submit" value="Save" class="buttonred">
									</div>
									#html.endFieldSet()#
								#html.endForm()#
							</div>
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