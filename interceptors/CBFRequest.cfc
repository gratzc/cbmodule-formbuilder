/**
********************************************************************************
Copyright 2017 Form Builder by Computer Know How, LLC
www.compknowhow.com
********************************************************************************

Author:  Computer Know How, LLC
Description:  Intercepts form builder and processes as an admin event
*/
component extends="coldbox.system.Interceptor"{

	// DI
	property name="securityService"		inject="id:securityService@cb";
	property name="settingService"		inject="id:settingService@cb";
	property name="adminMenuService"	inject="id:adminMenuService@cb";

	/**
	* Fired on contentbox requests
	*/
	function preProcess( event, interceptData, rc, prc ) eventPattern="^contentbox-formbuilder" {
		// Verify ContentBox installer has been ran?
		if( !settingService.isCBReady() ){
			setNextEvent( 'cbInstaller' );
		}

		/************************************** SETUP CONTEXT REQUEST *********************************************/

		// store module root
		prc.cbRoot = getContextRoot() & event.getModuleRoot( "contentbox-admin" );
		// cb helper
		prc.CBHelper = getModel( "CBHelper@cb" );
		// store admin module entry point
		prc.cbAdminEntryPoint = getModuleConfig( "contentbox-admin" ).entryPoint;
		// store site entry point
		prc.cbEntryPoint = getModuleConfig( "contentbox-ui" ).entryPoint;
		// store filebrowser entry point
		prc.cbFileBrowserEntryPoint = getModuleConfig( "contentbox-filebrowser" ).entryPoint;
		// Place user in prc
		prc.oCurrentAuthor = securityService.getAuthorSession();
		// Place global cb options on scope
		prc.cbSettings = settingService.getAllSettings(asStruct=true);
		// Place widgets root location
		prc.cbWidgetRoot = getContextRoot() & event.getModuleRoot( "contentbox" ) & "/widgets";
		// store admin menu service
		prc.adminMenuService = adminMenuService;
		// Sidemenu collapsed
		prc.sideMenuClass = "";
		// Is sidemenu collapsed for user?
		if( prc.oCurrentAuthor.getPreference( "sidemenuCollapse", false ) == "true" ){
			prc.sideMenuClass = "sidebar-mini";
		}

		/************************************** FORCE SSL *********************************************/

		if( prc.cbSettings.cb_admin_ssl and !event.isSSL() ){
			setNextEvent( event=event.getCurrentRoutedURL(), ssl=true );
		}

		/************************************** FORCE PASSWORD RESET *********************************************/

		if(
		 	!findNoCase( "contentbox-security:security", event.getCurrentEvent() )
			&&
			prc.oCurrentAuthor.getIsPasswordReset()
		){
			var token = securityService.generateResetToken( prc.oCurrentAuthor );
			getInstance( "messagebox@cbMessagebox" ).info(
				prc.CBHelper.r( "messages.password_reset_detected@security" )
			);
			setNextEvent(
				event 		= "#prc.cbAdminEntryPoint#.security.verifyReset",
				queryString = "token=#token#"
			);
			return;
		}

		/************************************** NAVIGATION EXIT HANDLERS *********************************************/

		// Global Admin Exit Handlers
		prc.xehDashboard 				= "#prc.cbAdminEntryPoint#.dashboard";
		prc.xehAbout					= "#prc.cbAdminEntryPoint#.dashboard.about";
		prc.xehAutoUpdates				= "#prc.cbAdminEntryPoint#.autoupdates";

		// Entries Tab
		prc.xehEntries					= "#prc.cbAdminEntryPoint#.entries";
		prc.xehBlogEditor 				= "#prc.cbAdminEntryPoint#.entries.editor";
		prc.xehCategories				= "#prc.cbAdminEntryPoint#.categories";

		// Content Tab
		prc.xehPages					= "#prc.cbAdminEntryPoint#.pages";
		prc.xehPagesEditor				= "#prc.cbAdminEntryPoint#.pages.editor";
		prc.xehContentStore				= "#prc.cbAdminEntryPoint#.contentStore";
		prc.xehContentStoreEditor		= "#prc.cbAdminEntryPoint#.contentStore.editor";
		prc.xehMediaManager				= "#prc.cbAdminEntryPoint#.mediamanager";
		prc.xehMenuManager				= "#prc.cbAdminEntryPoint#.menus";
		prc.xehMenuManagerEditor		= "#prc.cbAdminEntryPoint#.menus.editor";

		// Comments Tab
		prc.xehComments					= "#prc.cbAdminEntryPoint#.comments";
		prc.xehCommentsettings			= "#prc.cbAdminEntryPoint#.comments.settings";

		// Look and Feel Tab
		prc.xehThemes					= "#prc.cbAdminEntryPoint#.themes";
		prc.xehWidgets					= "#prc.cbAdminEntryPoint#.widgets";
		prc.xehGlobalHTML				= "#prc.cbAdminEntryPoint#.globalHTML";

		// Modules
		prc.xehModules					= "#prc.cbAdminEntryPoint#.modules";

		// Authors Tab
		prc.xehAuthors					= "#prc.cbAdminEntryPoint#.authors";
		prc.xehAuthorNew				= "#prc.cbAdminEntryPoint#.authors.new";
		prc.xehAuthorEditor				= "#prc.cbAdminEntryPoint#.authors.editor";
		prc.xehPermissions				= "#prc.cbAdminEntryPoint#.permissions";
		prc.xehPermissionGroups			= "#prc.cbAdminEntryPoint#.permissionGroups";
		prc.xehRoles					= "#prc.cbAdminEntryPoint#.roles";
		prc.xehSavePreference 			= "#prc.cbAdminEntryPoint#.authors.saveSinglePreference";

		// Tools
		prc.xehToolsImport				= "#prc.cbAdminEntryPoint#.tools.importer";

		// System
		prc.xehSettings					= "#prc.cbAdminEntryPoint#.settings";
		prc.xehSecurityRules			= "#prc.cbAdminEntryPoint#.securityrules";
		prc.xehRawSettings				= "#prc.cbAdminEntryPoint#.settings.raw";
		prc.xehAutoUpdater	    		= "#prc.cbAdminEntryPoint#.autoupdates";
		// Stats
		prc.xehSubscribers 				= "#prc.cbAdminEntryPoint#.subscribers";
		// Login/Logout
		prc.xehDoLogout 				= "#prc.cbAdminEntryPoint#.security.doLogout";
		prc.xehLogin 					= "#prc.cbAdminEntryPoint#.security.login";

		// CK Editor Integration Handlers For usage with the Quick Post
		prc.xehCKFileBrowserURL			= "#prc.cbAdminEntryPoint#/ckfilebrowser/";
		prc.xehCKFileBrowserURLImage	= "#prc.cbAdminEntryPoint#/ckfilebrowser/";
		prc.xehCKFileBrowserURLFlash	= "#prc.cbAdminEntryPoint#/ckfilebrowser/";

		// Search global
		prc.xehSearchGlobal 			= "#prc.cbAdminEntryPoint#.content.search";

		// Prepare Admin Actions
		prc.xehAdminActionData 			= [
			{ name="Clear RSS Caches",          value="rss-purge" },
			{ name="Clear Content Caches",      value="content-purge" },
			{ name="Reload Application",        value="app" },
			{ name="Reload ORM",                value="orm" },
			{ name="Reload Admin Module",       value="contentbox-admin" },
			{ name="Reload FileBrowser Module", value="contentbox-filebrowser" },
			{ name="Reload Security Module",    value="contentbox-security" },
			{ name="Reload Site Module",        value="contentbox-ui" }
		];
		prc.xehAdminAction				= "#prc.cbAdminEntryPoint#.dashboard.reload";
		// Installer Check
		prc.installerCheck 				= settingService.isInstallationPresent();
	}
}
