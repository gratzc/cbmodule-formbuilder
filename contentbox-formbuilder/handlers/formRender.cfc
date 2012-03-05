/**
* I handle the form rendering events
*/
component {

	// Dependencies
	property name="formService"					inject="entityService:Form";
	property name="FormSubmissionService"		inject="id:FormSubmissionService@cbFormBuilder";

	function renderForm(event,rc,prc,slug) {
		prc.form = formService.findWhere({slug=arguments.slug});
		prc.xehformsubmit = "cbFormBuilder.formRender.submitForm";
		return renderview(view="viewlets/render",module="contentbox-formbuilder");
	}

	function submitForm(event,rc,prc) {
		var errors = formSubmissionService.validateSubmission(event,rc,prc);
		if (arrayLen(errors)) {
			getPlugin("MessageBox").setMessage("warning","There was a problem submitting your form!");
		} else {
			var oForm = formService.get( rc.formID );
			var oSubmission = formSubmissionService.new();
			oSubmission.setSubmissionIP(cgi.REMOTE_ADDR);
			oSubmission.setFormData(serializeJSON(form));
			oSubmission.setForm(oForm);
			oSubmission.setSubmissionDate(now());
			//writeDump(oSubmission);abort;
			formSubmissionService.save(oSubmission);
			getPlugin("MessageBox").setMessage("info",oForm.getSubmitMessage());
			prc.formData = deserializeJSON(oSubmission.getFormData());
			//set any emails if there are any
			oSubmission.sendSubmissionEmails();
		}
		setNextEvent(url=rc._returnTo);
	}


}