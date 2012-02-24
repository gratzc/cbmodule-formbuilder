<cfoutput>
	<div id="#prc.form.getCSSID()#" class="#prc.form.getCSSClass()#">
	#html.startForm(name=prc.form.getName(),action=prc.xehformsubmit,novalidate="novalidate")#
		#html.hiddenField(name="formID",bind=prc.form)#
		<cfloop array="#prc.form.getFields()#" index="field">
			<cfset args = {field=field} />
			#renderview(view="viewlets/fields/#field.getTypeView()#",module="contentbox-formbuilder",args=args)#
		</cfloop>
		#html.submitButton(value='Submit')#
	#html.endForm()#
	</div>
</cfoutput>