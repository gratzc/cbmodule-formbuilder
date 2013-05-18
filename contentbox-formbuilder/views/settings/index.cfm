<cfoutput>
#renderView( "viewlets/assets" )#
<!--============================Main Column============================-->
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="box">
			<!--- Body Header --->
			<div class="header">
				<i class="icon-magic"></i> Settings
			</div>
			<!--- Body --->
			<div class="body" id="mainBody">
				#getPlugin("MessageBox").renderit()#
				<div class="tabbable tabs-left">
					<ul class="nav nav-tabs">
						<li class="active"><a href="##captcha" data-toggle="tab"><i class="icon-reorder"></i> CAPTCHA</a></li>

						<li><a href="##containersStyleHooks" data-toggle="tab"><i class="icon-th-large"></i> Containers / Style Hooks</a></li>
					</ul>

					<div class="tab-content">
						<!--- Form Details --->
						<div class="tab-pane active" id="captcha">
							#html.startForm(action="#prc.xehSettingsSave#",name="settingsForm")#
								#html.startFieldset(legend="CAPTCHA")#
									<label for="CAPTCHAType">Type:</label>
									#html.radioButton(name="CAPTCHAType",checked=(prc.settings.CAPTCHAType eq 'CF'),value="CF")# ColdFusion
									#html.radioButton(name="CAPTCHAType",checked=(prc.settings.CAPTCHAType eq 'reCAPTCHA'),value="reCAPTCHA")# reCAPTCHA<br><br>

									#html.textField(name="publicKey", label="reCAPTCHA Public Key:", value="#prc.settings.recaptcha.publicKey#", class="textfield large")#

									#html.textField(name="privateKey", label="reCAPTCHA Private Key:", value="#prc.settings.recaptcha.privateKey#", class="textfield large")#<br/>

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

									#html.textField(name="groupWrapper", label="Group Wrapper:", value="#prc.settings.htmlHelper.groupWrapper#", class="textfield large")#

									#html.textField(name="groupWrapperClass", label="Group Wrapper Class:", value="#prc.settings.htmlHelper.groupWrapperClass#", class="textfield large")#

									#html.textField(name="labelWrapper", label="Label Wrapper:", value="#prc.settings.htmlHelper.labelWrapper#", class="textfield large")#

									#html.textField(name="labelWrapperClass", label="Label Wrapper Class:", value="#prc.settings.htmlHelper.labelWrapperClass#", class="textfield large")#

									#html.textField(name="label", label="Label:", value="#prc.settings.htmlHelper.label#", class="textfield large")#

									#html.textField(name="labelClass", label="Label  Class:", value="#prc.settings.htmlHelper.labelClass#", class="textfield large")#

									#html.textField(name="wrapper", label="Wrapper:", value="#prc.settings.htmlHelper.wrapper#", class="textfield large", id="styleWrapper")#

									#html.textField(name="wrapperClass", label="Wrapper Class:", value="#prc.settings.htmlHelper.wrapperClass#", class="textfield large")#

									#html.textField(name="helpWrapper", label="Help Wrapper:", value="#prc.settings.htmlHelper.helpWrapper#", class="textfield large")#

									#html.textField(name="helpWrapperClass", label="Help Wrapper Class:", value="#prc.settings.htmlHelper.helpWrapperClass#", class="textfield large")#

									<div class="form-actions">
										#html.submitButton(value="Save Settings",class="btn btn-danger",title="Save Settings")#
									</div>
								#html.endForm()#
							</fieldset>
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