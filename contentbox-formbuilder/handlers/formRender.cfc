/**
* I handle the form rendering events
*/
component {

	// Dependencies
	property name="formService"					inject="entityService:Form";
	property name="FormSubmissionService"		inject="id:FormSubmissionService@cbFormBuilder";
	property name="HTMLHelper"					inject="coldbox:myPlugin:HTMLHelper@contentbox-formbuilder";

	function renderForm(event,rc,prc,slug) {
		prc.form = formService.findWhere({slug=arguments.slug});
		prc.xehformsubmit = "cbFormBuilder.formRender.submitForm";
		prc.html = HTMLHelper;

		return renderview(view="viewlets/render",module="contentbox-formbuilder");
	}

	function submitForm(event,rc,prc) {
		//TODO: set field submissions to the default value if they come in blank.

		var errors = formSubmissionService.validateSubmission(event,rc,prc);

		if (arrayLen(errors)) {
			//todo: persist form variables on error to repopulate form
			getPlugin("MessageBox").setMessage("warning","There was a problem submitting your form!");
		} else {
			var oForm = formService.get( rc.formID );
			var oSubmission = formSubmissionService.new();
			oSubmission.setSubmissionIP(cgi.REMOTE_ADDR);
			oSubmission.setFormData(serializeJSON(form));
			oSubmission.setForm(oForm);
			oSubmission.setSubmissionDate(now());
			formSubmissionService.save(oSubmission);
			getPlugin("MessageBox").setMessage("info",oForm.getSubmitMessage());
			prc.formData = deserializeJSON(oSubmission.getFormData());
			//set any emails if there are any
			oSubmission.sendSubmissionEmails();
		}
		setNextEvent(url=rc._returnTo);
	}

}