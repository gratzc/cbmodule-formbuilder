/**
* I handle the form form events
*/
component extends="base" {

	// form editor
	function editor(event,rc,prc){
		// exit handlers
		prc.xehOptionSave 		= "cbFormBuilder.option.save";

		// get new or persisted option
		prc.option  = optionService.get( event.getValue("optionID",0) );
		if( !prc.option.isLoaded() ){
			oField = fieldService.get( event.getValue("fieldID",0) );
			prc.option.setField(oField);
		}

		// view
		event.setView("option/editor");
	}

	// save form
	function save(event,rc,prc){
		// get it and populateIt
		var oOption= populateModel( optionService.get(id=rc.fieldOptionID) );

		if( !oOption.isLoaded() ){
			oField = fieldService.get( event.getValue("fieldID",0) );
			oOption.setField(oField);
		}

		//TODO: make the item checked exclusive (turn the others off when turning this on)
		if ( !event.valueExists("isChecked") ) {
			oOption.setIsChecked(false);
		}

		// validate it
		var errors = oOption.validate();
		if( !arrayLen(errors) ){
			// save content
			optionService.save( oOption );
			// Message
			getInstance("messageBox@cbMessageBox").info("Option saved! Woot!");
		}
		else{
			getInstance("messageBox@cbMessageBox").warn(messageArray=errors);
		}

		// relocate back to editor
		relocate(event=prc.xehFieldEditor,queryString="fieldID=#rc.fieldID###options");
	}

	function remove(event,rc,prc){
		var oOption	= optionService.get( rc.optionID );

		if( isNull(oOption) ){
			getInstance("messageBox@cbMessageBox").setMessage("warning","Invalid option detected!");
			relocate(event=prc.xehFieldEditor,queryString="fieldID=#rc.fieldID###options");
		}
		// remove
		optionService.delete( oOption );
		// message
		getInstance("messageBox@cbMessageBox").setMessage("info","Option removed!");
		// redirect
		relocate(event=prc.xehFieldEditor,queryString="fieldID=#rc.fieldID###options");
	}

	// change order for all rules
	function changeOrder(event,rc,prc){
		rc.newOptionsOrder = urlDecode(rc.newOptionsOrder);
		rc.newOptionsOrder = ReplaceNoCase(rc.newOptionsOrder, "&options[]=", ",", "all");
		rc.newOptionsOrder = ReplaceNoCase(rc.newOptionsOrder, "options[]=", "", "all");
		for(var i=1;i lte listLen(rc.newOptionsOrder);i++) {
			optionID = listGetAt(rc.newOptionsOrder,i);
			var option = optionService.get(optionID);
			if( !isNull( option ) ){
				option.setOrder( i );
				optionService.save( option );
			}
		}
		event.renderData(type="json",data='true');
	}

}