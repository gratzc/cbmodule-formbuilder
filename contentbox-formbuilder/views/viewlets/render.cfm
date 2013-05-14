<cfoutput>
	<div id="#prc.form.getCSSID()#" class="#prc.form.getCSSClass()#">
	#getPlugin("MessageBox").renderit()#
	#prc.html.startForm(name=prc.form.getName(),action=prc.xehformsubmit)# <!---,novalidate="novalidate"--->
		#prc.html.hiddenField(name="_returnTo",value=cb.linkSelf())#
		#prc.html.hiddenField(name="formID",bind=prc.form)#
		<!---#prc.html.hiddenField(name="contentID",bind=prc.form)#--->
		<cfloop array="#prc.form.getFields()#" index="field">
			<cfset args = {field=field} />

			<!--- TODO: Need to handle the selectValue for selects --->
			#renderview(view="viewlets/fields/#field.getTypeView()#",module="contentbox-formbuilder",args=args)#
		</cfloop>
		<cfif prc.form.getUseCaptcha()>
			<div class="control-group">
				<label class="control-label">Security Code</label>
				<div class="controls">
					<cfset settings = deserializeJSON(cb.setting('form_builder'))>
					<cfif settings.captchaType eq "CF">
						#getMyPlugin(plugin="Captcha",module="contentbox").display()#<br />
						#html.textField(name="captchacode",label="Enter the security code shown above:",required="required",size="50")#
					<cfelseif settings.captchaType eq "reCAPTCHA">
						#getMyPlugin(plugin="reCAPTCHA",module="contentbox-formbuilder").display(theme="white",message="This is a message",publicKey="#settings.recaptcha.publicKey#")#
					</cfif>
				</div>
			</div>
		</cfif>

		#prc.html.submitButton(value='Submit',class="btn btn-primary")#
	#prc.html.endForm()#
	</div>
</cfoutput>