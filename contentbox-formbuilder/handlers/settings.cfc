component extends="base" {

	// DI
	property name="settingService" 	inject="settingService@cb";
	property name="cb" 				inject="cbHelper@cb";

	function index(event,rc,prc){
		prc.settings = deserializeJSON(settingService.getSetting( "form_builder" ));
		prc.xehSettingsSave = "cbFormBuilder.settings.saveSettings";

		event.setView("settings/index");
	}

	function saveSettings(event,rc,prc){
		var incomingSetting = "";
		var newSetting = {};
		var newSettings = {};

		var oSetting = settingService.findWhere( { name="form_builder" } );

		// Get Form Builder settings from user input
		if(structKeyExists(rc,"CAPTCHAType")) {
			incomingSetting = serializeJSON({"CAPTCHAType"=rc.CAPTCHAType});
			newSetting = deserializeJSON(incomingSetting);
			structAppend(newSettings,newSetting);
		}

		if(structKeyExists(rc,"publicKey")) {
			incomingSetting = serializeJSON({"reCAPTCHA"={"publicKey"=rc.publicKey, "privateKey"=rc.privateKey}});
			newSetting = deserializeJSON(incomingSetting);
			structAppend(newSettings,newSetting);
		}

		if(structKeyExists(rc,"groupWrapper")) {
			incomingSetting = serializeJSON({"htmlHelper"={"groupWrapper"=rc.groupWrapper,"groupWrapperClass"=rc.groupWrapperClass,"labelWrapper"=rc.labelWrapper,"labelWrapperClass"=rc.labelWrapperClass,"label"=rc.label,"labelClass"=rc.labelClass,"helpWrapper"=rc.helpWrapper,"helpWrapperClass"=rc.helpWrapperClass,"wrapper"=rc.wrapper,"wrapperClass"=rc.wrapperClass}});
			newSetting = deserializeJSON(incomingSetting);
			structAppend(newSettings,newSetting);
		}

		var settings = deserializeJSON(oSetting.getValue());

		// Append the new settings sent in to the existing settings (overwrite)
		structAppend(settings,newSettings);

		oSetting.setValue( serializeJSON(settings) );
		settingService.save( oSetting );

		// Flush the settings cache so our new settings are reflected
		settingService.flushSettingsCache();

		getPlugin("MessageBox").info("Settings Saved & Updated!");
		cb.setNextModuleEvent("cbFormBuilder","settings.index");
	}

	function render(event,rc,prc){
		// Get Form Builder settings
		prc.settings = getModuleSettings("contentbox-formbuilder").settings;
		return renderview(view="settings/index",module="cbFormBuilder");
	}

}