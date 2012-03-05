/**
* A cool FieldOption entity
*/
component persistent="true" table="cb_formFieldOption"{

	// Primary Key
	property name="fieldOptionID" fieldtype="id" column="fieldOptionID" generator="identity" setter="false";

	// Properties
	property name="order" notnull="false" ormtype="integer" default="0" dbdefault="0";	property name="displayValue" notnull="true" length="2000" default="" index="idx_displayValue";
	property name="actualValue" notnull="true" length="2000" default="" index="idx_actualValue";
	property name="isChecked" notnull="true" ormtype="boolean" default="true" dbdefault="1" index="idx_isChecked";


	// M20 -> Form
	property name="field" notnull="true" cfc="contentbox-modules.contentbox-formbuilder.model.Field" fieldtype="many-to-one" fkcolumn="FK_fieldID" lazy="true" fetch="join";

	// Constructor
	function init(){

		return this;
	}


	/**
	* is loaded?
	*/
	boolean function isLoaded(){
		return len( getFieldOptionID() );
	}

	/*
	* Validate entry, returns an array of error or no messages
	*/
	array function validate(){
		var errors = [];

		// limits
		displayValue		= left(displayValue,2000);
		actualValue			= left(actualValue,2000);

		// Required
		if( !len(displayValue) ){ arrayAppend(errors, "Display Value is required"); }
		if( !len(actualValue) ){ arrayAppend(errors, "Actual Value is required"); }

		return errors;
	}


}
