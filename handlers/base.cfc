/**
* base handler for the form builder
*/
component{

	// dependencies
	property name="formService"					inject="entityService:Form";
	property name="fieldService"				inject="entityService:Field";
	property name="optionService"				inject="entityService:FieldOption";
	property name="TypeService"					inject="TypeService@cbFormBuilder";
	property name="FormSubmissionService"		inject="FormSubmissionService@cbFormBuilder";

	// pre handler
	function preHandler(event,action,eventArguments){
		var rc 	= event.getCollection();
		var prc = event.getCollection(private=true);

		// get module root
		prc.moduleRoot = event.getModuleRoot( "contentbox-formbuilder" );

		// if data isn't setup, redirect user
		if( !FormSubmissionService.isDataSetup() && event.getCurrentEvent() NEQ "contentbox-formbuilder:form.noDataSetup") {
			setNextEvent("cbFormBuilder.form.noDataSetup");
		}

		// exit points
		prc.xehForms = "cbFormBuilder.form.index";
		prc.xehFormEditor = "cbFormBuilder.form.editor";
		prc.xehFieldEditor = "cbFormBuilder.field.editor";
		prc.xehFields = "cbFormBuilder.field.index";
		prc.xehFieldOptionEditor = "cbFormBuilder.option.editor";
		prc.xehFieldForm = "contentbox-formbuilder:field.form";
		prc.xehSubmissionReport = "cbFormBuilder.form.submissionReport";
		prc.xehFormSettings = "cbFormBuilder.settings.index";

		//check login and redirect is needed.
		if(!prc.oCurrentAuthor.isLoaded()){
			getInstance("messageBox@cbMessageBox").setMessage("warning","Please login!");
			setNextEvent(prc.xehLogin);
		}

		// use the CB admin layout
		event.setLayout(name="admin",module="contentbox-admin");

		// tab control
		prc.tabModules = true;
		prc.tabModules_cbFormBuilder = true;
	}

}
