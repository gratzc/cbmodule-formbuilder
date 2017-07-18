/**
* I handle the form rendering events
*/
component {

	// Dependencies
	property name="formService"					inject="entityService:Form";
	property name="FormSubmissionService"		inject="FormSubmissionService@cbFormBuilder";

	function renderForm(event,rc,prc,slug) {
		if( arguments.slug != "" ){
			prc.form = formService.findWhere({slug=arguments.slug});
			if( !isNull(prc.form) ){
				prc.xehformsubmit = "cbFormBuilder.formRender.submitForm";
				prc.html = createObject("component", "HTMLHelper").init(controller);

				return renderView(view="viewlets/render",module="contentbox-formbuilder");
			} else {
				return "Form '" & arguments.slug & "' not found.";
			}
		} else {
			return "Please provide a form to render.";
		}
	}

	function submitForm(event,rc,prc) {
		//TODO: set field submissions to the default value if they come in blank.

		var errors = formSubmissionService.validateSubmission(event,rc,prc);

		if (arrayLen(errors)) {
			getInstance("messageBox@cbMessageBox").setMessage("warning", arrayToList(errors, "<br>"));
		} else {
			var oForm = formService.get( rc.formID );
			var oSubmission = formSubmissionService.new();
			oSubmission.setSubmissionIP(cgi.REMOTE_ADDR);
			oSubmission.setFormData(serializeJSON(form));
			oSubmission.setForm(oForm);
			oSubmission.setSubmissionDate(now());
			formSubmissionService.save(oSubmission);
			getInstance("messageBox@cbMessageBox").setMessage("info",oForm.getSubmitMessage());
			prc.formData = deserializeJSON(oSubmission.getFormData());
			//set any emails if there are any
			oSubmission.sendSubmissionEmails();
		}
		setNextEvent(url=rc._returnTo);
	}

}