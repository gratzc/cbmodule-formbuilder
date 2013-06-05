/**
* Field entity
*/
component persistent="true" table="cb_formField"{

	// Primary Key
	property name="fieldID" fieldtype="id" column="fieldID" generator="identity" setter="false";

	// Properties
	property name="fieldOrder" notnull="false" ormtype="integer" default="0" dbdefault="0";
	property name="name" notnull="true" length="200" default="" index="idx_name";
	property name="label" notnull="true" length="200" default="" index="idx_label";
	property name="typeID" notnull="false" ormtype="integer" default="0" dbdefault="0";
	property name="isRequired" notnull="true" ormtype="boolean" default="true" dbdefault="1" index="idx_isRequired";
	property name="maxLength" notnull="false" ormtype="integer" default="50" dbdefault="50";
	property name="helpText" notnull="false" length="2000" default="";
	property name="cssID" notnull="false" length="250" default="";
	property name="cssClass" notnull="false" length="250" default="";
	property name="defaultValue" notnull="true" length="2000" default="";

	// M2O -> Form
	property name="form" notnull="true" cfc="contentbox.modules.contentbox-formbuilder.model.Form" fieldtype="many-to-one" fkcolumn="FK_formID" lazy="true" fetch="join";

	// O2M -> FieldOptions
	property name="fieldOptions" singularName="fieldOption" fieldtype="one-to-many" type="array" lazy="extra" batchsize="25" orderby="order"
			  cfc="contentbox.modules.contentbox-formbuilder.model.FieldOption" fkcolumn="FK_fieldID" inverse="true" cascade="all-delete-orphan";

	//DI
	property name="TypeService"		inject="id:TypeService@cbFormBuilder" persistent=false;

	// Constructor
	function init(){

		return this;
	}

	/**
	* is loaded?
	*/
	boolean function isLoaded(){
		return len( getFieldID() );
	}


	/**
	* get the type name
	*/
	function getTypeName(){
		return TypeService.getNameByTypeID( getTypeID() );
	}

	/**
	* get the type view
	*/
	function getTypeView(){
		return TypeService.getViewByTypeID( getTypeID() );
	}

	/*
	* Validate entry, returns an array of error or no messages
	*/
	array function validate(){
		var errors = [];

		// limits
		name				= left(name,200);
		helpText			= left(helpText,2000);
		cssID				= left(cssID,250);
		cssClass			= left(cssClass,250);

		// Required
		if( !len(name) ){ arrayAppend(errors, "Name is required"); }

		return errors;
	}

}
