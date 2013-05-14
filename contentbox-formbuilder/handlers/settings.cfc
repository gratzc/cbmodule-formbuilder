component extends="base" {

	// DI
	property name="settingService" 	inject="settingService@cb";
	property name="cb" 				inject="cbHelper@cb";

	function index(event,rc,prc){
		prc.settings = deserializeJSON(settingService.getSetting( "form_builder" ));

		event.setView("settings/index");
	}

	function saveSettings(event,rc,prc){
		// Get Form Builder settings from user input
		var newSettings = serializeJSON({"htmlHelper"={"groupWrapper"=rc.groupWrapper,"groupWrapperClass"=rc.groupWrapperClass,"labelWrapper"=rc.labelWrapper,"labelWrapperClass"=rc.labelWrapperClass,"label"=rc.label,"labelClass"=rc.labelClass,"helpWrapper"=rc.helpWrapper,"helpWrapperClass"=rc.helpWrapperClass,"wrapper"=rc.wrapper,"wrapperClass"=rc.wrapperClass},"CAPTCHAType"=rc.CAPTCHAType,"reCAPTCHA"={"publicKey"=rc.publicKey, "privateKey"=rc.privateKey}});

		// Get Form Builder settings object
		var oSetting = settingService.findWhere( { name="form_builder" } );

		// Set the value and save
		oSetting.setValue( newSettings );
		settingService.save( oSetting );

		// Flush the settings cache so our new settings are reflected
		settingService.flushSettingsCache();

		// Messagebox
		getPlugin("MessageBox").info("Settings Saved & Updated!");

		// Relocate via CB Helper
		cb.setNextModuleEvent("cbFormBuilder","settings.index");
	}

	function render(event,rc,prc){
		// Get Form Builder settings
		prc.settings = getModuleSettings("contentbox-formbuilder").settings;
		return renderview(view="settings/index",module="cbFormBuilder");
	}

}