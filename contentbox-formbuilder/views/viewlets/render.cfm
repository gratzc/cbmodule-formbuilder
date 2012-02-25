<cfoutput>
	<div id="#prc.form.getCSSID()#" class="#prc.form.getCSSClass()#">
	#html.startForm(name=prc.form.getName(),action=prc.xehformsubmit,novalidate="novalidate")#
		#html.hiddenField(name="formID",bind=prc.form)#
		<cfloop array="#prc.form.getFields()#" index="field">
			#html.textField(id=field.getCSSID(),name=field.getName(),value=field.getDefaultValue(),label=Field.getLabel(),required=Field.getIsRequired(),size=Field.getMaxLength,class=Field.getCSSClass())#
		</cfloop>
		#html.submitButton(value='Submit')#
	#html.endForm()#
	</div>
</cfoutput>