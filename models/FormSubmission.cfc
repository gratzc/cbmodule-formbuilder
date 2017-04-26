/**
* Form Submission entity
*/
component persistent="true" table="cb_formSubmission"{

	// Primary Key
	property name="formSubmissionID" fieldtype="id" column="formSubmissionID" generator="identity" setter="false";

	// Properties
	property name="formData" notnull="false" length="8000" default="";
	property name="submissionIP" notnull="true" length="20" update="false" index="idx_submissionIP";
	property name="submissionDate" notnull="true" ormtype="timestamp" update="false" index="idx_submissionDate";

	// M2O -> Form
	property name="form" notnull="true" cfc="contentbox.modules_user.contentbox-formbuilder.models.Form" fieldtype="many-to-one" fkcolumn="FK_formID" lazy="true" fetch="join";

	//DI
	property name="mailService"		inject="mailService@cbmailservices" persistent="false";
	property name="settingService"	inject="id:settingService@cb" persistent="false";
	property name="renderer"		inject="coldbox:renderer" persistent="false";

	// Constructor
	function init(){

		return this;
	}

	/**
	* Send a submission email for the form
	*/
	public void function sendSubmissionEmails(){
		//if they was an email to set for the form then we need to send it
		if (!isNull(getForm().getEmailTo())) {
			//set some settings
			var outEmails = getForm().getEmailTo();
			var subject = "New submission from the " & getForm().getName() & " form.";
			var settings = settingService.getAllSettings(asStruct=true);

			//build the body
			var body = getFormData();
			// Create and populate the mail object
			var mailService = new mail(to=outEmails,
			                           from=settings.cb_site_outgoingEmail,
			                           subject=subject,
			                           body=body,
			                           type="html");
			// ContentBox mail settings
			if (settings.cb_site_mail_server neq "") { mailService.setServer(settings.cb_site_mail_server); }
			if (settings.cb_site_mail_username neq "") { mailService.setUsername(settings.cb_site_mail_username); }
			if (settings.cb_site_mail_password neq "") { mailService.setPassword(settings.cb_site_mail_password); }
			if (settings.cb_site_mail_smtp neq "") { mailService.setPort(settings.cb_site_mail_smtp); }
			if (settings.cb_site_mail_tls neq "") { mailService.setUseTLS(settings.cb_site_mail_tls); }
			if (settings.cb_site_mail_ssl neq "") { mailService.setUseSSL(settings.cb_site_mail_ssl); }
			// generate content for email from template
			mailService.setBody( renderer.renderView(view="viewlets/renderSubmission",module="contentbox-formbuilder") );
			// Send the mail
			mailService.send();
		}
	}
}
