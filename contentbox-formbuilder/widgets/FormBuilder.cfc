/**
* A widget that renders form based on slug from a form built in the FormBuilder Module
*/
component extends="contentbox.model.ui.BaseWidget" singleton{

	FormBuilder function init(controller){
		// super init
		super.init(controller);

		// Widget Properties
		setPluginName("FormBuilder");
		setPluginVersion("1.0");
		setPluginDescription("A widget that renders a form built in the FormBuilder Module");
		setPluginAuthor("Curt Gratz");
		setPluginAuthorURL("www.compknowhow.com");
		setForgeBoxSlug("cbwidget-formbuilder");

		return this;
	}

	/**
	* Renders FormBuilder form
	* @slug.hint The form slug to render
	* @defaultValue.hint The string to show if the form slug does not exist
	*/
	any function renderIt(required string slug, string defaultValue){
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
