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
	property name="form" notnull="true" cfc="contentbox.modules.contentbox-formbuilder.model.Form" fieldtype="many-to-one" fkcolumn="FK_formID" lazy="true" fetch="join";

	//DI
	property name="mailService"		inject="coldbox:plugin:MailService" persistent="false";
	property name="settingService"	inject="id:settingService@cb" persistent="false";
	property name="renderer"		inject="coldbox:plugin:Renderer" persistent="false";

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
			var subject = "New submission from the" & getForm().getName() & " form.";
			var settings = settingService.getAllSettings(asStruct=true);

			//build the body
			var body = getFormData();
			// Send it baby!
			var mail = mailservice.newMail(to=outEmails,
										   from=settings.cb_site_outgoingEmail,
										   subject=subject,
										   body=body,
										   type="html",
										   server=settings.cb_site_mail_server,
										   username=settings.cb_site_mail_username,
										   password=settings.cb_site_mail_password,
										   port=settings.cb_site_mail_smtp,
										   useTLS=settings.cb_site_mail_tls,
										   useSSL=settings.cb_site_mail_ssl);
			// generate content for email from template
			mail.setBody( renderer.renderView(view="viewlets/renderSubmission",module="contentbox-formbuilder") );
			// send it out
			mailService.send( mail );
		}
	}
}
