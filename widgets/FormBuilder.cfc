/**
* A widget that renders form based on slug from a form built in the FormBuilder Module
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	FormBuilder function init(required any controller){
		// super init
		super.init( arguments.controller );

		// Widget Properties
		setName("FormBuilder");
		setVersion("2.0");
		setDescription("A widget that renders a form built in the FormBuilder Module");
		setAuthor("Computer Know How, LLC");
		setAuthorURL("www.compknowhow.com");
		setForgeBoxSlug("cbwidget-formbuilder");
		setIcon("file-text-o");
		setCategory("Content")

		return this;
	}

	/**
	* Renders FormBuilder form
	* @slug.hint The form slug to render
	* @defaultValue.hint The string to show if the form slug does not exist
	*/
	any function renderIt(required string slug, string defaultValue){
		if (isDefined("event") and getMetaData(event).getName() eq "java.lang.String" and find("contentbox-admin", event)) {
			return "Form preview is disabled";
		}

		var content = runEvent(event='contentbox-formbuilder:formRender.renderForm',eventArguments=arguments);
		if( !isNull(content) ){
			return content;
		}

		// default value
		if( structKeyExists(arguments, "defaultValue") ){
			return arguments.defaultValue;
		}

		throw(message="The content slug '#arguments.slug#' does not exist",type="FormBuilderWidget.InvalidFormBuilderSlug");
	}

}