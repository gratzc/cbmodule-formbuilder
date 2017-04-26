/**
********************************************************************************
Copyright 2017 Form Builder by Computer Know How, LLC
www.compknowhow.com
********************************************************************************

Author:  Computer Know How, LLC
Description:  Intercepts form builder and processes as an admin event
*/
component extends="modules.contentbox.modules.contentbox-admin.interceptors.CBRequest" {

	function configure(){}

	function preProcess( event, interceptData ) eventPattern="^contentbox-formbuilder" {
		variables.childModulesRegex = "contentbox-formbuilder";
		super.preProcess(event,interceptData);
	}
}