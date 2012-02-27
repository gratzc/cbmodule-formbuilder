<cfoutput>
	<div id="#prc.form.getCSSID()#" class="#prc.form.getCSSClass()#">
	#getPlugin("MessageBox").renderit()#
	#html.startForm(name=prc.form.getName(),action=prc.xehformsubmit,novalidate="novalidate")#
		#html.hiddenField(name="_returnTo",value=cb.linkSelf())#
		#html.hiddenField(name="formID",bind=prc.form)#
		<!---#html.hiddenField(name="contentID",bind=prc.form)#--->
		<cfloop array="#prc.form.getFields()#" index="field">
			<cfset args = {field=field} />
			#renderview(view="viewlets/fields/#field.getTypeView()#",module="contentbox-formbuilder",args=args)#
		</cfloop>
		<cfif prc.form.getUseCaptcha()>
		<br />
		#getMyPlugin(plugin="Captcha",module="contentbox").display()#<br />
		#html.textField(name="captchacode",label="Enter the security code shown above:",required="required",size="50")#
		</cfif>
		#html.submitButton(value='Submit')#
	#html.endForm()#
	</div>
</cfoutput>