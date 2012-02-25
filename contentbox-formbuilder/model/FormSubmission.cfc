/**
* A cool Form Submission entity
*/
component persistent="true" table="cb_formSubmission"{

	// Primary Key
	property name="formSubmissionID" fieldtype="id" column="formSubmissionID" generator="identity" setter="false";

	// Properties
	property name="formData" notnull="false" length="8000" default="";
	property name="submissionIP" notnull="true" length="20" update="false" index="idx_submissionIP";
	property name="submissionDate" notnull="true" ormtype="timestamp" update="false" index="idx_submissionDate";


	// M20 -> Form
	property name="form" notnull="true" cfc="contentbox-root.modules.contentbox-formbuilder.model.Form" fieldtype="many-to-one" fkcolumn="FK_formID" lazy="true" fetch="join";

	// Constructor
	function init(){

		return this;
	}
}
