<cfoutput>
	#renderView( "viewlets/assets" )#
	<!--============================Main Column============================-->
	<div class="row">
		<div class="col-md-12">
			<h1 class="h1">
				<i class="fa fa-list"></i> Forms
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
							<li class="active"><a href="##captcha" data-toggle="tab"><i class="fa fa-reorder"></i> CAPTCHA</a></li>
							<li><a href="##containersStyleHooks" data-toggle="tab"><i class="fa fa-th"></i> Containers / Style Hooks</a></li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active" id="captcha">
								#html.startForm(action="#prc.xehSettingsSave#",name="settingsForm")#
									#html.startFieldset(legend="CAPTCHA")#
										<div class="form-group">
											#html.label(class="control-label", field="CAPTCHAType", content="Type:")#

											<div class="controls">
												#html.radioButton(name="CAPTCHAType", checked=(prc.settings.CAPTCHAType eq 'CF'), value="CF")# ColdFusion
												#html.radioButton(name="CAPTCHAType", checked=(prc.settings.CAPTCHAType eq 'reCAPTCHA'), value="reCAPTCHA")# reCAPTCHA
											</div>
										</div>

										<div class="form-group">
											#html.label(field="publicKey", content="reCAPTCHA Public Key:")#
											#html.textField(name="publicKey", value=prc.settings.reCAPTCHA.publicKey, class="form-control")#
										</div>

										<div class="form-group">
											#html.label(field="privateKey", content="reCAPTCHA Private Key:")#
											#html.textField(name="privateKey", value=prc.settings.reCAPTCHA.privateKey, class="form-control")#
										</div>

										<small>Setup your account and get your keys <a href="https://www.google.com/recaptcha/admin/create" target="_blank">here</a></small>

										<div class="form-actions">
											#html.submitButton(value="Save Settings",class="btn btn-danger",title="Save Settings")#
										</div>
									#html.endFieldSet()#
								#html.endForm()#
							</div>
							<div class="tab-pane" id="containersStyleHooks">
								#html.startForm(action="cbadmin.module.cbFormBuilder.settings.saveSettings",name="settingsForm")#
								#html.startFieldset(legend="Containers / Style Hooks")#
								<div class="alert alert-info">
									<b>EXAMPLE:</b><br /><br />
									<small>
										<cfset indentation = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">

										&lt;<b>GROUPWRAPPERCLASS</b> class="<b>GROUPWRAPPERCLASS</b>"&gt;<br />
										#indentation#&lt;<b>LABELWRAPPER</b> class=&quot;<b>LABELWRAPPERCLASS</b>"&gt;<br />
										#indentation##indentation#&lt;<b>LABEL</b> class="<b>LABELCLASS</b>"&gt;[LABEL]&lt;/<b>LABEL</b>&gt;<br />
										#indentation#&lt;/<b>LABELWRAPPER</b>&gt;<br />
										#indentation#&lt;<b>WRAPPER</b> class=&quot;<b>WRAPPERCLASS</b>"&gt;<br />
										#indentation##indentation#&lt;[INPUT FIELD]&gt;<br />
										#indentation##indentation#&lt;<b>HELPWRAPPER</b> class="<b>HELPWRAPPERCLASS</b>"&gt;[HELP TEXT]&lt;/<b>HELPWRAPPER</b>&gt;<br />
										#indentation#&lt;/<b>WRAPPER</b>&gt;<br />
										&lt;/<b>GROUPWRAPPER</b>&gt;
									</small>
								</div>

								<div class="form-group">
									#html.textField(name="groupWrapper", label="Group Wrapper:", value="#prc.settings.htmlHelper.groupWrapper#", class="form-control")#
								</div>

								<div class="form-group">
									#html.textField(name="groupWrapperClass", label="Group Wrapper Class:", value="#prc.settings.htmlHelper.groupWrapperClass#", class="form-control")#
								</div>

								<div class="form-group">
									#html.textField(name="labelWrapper", label="Label Wrapper:", value="#prc.settings.htmlHelper.labelWrapper#", class="form-control")#
								</div>

								<div class="form-group">
									#html.textField(name="labelWrapperClass", label="Label Wrapper Class:", value="#prc.settings.htmlHelper.labelWrapperClass#", class="form-control")#
								</div>

								<div class="form-group">
									#html.textField(name="label", label="Label:", value="#prc.settings.htmlHelper.label#", class="form-control")#
								</div>

								<div class="form-group">
									#html.textField(name="labelClass", label="Label  Class:", value="#prc.settings.htmlHelper.labelClass#", class="form-control")#
								</div>

								<div class="form-group">
									#html.textField(name="wrapper", label="Wrapper:", value="#prc.settings.htmlHelper.wrapper#", class="form-control")#
								</div>

								<div class="form-group">
									#html.textField(name="wrapperClass", label="Wrapper Class:", value="#prc.settings.htmlHelper.wrapperClass#", class="form-control")#
								</div>

								<div class="form-group">
									#html.textField(name="helpWrapper", label="Help Wrapper:", value="#prc.settings.htmlHelper.helpWrapper#", class="form-control")#
								</div>

								<div class="form-group">
									#html.textField(name="helpWrapperClass", label="Help Wrapper Class:", value="#prc.settings.htmlHelper.helpWrapperClass#", class="form-control")#
								</div>

								<div class="form-actions">
									#html.submitButton(value="Save Settings",class="btn btn-danger",title="Save Settings")#
								</div>
								#html.endFieldSet()#
								#html.endForm()#
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
