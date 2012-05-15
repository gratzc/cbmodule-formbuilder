/**
* A Module that will help you generate forms for ContentBox, used in combination with the
* FormBuilder Widget it will allow you to create forms and display them on your ContentBox
* pages
*/
component {

	// Module Properties
	this.title 				= "contentbox-formbuilder";
	this.author 			= "Curt Gratz";
	this.webURL 			= "http://www.compknowhow.com";
	this.description 		= "A cool form builder for content box";
	this.version			= "0.1";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "cbFormBuilder";

	function configure(){

		// SES Routes
		routes = [
			{pattern="/", handler="form",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// Interceptors
		interceptors = [
			{ class="#moduleMapping#.interceptors.CBFRequest", properties={ entryPoint="cbadmin" }, name="CBFRequest@cbFormBuilder" }
		];

		//Mappings
		binder.map("TypeService@cbFormBuilder").to("#moduleMapping#.model.TypeService");
		binder.map("FormSubmissionService@cbFormBuilder").to("#moduleMapping#.model.FormSubmissionService");

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){

		// ContentBox loading
		if( structKeyExists( controller.getSetting("modules"), "contentbox" ) ){
			// Let's add ourselves to the main menu in the Modules section
			var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
			// Add Menu Contribution
			menuService.addSubMenu(topMenu=menuService.MODULES,name="cbFormBuilder",label="Form Builder",href="#menuService.buildModuleLink('cbFormBuilder','form.index')#");
		}
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		// ContentBox unloading
		if( structKeyExists( controller.getSetting("modules"), "contentbox" ) ){
			// Let's remove ourselves to the main menu in the Modules section
			var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
			// Remove Menu Contribution
			menuService.removeSubMenu(topMenu=menuService.MODULES,name="cbFormBuilder");
		}
	}

}