<cfoutput>
#renderView( "viewlets/assets" )#
<!--============================Main Column============================-->
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="box">
			<!--- Body Header --->
			<div class="header">
				<i class="icon-file-alt"></i>
				<cfif prc.option.isLoaded()>Editing "#prc.option.getDisplayValue()#"<cfelse>Create Option</cfif>
			</div>
			<!--- Body --->
			<div class="body">
				#getPlugin("MessageBox").renderIt()#

				<div class="tabbable tabs-left">
					<!--- User Navigation Bar --->
					<ul class="nav nav-tabs">
						<li class="active"><a href="##optionDetails" data-toggle="tab"><i class="icon-list-alt"></i> Option Details</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane active" id="optionDetails">
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
									<div class="form-actions">
										<button class="btn" onclick="return to('#event.buildLink(prc.xehFieldEditor)#/fieldID/#prc.option.getField().getFieldID()#/##options')">Cancel</button>
										<input type="submit" value="Save" class="btn btn-danger">
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