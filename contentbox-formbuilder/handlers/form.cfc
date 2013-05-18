/**
* I handle the form form events
*/
component extends="base" {


	function index(event,rc,prc){
		//exit points
		prc.xehFormRemove = "cbFormBuilder.form.remove";

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

		//repopulate form form failed save
		formService.populate(prc.form,rc);

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
			oForm.setUseCAPTCHA(false);
		}

		// validate it
		var errors = oForm.validate();
		if( !arrayLen(errors) ){
			// save content
			formService.save( oForm );
			// Message
			getPlugin("MessageBox").info("Form saved! Now you are happy!");
			setNextEvent(event=prc.xehFormEditor,queryString="formID=#oForm.getFormID()#");
		}
		else{
			flash.persistRC(exclude="event");
			getPlugin("MessageBox").warn(messageArray=errors);
			setNextEvent(event=prc.xehFormEditor,queryString="formID=#oForm.getFormID()#");
		}

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


	function submissionReport(event,rc,prc) {
		rc.Form = formService.get( rc.formID );
		prc.submissions = rc.Form.getSubmissions();
		//exit points
		prc.xehFormSubmissionRemove = 'cbFormBuilder.form.removeSubmission';
		event.setView("form/report");
	}


	function removeSubmission(event,rc,prc) {
		var oSubmission	= formSubmissionService.get( rc.formSubmissionID );

		if( isNull(oSubmission) ){
			getPlugin("MessageBox").setMessage("warning","Invalid Submission detected!");
			setNextEvent( prc.xehSubmissionReport,"formID=#rc.formID#" );
		}
		// remove
		formService.delete( oSubmission );
		// message
		getPlugin("MessageBox").setMessage("info","Submission Removed!");
		// redirect
		setNextEvent(prc.xehSubmissionReport,"formID=#rc.formID#");
	}

	/**
	* noDataSetup
	*/
	any function noDataSetup(event,rc,prc){

		event.setView("form/noDataSetup");
	}

}