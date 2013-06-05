/**
* I handle the form form events
*/
component extends="base" {

	// form editor
	function editor(event,rc,prc){
		// exit handlers
		prc.xehFieldSave 		= "cbFormBuilder.field.save";

		// get new or persisted field
		prc.field  = fieldService.get( event.getValue("fieldID",0) );
		if( !prc.field.isLoaded() ){
			oForm = formService.get( event.getValue("formID",0) );
			prc.field.setForm(oForm);
			prc.field.setTypeID(rc.typeID);
		}

		fieldService.populate(prc.field,rc);

		prc.showOptions = typeService.getShowOptionByTypeID(prc.field.getTypeID());

		prc.Types = TypeService.getTypes();

		// viewlets
		prc.fieldOptionsViewlet = "";
		if( prc.field.isLoaded() ){
			var args = {fieldID=rc.fieldID};
			prc.fieldOptionsViewlet = runEvent(event="contentbox-formbuilder:field.options",eventArguments=args);
		}
	}

	// save form
	function save(event,rc,prc){
		// get it and populateIt
		var oField = populateModel( fieldService.get(id=rc.fieldID) );

		if( !oField.isLoaded() ){
			oForm = formService.get( event.getValue("formID",0) );
			oField.setForm(oForm);
		}

		if ( !len(oField.getLabel()) ){
			oField.setLabel(oField.getName());
		}

		if ( !event.valueExists("isRequired") ) {
			oField.setIsRequired(false);
		}

		// validate it
		var errors = oField.validate();
		if( !arrayLen(errors) ){
			// save content
			fieldService.save( oField );
			// Message
			getPlugin("MessageBox").info("Field saved! Woot!");
		} else {
			getPlugin("MessageBox").warn(messageArray=errors);
		}
		flash.persistRC(exclude="event");
		// relocate back to editor
		setNextEvent(event=prc.xehFormEditor,queryString="formID=#oField.getForm().getFormID()#/##formFields");
	}

	function remove(event,rc,prc){
		var oField	= fieldService.get( rc.fieldID );

		if( isNull(oField) ){
			getPlugin("MessageBox").setMessage("warning","Invalid Field detected!");
			setNextEvent( prc.xehFields );
		}
		// remove
		fieldService.delete( oField );
		// message
		getPlugin("MessageBox").setMessage("info","Field Removed!");

		// relocate back to editor
		setNextEvent(event=prc.xehFormEditor,queryString="formID=#rc.formID#/##formFields");
	}

	// change order for all rules
	function changeOrder(event,rc,prc){
		event.paramValue("newRulesOrder","");
		rc.newFieldsOrder = ReplaceNoCase(rc.newFieldsOrder, "&fields[]=", ",", "all");
		rc.newFieldsOrder = ReplaceNoCase(rc.newFieldsOrder, "fields[]=,", "", "all");
		for(var i=1;i lte listLen(rc.newFieldsOrder);i++) {
			fieldID = listGetAt(rc.newFieldsOrder,i);
			var field = fieldService.get(fieldID);
			if( !isNull( field ) ){
				field.setFieldOrder( i );
				fieldService.save( field );
			}
		}
		event.renderData(type="json",data='true');
	}

	function options(event,rc,prc,fieldID){
		//exit points
		prc.xehOptionRemove = "cbFormBuilder.option.remove";
		prc.xehOptionOrder = "cbFormBuilder.option.changeOrder";

		//current forms
		var oField = fieldService.get(arguments.fieldID);
		prc.options = oField.getFieldOptions();

		if (isNull(prc.options)) {
			prc.options = [];
		}

		//form form view
		return renderview(view="viewlets/fieldOptions",module="contentbox-formbuilder");
	}

}