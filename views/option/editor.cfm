<cfoutput>
	#renderView( "viewlets/assets" )#
	<!--============================Main Column============================-->
	<div class="row">
		<div class="col-md-12">
			<h1 class="h1">
				<i class="fa fa-list"></i>
				<cfif prc.option.isLoaded()>Editing "#prc.option.getDisplayValue()#"<cfelse>Create Option</cfif>
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-body">
					#getInstance("MessageBox@cbmessagebox").renderit()#

					<div class="tabbable tabs-left">
						<!--- User Navigation Bar --->
						<ul class="nav nav-tabs">
							<li class="active"><a href="##optionDetails" data-toggle="tab"><i class="fa fa-list"></i> Option Details</a></li>
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
											<div class="form-group">
												#html.textField(name="displayValue",bind=prc.option,label="*Display Value:",required="required",class="form-control",title="Enter the value you want to display")#
											</div>

											<div class="form-group">
												#html.textField(name="actualValue",bind=prc.option,label="Actual Value:",required="required",class="form-control",title="Enter the value you want the form to record")#
											</div>

											<div class="form-group">
												#html.checkbox(name="isChecked",bind=prc.option,label="Checked/Selected:",class="checkbox",title="Should this option be selected/checked by default")#
											</div>

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
		<div class="col-md-3">
			<cfinclude template="../sidebar/actions.cfm" >
			<cfinclude template="../sidebar/help.cfm" >
			<cfinclude template="../sidebar/about.cfm" >
		</div>
	</div>
</cfoutput>