/**
* A ColdBox enabled virtual entity service
*/
component extends="modules.contentbox.modules.contentbox-deps.modules.cborm.models.VirtualEntityService" singleton{

	//DI
	property name="antiSamy" inject="antisamy@cbantisamy";
	property name="captcha" inject="modules.contentbox.models.ui.Captcha";
	property name="settingService" 	inject="settingService@cb";
	/**
	* Constructor
	*/
	public FormSubmissionService function init(){

		// init super class
		super.init(entityName="FormSubmission");

		// Use Query Caching
		setUseQueryCaching( true );
		// Query Cache Region
		setQueryCacheRegion( 'FormBuilder' );
		// EventHandling
		setEventHandling( true );

		return this;
	}

	/**
	* Checks if ORM entities are setup correctly
	* returns {Boolean} whether  or not ORM entities are setup correctly
	*/
	public Boolean function isDataSetup() {
		try {
			var testData = EntityLoad( "Form" );
			return true;
		}
		catch( Any e ) {
			return false;
		}
	}

	/**
	* Validate incoming submission
	*/
	public array function validateSubmission(event,rc,prc){
		var errors = [];
		var oSettings = settingService.findWhere({name="form_builder"});
		var settings = deserializeJSON(oSettings.getValue());

		// Trim values & XSS Cleanup of fields
		//Loop through the form scope
		for (key in form) {
			rc[key] = antiSamy.htmlSanitizer( trim(form[key]) );
		}

		// Validate incoming data
		errors = [];

		// CAPTCHA validation
		if( event.valueExists("captchacode") ) {
			if (!captcha.validate( rc.captchacode )) {
				arrayAppend(errors, "Invalid security code. Please try again.");
			}
		} else if (structKeyExists(form, "g-recaptcha-response")) {
			var recaptcha = form["g-recaptcha-response"];

			if (len(recaptcha)) {
				var googleUrl = "https://www.google.com/recaptcha/api/siteverify";
				var ipaddr = cgi.remote_addr;
				var request_url = googleUrl & "?secret=" & settings.reCAPTCHA.privateKey & "&response=" & recaptcha & "&remoteip" & ipaddr;

				var httpService = new http(method="GET", charset="utf-8", url=request_url); 
				var apiCall = httpService.send().getPrefix();

				var response = deserializeJSON(apiCall.filecontent);

				if (!response.success) {
					arrayAppend(errors, "Invalid security code. Please try again.");
				}
			} else {
				arrayAppend(errors, "Invalid security code. Please try again.");
			}
		}

		return errors;
	}
}