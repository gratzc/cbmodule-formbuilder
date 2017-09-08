<cfoutput>
	<div id="#prc.form.getCSSID()#" class="#prc.form.getCSSClass()#">
		#getInstance("messageBox@cbMessageBox").renderit()#

		#prc.html.startForm(name=prc.form.getName(),action=prc.xehformsubmit)# <!---,novalidate="novalidate"--->
			#prc.html.hiddenField(name="_returnTo",value=cb.linkSelf())#
			#prc.html.hiddenField(name="formID",bind=prc.form)#

			<!---#prc.html.hiddenField(name="contentID",bind=prc.form)#--->
			<cfloop array="#prc.form.getFields()#" index="field">
				<cfset args = {field=field} />

				<!--- TODO: Need to handle the selectValue for selects --->
				#renderview(view="viewlets/fields/#field.getTypeView()#",module="contentbox-formbuilder",args=args)#
			</cfloop>

			<!--- captcah --->
			<cfif prc.form.getUseCaptcha()>
				<cfset settings = deserializeJSON(cb.setting('form_builder'))>

				<cfif settings.htmlHelper.groupWrapper neq "">
					<#settings.htmlHelper.groupWrapper##settings.htmlHelper.groupWrapperClass neq "" ? ' class="#settings.htmlHelper.groupWrapperClass#"' : ''#>
				</cfif>
					<label#settings.htmlHelper.labelClass neq "" ? ' class="#settings.htmlHelper.labelClass#"' : ""#>Security Code</label>

					<script src="https://www.google.com/recaptcha/api.js"></script>
					<div class="g-recaptcha" data-sitekey="#settings.reCAPTCHA.publicKey#"></div>
				<cfif settings.htmlHelper.groupWrapper neq "">
					</#settings.htmlHelper.groupWrapper#>
				</cfif>
			</cfif>

			#prc.html.submitButton(value='Submit',class=prc.form.getSubmitButtonClass())#
		#prc.html.endForm()#
	</div>
</cfoutput>