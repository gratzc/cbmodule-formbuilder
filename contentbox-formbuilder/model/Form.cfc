/**
* Form entity
*/
component persistent="true" table="cb_form"{

	// Primary Key
	property name="formID" fieldtype="id" column="formID" generator="identity" setter="false";

	// Properties
	property name="slug" notnull="true" length="200" default="" unique="true" index="idx_slug";
	property name="name" notnull="true" length="200" default="" index="idx_name";
	property name="directions" notnull="false" length="2000" default="";
	property name="submitMessage" notnull="true" length="2000" default="";
	property name="emailTo" notnull="false" length="500" default="";
	property name="cssID" notnull="false" length="250" default="";
	property name="cssClass" notnull="false" length="250" default="";
	property name="useCaptcha" notnull="true" ormtype="boolean" default="true" dbdefault="1" index="idx_usecaptcha";
	property name="createdDate" notnull="true" ormtype="timestamp" update="false" index="idx_createdDate";

	// O2M -> Fields
	property name="fields" singularName="field" fieldtype="one-to-many" type="array" lazy="extra" batchsize="25" orderby="fieldOrder"
			  cfc="contentbox.modules.contentbox-formbuilder.model.Field" fkcolumn="FK_formID" inverse="true" cascade="all-delete-orphan";

	// O2M -> Submissions
	property name="submissions" singularName="submission" fieldtype="one-to-many" type="array" lazy="extra" batchsize="25" orderby="submissionDate DESC"
			  cfc="contentbox.modules.contentbox-formbuilder.model.FormSubmission" fkcolumn="FK_formID" inverse="true" cascade="all-delete-orphan";

	//Calculated Fields
	property name="numberOfSubmissions" formula="select count(*) from cb_formSubmission fs where fs.FK_formID=formID" default="0";

	// Constructor
	function init(){

		return this;
	}

	/**
	* is loaded?
	*/
	boolean function isLoaded(){
		return len( getFormID() );
	}

	/*
	* Validate entry, returns an array of error or no messages
	*/
	array function validate(){
		var errors = [];

		// limits
		name				= left(name,200);
		slug				= left(slug,200);
		directions			= left(directions,2000);
		submitMessage		= left(submitMessage,2000);
		emailTo				= left(emailTo,500);
		cssID				= left(cssID,250);
		cssClass			= left(cssClass,250);

		// Required
		if( !len(name) ){ arrayAppend(errors, "Name is required"); }
		if( !len(slug) ){ arrayAppend(errors, "Slug is required"); }
		if( !len(submitMessage) ){ arrayAppend(errors, "Submit Message is required"); }

		return errors;
	}
}
