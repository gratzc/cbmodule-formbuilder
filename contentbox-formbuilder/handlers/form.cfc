/**
* I handle the form form events
*/
component extends="base" {

	function index(event,rc,prc){
		//exit points
		prc.xehFormRemove = "cbFormBuilder.form.remove";
		prc.xehSubmissionReport = "cbFormBuilder.form.submissionReport";

		//current forms
		prc.forms = formService.list(sortOrder="createdDate DESC",asQuery=false);
		//form form view
		event.setView(view="form/index",module="contentbox-formbuilder");
	}

	// slugify remotely
	function slugify(event,rc,prc){
		event.renderData(data=getPlugin("HTMLHelper").slugify( rc.slug ),type="plain");
	}

	// form editor
	function editor(event,rc,prc){
		// exit handlers
		prc.xehFormsave 		= "cbFormBuilder.form.save";
		prc.xehSlugify	  		= "cbFormBuilder.form.slugify";

		// get new or persisted form
		prc.form  = formService.get( event.getValue("formID",0) );

		// viewlets
		prc.fieldsViewlet = "";
		if( prc.form.isLoaded() ){
			var args = {formID=rc.formID};
			prc.fieldsViewlet = runEvent(event="contentbox-formbuilder:form.fields",eventArguments=args);
		}

		// Editor
		prc.tabForms_editor = true;

		// view
		event.setView("form/editor");
	}

	// save form
	function save(event,rc,prc){

		// get it and populate it
		var oForm = populateModel( formService.get(id=rc.formID) );

		if (!len(oForm.getCreatedDate())) {
			oForm.setCreatedDate(now());
		}

		if ( !event.valueExists("useCAPTCHA") ) {
			oField.setUseCAPTCHA(false);
		}


		// validate it
		var errors = oForm.validate();
		if( !arrayLen(errors) ){
			// save content
			formService.save( oForm );
			// Message
			getPlugin("MessageBox").info("Form saved! Now you are happy!");
		}
		else{
			getPlugin("MessageBox").warn(errorMessages=errors);
		}

		// relocate back to editor
		setNextEvent(event=prc.xehFormEditor,queryString="formID=#oForm.getFormID()#");
	}

	function remove(event,rc,prc){
		var oForm	= formService.get( rc.formID );

		if( isNull(oForm) ){
			getPlugin("MessageBox").setMessage("warning","Invalid Form detected!");
			setNextEvent( prc.xehForms );
		}
		// remove
		formService.delete( oForm );
		// message
		getPlugin("MessageBox").setMessage("info","Form Removed!");
		// redirect
		setNextEvent(prc.xehForms);
	}

	function fields(event,rc,prc,formID){
		//exit points
		prc.xehFieldRemove = "cbFormBuilder.field.remove";
		prc.xehFieldOrder = "cbFormBuilder.field.changeOrder";

		//current forms
		var oForm = formService.get(arguments.formID);
		prc.fields = oForm.getFields();
		prc.Types = TypeService.getTypes();

		if (isNull(prc.fields)) {
			prc.fields = [];
		}

		//form form view
		return renderview(view="viewlets/fields",module="contentbox-formbuilder");
	}

	function renderForm(event,rc,prc,slug) {
		prc.form = formService.findWhere({slug=arguments.slug});
		prc.xehformsubmit = "cbFormBuilder.form.submitForm";
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
			formSubmissionService.save(oSubmission);
			//getPlugin("MessageBox").setMessage("info",oForm.getSubmitMessage());
			prc.formData = deserializeJSON(oSubmission.getFormData());
			return renderView(view="viewlets/renderSubmission",module="contentbox-formbuilder");
		}
		//setNextEvent(url=rc._returnTo);
	}

	function submissionReport(event,rc,prc) {
		var oForm = formService.get( rc.formID );
		prc.submissions = oForm.getSubmissions();
		event.setView("form/report");
	}

}