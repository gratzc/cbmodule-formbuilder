/**
* A ColdBox enabled virtual entity service
*/
component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

	//DI
	property name="antiSamy" inject="coldbox:plugin:AntiSamy";
	property name="captcha" inject="coldbox:myplugin:Captcha@contentbox";
	property name="reCAPTCHA" inject="coldbox:myplugin:reCAPTCHA@contentbox-formbuilder";
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
		if(settings.CAPTCHAType eq "CF") {
			if( event.valueExists("captchacode") && !captcha.validate( rc.captchacode ) ){
				ArrayAppend(errors, "Invalid security code. Please try again.");
			}
		} else if(settings.CAPTCHAType eq "reCAPTCHA") {
			if( event.valueExists("recaptcha_response_field") && !reCAPTCHA.validate( rc.reCAPTCHA_challenge_field,rc.reCAPTCHA_response_field,cgi.REMOTE_ADDR,settings.reCAPTCHA.privateKey ) ){
				ArrayAppend(errors, "Invalid security code.  Please try again.");
			}
		}

		return errors;
	}

}