/**
* A ColdBox Enabled virtual entity service
*/
component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

	//DI
	property name="antiSamy" inject="coldbox:plugin:AntiSamy";
	property name="captcha" inject="coldbox:myplugin:Captcha@contentbox";

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
	* Validate incoming submission
	*/
	public array function validateSubmission(event,rc,prc){
		var errors = [];

		// Trim values & XSS Cleanup of fields
		//Loop through the form scope
		for (key in form) {
			rc[key] = antiSamy.htmlSanitizer( trim(form[key]) );
		}

		// Validate incoming data
		errors = [];

		// Captcha Validation
		if( event.valueExists("captchacode") && !captcha.validate( rc.captchacode ) ){
			ArrayAppend(errors, "Invalid security code. Please try again.");
		}

		return errors;
	}

}