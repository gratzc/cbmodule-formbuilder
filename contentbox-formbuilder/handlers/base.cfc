/**
* base handler for the form builder
*/
component{

	// Dependencies
	property name="formService"		inject="entityService:Form";
	property name="fieldService"	inject="entityService:Field";
	property name="optionService"	inject="entityService:FieldOption";
	property name="TypeService"		inject="id:TypeService@cbFormBuilder";

		// pre handler
	function preHandler(event,action,eventArguments){
		var rc 	= event.getCollection();
		var prc = event.getCollection(private=true);

		// Exit Points
		prc.xehForms = "cbFormBuilder.form.index";
		prc.xehFormEditor = "cbFormBuilder.form.editor";
		prc.xehFieldEditor = "cbFormBuilder.field.editor";
		prc.xehFields = "cbFormBuilder.field.index";
		prc.xehFieldOptionEditor = "cbFormBuilder.option.editor";
		prc.xehFieldForm = "contentbox-formbuilder:field.form";


		//use the CB admin layout
		event.setLayout(name="admin",module="contentbox-admin");
	}

}
