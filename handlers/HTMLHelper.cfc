
<cfcomponent hint="A cool utility that helps you when working with HTML, from creating doc types, to managing your js/css assets, to rendering tables and lists from data"
			 output="false"
			 extends="coldbox.system.core.dynamic.HTMLHelper"
			 singleton>

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->

	<cffunction name="init" access="public" returntype="HTMLHelper" output="false">
		<!--- ************************************************************* --->
		<cfargument name="controller" type="any" required="true" hint="coldbox.system.web.Controller">
		<!--- ************************************************************* --->
		<cfscript>
			super.Init(arguments.controller);

			var settingService = controller.getWireBox().getInstance("settingService@cb");
			var formBuilderSettings = settingService.findWhere({name="form_builder"});

			var fbSettings = deserializeJSON(formBuilderSettings.getValue());

			instance.defaultGroupWrapper = "#fbSettings.htmlHelper.groupWrapper#";
			instance.defaultGroupWrapperClass = "#fbSettings.htmlHelper.groupWrapperClass#";
			instance.defaultLabelWrapper = "#fbSettings.htmlHelper.labelWrapper#";
			instance.defaultLabelWrapperClass = "#fbSettings.htmlHelper.labelWrapperClass#";
			instance.defaultLabel = "#fbSettings.htmlHelper.label#";
			instance.defaultLabelClass = "#fbSettings.htmlHelper.labelClass#";
			instance.defaultWrapper = "#fbSettings.htmlHelper.wrapper#";
			instance.defaultWrapperClass = "#fbSettings.htmlHelper.wrapperClass#";
			instance.defaultHelpWrapper = "#fbSettings.htmlHelper.helpWrapper#";
			instance.defaultHelpWrapperClass = "#fbSettings.htmlHelper.helpWrapperClass#";

			return this;
		</cfscript>
	</cffunction>

<!------------------------------------------- PUBLIC HELPER METHODS ------------------------------------------>

	<!--- textField --->
	<cffunction name="textField" access="public" returntype="any" output="false" hint="Render out a text field. Remember that any extra arguments are passed as tag attributes">
		<cfargument name="name"					type="string"	required="false" default="" hint="The name of the field"/>
		<cfargument name="value"				type="string"	required="false" default="" hint="The value of the field"/>
		<cfargument name="disabled"				type="boolean"	required="false" default="false" hint="Disabled"/>
		<cfargument name="readonly"				type="boolean"	required="false" default="false" hint="Readonly"/>
		<cfargument name="required"				type="boolean"	required="false" default="false" hint="Required"/>
		<cfargument name="help"					type="string"	required="false" default="" hint="The help text to display for the field"/>
		<cfargument name="bind"					type="any"		required="false" default="" hint="The entity binded to this control"/>
		<cfargument name="bindProperty"			type="any"		required="false" default="" hint="The property to use for the value, by convention we use the name attribute"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="label"				type="string"	required="false" default="#instance.defaultLabel#" hint="If passed we will prepend a label tag."/>
		<cfargument name="labelclass"			type="string"	required="false" default="#instance.defaultLabelClass#" hint="The class to assign to the label."/>
		<cfargument name="labelwrapper"			type="string"	required="false" default="#instance.defaultLabelWrapper#" hint="The wrapper tag to use around the label."/>
		<cfargument name="labelwrapperclass"	type="string"	required="false" default="#instance.defaultLabelWrapperClass#" hint="The class to assign to the label wrapper."/>
		<cfargument name="helpwrapper"			type="string"	required="false" default="#instance.defaultHelpWrapper#" hint="The wrapper tag to use around the help text.">
		<cfargument name="helpwrapperclass"		type="string"	required="false" default="#instance.defaultHelpWrapperClass#" hint="The class to assign to the help wrapper.">
		<cfargument name="groupwrapper"			type="string"	required="false" default="#instance.defaultGroupWrapper#" hint="The group wrapper tag to use around the whole works."/>
		<cfargument name="groupwrapperclass"	type="string"	required="false" default="#instance.defaultGroupWrapperClass#" hint="The class to assign to the group wrapper."/>

		<cfscript>
			arguments.type="text";
			return inputField(argumentCollection=arguments);
		</cfscript>
	</cffunction>

	<!--- passwordField --->
	<cffunction name="passwordField" access="public" returntype="any" output="false" hint="Render out a password field. Remember that any extra arguments are passed as tag attributes">
		<cfargument name="name"					type="string"	required="false" default="" hint="The name of the field"/>
		<cfargument name="value"				type="string"	required="false" default="" hint="The value of the field"/>
		<cfargument name="disabled"				type="boolean"	required="false" default="false" hint="Disabled"/>
		<cfargument name="readonly"				type="boolean"	required="false" default="false" hint="Readonly"/>
		<cfargument name="required"				type="boolean"	required="false" default="false" hint="Required"/>
		<cfargument name="help"					type="string"	required="false" default="" hint="The help text to display for the field"/>
		<cfargument name="bind" 				type="any"		required="false" default="" hint="The entity binded to this control"/>
		<cfargument name="bindProperty"			type="any"		required="false" default="" hint="The property to use for the value, by convention we use the name attribute"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="label"				type="string"	required="false" default="#instance.defaultLabel#" hint="If passed we will prepend a label tag."/>
		<cfargument name="labelclass"			type="string"	required="false" default="#instance.defaultLabelClass#" hint="The class to assign to the label."/>
		<cfargument name="labelwrapper"			type="string"	required="false" default="#instance.defaultLabelWrapper#" hint="The wrapper tag to use around the label."/>
		<cfargument name="labelwrapperclass"	type="string"	required="false" default="#instance.defaultLabelWrapperClass#" hint="The class to assign to the label wrapper."/>
		<cfargument name="helpwrapper"			type="string"	required="false" default="#instance.defaultHelpWrapper#" hint="The wrapper tag to use around the help text.">
		<cfargument name="helpwrapperclass"		type="string"	required="false" default="#instance.defaultHelpWrapperClass#" hint="The class to assign to the help wrapper.">
		<cfargument name="groupwrapper"			type="string"	required="false" default="#instance.defaultGroupWrapper#" hint="The group wrapper tag to use around the whole works."/>
		<cfargument name="groupwrapperclass"	type="string"	required="false" default="#instance.defaultGroupWrapperClass#" hint="The class to assign to the group wrapper."/>

		<cfscript>
			arguments.type="password";
			return inputField(argumentCollection=arguments);
		</cfscript>
	</cffunction>

	<!--- fileField --->
	<cffunction name="fileField" access="public" returntype="any" output="false" hint="Render out a file field. Remember that any extra arguments are passed as tag attributes">
		<cfargument name="name"					type="string"	required="false" default="" hint="The name of the field"/>
		<cfargument name="value"				type="string"	required="false" default="" hint="The value of the field"/>
		<cfargument name="disabled"				type="boolean"	required="false" default="false" hint="Disabled"/>
		<cfargument name="readonly"				type="boolean"	required="false" default="false" hint="Readonly"/>
		<cfargument name="required"				type="boolean"	required="false" default="false" hint="Required"/>
		<cfargument name="help"					type="string"	required="false" default="" hint="The help text to display for the field"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="label"				type="string"	required="false" default="#instance.defaultLabel#" hint="If passed we will prepend a label tag."/>
		<cfargument name="labelclass"			type="string"	required="false" default="#instance.defaultLabelClass#" hint="The class to assign to the label."/>
		<cfargument name="labelwrapper"			type="string"	required="false" default="#instance.defaultLabelWrapper#" hint="The wrapper tag to use around the label."/>
		<cfargument name="labelwrapperclass"	type="string"	required="false" default="#instance.defaultLabelWrapperClass#" hint="The class to assign to the label wrapper."/>
		<cfargument name="helpwrapper"			type="string"	required="false" default="#instance.defaultHelpWrapper#" hint="The wrapper tag to use around the help text.">
		<cfargument name="helpwrapperclass"		type="string"	required="false" default="#instance.defaultHelpWrapperClass#" hint="The class to assign to the help wrapper.">
		<cfargument name="groupwrapper"			type="string"	required="false" default="#instance.defaultGroupWrapper#" hint="The group wrapper tag to use around the whole works."/>
		<cfargument name="groupwrapperclass"	type="string"	required="false" default="#instance.defaultGroupWrapperClass#" hint="The class to assign to the group wrapper."/>

		<cfscript>
			arguments.type="file";
			return inputField(argumentCollection=arguments);
		</cfscript>
	</cffunction>

	<!--- inputField --->
	<cffunction name="inputField" output="false" access="public" returntype="any" hint="Create an input field using some cool tags and features.	Any extra arguments are passed to the tag">
		<cfargument name="type"					type="string"	required="false" default="text" hint="The type of input field to create"/>
		<cfargument name="name"					type="string"	required="false" default="" hint="The name of the field"/>
		<cfargument name="value"				type="string"	required="false" default="" hint="The value of the field"/>
		<cfargument name="disabled"				type="boolean"	required="false" default="false" hint="Disabled"/>
		<cfargument name="checked"				type="boolean"	required="false" default="false" hint="Checked"/>
		<cfargument name="readonly"				type="boolean"	required="false" default="false" hint="Readonly"/>
		<cfargument name="required"				type="boolean"	required="false" default="false" hint="Required"/>
		<cfargument name="help"					type="string"	required="false" default="" hint="The help text to display for the field"/>
		<cfargument name="bind"					type="any"		required="false" default="" hint="The entity binded to this control"/>
		<cfargument name="bindProperty"			type="any"		required="false" default="" hint="The property to use for the value, by convention we use the name attribute"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="label"				type="string"	required="false" default="#instance.defaultLabel#" hint="If passed we will prepend a label tag."/>
		<cfargument name="labelclass"			type="string"	required="false" default="#instance.defaultLabelClass#" hint="The class to assign to the label."/>
		<cfargument name="labelwrapper"			type="string"	required="false" default="#instance.defaultLabelWrapper#" hint="The wrapper tag to use around the label."/>
		<cfargument name="labelwrapperclass"	type="string"	required="false" default="#instance.defaultLabelWrapperClass#" hint="The class to assign to the label wrapper."/>
		<cfargument name="helpwrapper"			type="string"	required="false" default="#instance.defaultHelpWrapper#" hint="The wrapper tag to use around the help text.">
		<cfargument name="helpwrapperclass"		type="string"	required="false" default="#instance.defaultHelpWrapperClass#" hint="The class to assign to the help wrapper.">
		<cfargument name="groupwrapper"			type="string"	required="false" default="#instance.defaultGroupWrapper#" hint="The group wrapper tag to use around the whole works."/>
		<cfargument name="groupwrapperclass"	type="string"	required="false" default="#instance.defaultGroupWrapperClass#" hint="The class to assign to the group wrapper."/>

		<cfscript>
			// super.inputField(argumentCollection=arguments);
			var buffer 		= createObject("java","java.lang.StringBuffer").init('');
			var excludeList = "label,help,wrapper,wrapperclass,labelclass,labelwrapper,labelwrapperclass,helpwrapper,helpwrapperclass,groupwrapper,groupwrapperclass,bind,bindproperty,help";

			// ID Normalization
			normalizeID(arguments);

			//group wrapper?
			if( len(arguments.groupwrapper) ) { wrapTag(buffer,arguments.groupwrapper,0,arguments.groupwrapperclass); }

			// label?
			if (arguments.type neq "checkbox" and arguments.type neq "radio") {
				if( len(arguments.label) and arguments.type neq "submit" ){ buffer.append( this.label(field=arguments.name,content=arguments.label,wrapper=arguments.labelWrapper,class=arguments.labelClass,wrapperclass=arguments.labelWrapperClass) ); }
			}

			//wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,0,arguments.wrapperclass); }

			// disabled fix
			if( arguments.disabled ){ arguments.disabled = "disabled"; }
			else{ arguments.disabled = ""; }
			// checked fix
			if( arguments.checked ){ arguments.checked = "checked"; }
			else{ arguments.checked = ""; }
			// readonly fix
			if( arguments.readonly ){ arguments.readonly = "readonly"; }
			else{ arguments.readonly = ""; }
			// required fix
			if( arguments.required ){ arguments.required = "required"; }
			else{ arguments.required = ""; }

			// binding?
			bindValue(arguments);

			// create input element
			buffer.append("<input");
			flattenAttributes(arguments,excludeList,buffer).append(" />");

			if (arguments.type eq "checkbox" or arguments.type eq "radio") {
				if( len(arguments.label) and arguments.type neq "submit" ){ buffer.append( this.label(field=arguments.name,content=arguments.label,wrapper=arguments.labelWrapper,class=arguments.labelClass,wrapperclass=arguments.labelWrapperClass) ); }
			}

			//help text?
			if( len(arguments.help) ){ buffer.append( this.help(content=arguments.help,wrapper=arguments.helpWrapper,wrapperclass=arguments.helpWrapperClass) ); }

			//wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,1); }

			//group wrapper?
			if( len(arguments.groupwrapper) ) { wrapTag(buffer,arguments.groupwrapper,1); }

			return buffer.toString();
		</cfscript>
	</cffunction>

	<!--- textArea --->
	<cffunction name="textArea" access="public" returntype="any" output="false" hint="Render out a textarea. Remember that any extra arguments are passed as tag attributes">
		<cfargument name="name"					type="string" 	required="false" default="" hint="The name of the textarea"/>
		<cfargument name="cols"					type="numeric" 	required="false" hint="The number of columns"/>
		<cfargument name="rows"					type="numeric" 	required="false" hint="The number of rows"/>
		<cfargument name="value"				type="string"	required="false" default="" hint="The value of the textarea"/>
		<cfargument name="disabled"				type="boolean" 	required="false" default="false" hint="Disabled"/>
		<cfargument name="readonly"				type="boolean" 	required="false" default="false" hint="Readonly"/>
		<cfargument name="required"				type="boolean"	required="false" default="false" hint="Required"/>
		<cfargument name="help"					type="string"	required="false" default="" hint="The help text to display for the textarea"/>
		<cfargument name="bind"					type="any" 		required="false" default="" hint="The entity binded to this control, the value comes by convention from the name attribute"/>
		<cfargument name="bindProperty"			type="any" 		required="false" default="" hint="The property to use for the value, by convention we use the name attribute"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="label"				type="string"	required="false" default="#instance.defaultLabel#" hint="If passed we will prepend a label tag."/>
		<cfargument name="labelclass"			type="string"	required="false" default="#instance.defaultLabelClass#" hint="The class to assign to the label."/>
		<cfargument name="labelwrapper"			type="string"	required="false" default="#instance.defaultLabelWrapper#" hint="The wrapper tag to use around the label."/>
		<cfargument name="labelwrapperclass"	type="string"	required="false" default="#instance.defaultLabelWrapperClass#" hint="The class to assign to the label wrapper."/>
		<cfargument name="helpwrapper"			type="string"	required="false" default="#instance.defaultHelpWrapper#" hint="The wrapper tag to use around the help text.">
		<cfargument name="helpwrapperclass"		type="string"	required="false" default="#instance.defaultHelpWrapperClass#" hint="The class to assign to the help wrapper.">
		<cfargument name="groupwrapper"			type="string"	required="false" default="#instance.defaultGroupWrapper#" hint="The group wrapper tag to use around the whole works."/>
		<cfargument name="groupwrapperclass"	type="string"	required="false" default="#instance.defaultGroupWrapperClass#" hint="The class to assign to the group wrapper."/>

		<cfscript>
			var buffer = createObject("java","java.lang.StringBuffer").init('');
			var excludeList = "value,label,help,wrapper,wrapperclass,labelclass,labelwrapper,labelwrapperclass,helpwrapper,helpwrapperclass,groupwrapper,groupwrapperclass,bind,bindproperty";

			// ID normalization
			normalizeID(arguments);

			//group wrapper?
			if( len(arguments.groupwrapper) ) { wrapTag(buffer,arguments.groupwrapper,0,arguments.groupwrapperclass); }

			// label?
			if( len(arguments.label) ){ buffer.append( this.label(field=arguments.name,content=arguments.label,wrapper=arguments.labelWrapper,class=arguments.labelClass,wrapperclass=arguments.labelWrapperClass) ); }

			//wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,0,arguments.wrapperclass); }

			// disabled fix
			if( arguments.disabled ){ arguments.disabled = "disabled"; }
			else{ arguments.disabled = ""; }
			// readonly fix
			if( arguments.readonly ){ arguments.readonly = "readonly"; }
			else{ arguments.readonly = ""; }
			// required fix
			if( arguments.required ){ arguments.required = "required"; }
			else{ arguments.required = ""; }

			// entity binding?
			bindValue(arguments);

			// create textarea
			buffer.append("<textarea");
			flattenAttributes(arguments,excludeList,buffer).append(">#arguments.value#</textarea>");

			//help text?
			if( len(arguments.help) ){ buffer.append( this.help(content=arguments.help,wrapper=arguments.helpWrapper,wrapperclass=arguments.helpWrapperClass) ); }

			//wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,1); }

			//group wrapper?
			if( len(arguments.groupwrapper) ) { wrapTag(buffer,arguments.groupwrapper,1); }

			return buffer.toString();
		</cfscript>
	</cffunction>

	<!--- select --->
	<cffunction name="select" access="public" returntype="any" output="false" hint="Render out a select tag. Remember that any extra arguments are passed as tag attributes">
		<cfargument name="name"					type="string" 	required="false" default="" hint="The name of the field"/>
		<cfargument name="options"				type="any"		required="false" default="" hint="The value for the options, usually by calling our options() method"/>
		<!--- option arguments --->
		<cfargument name="column"				type="string" 	required="false" default=""	hint="If using a query or array of objects the column to display as value and name"/>
		<cfargument name="nameColumn"			type="string" 	required="false" default=""	hint="If using a query or array of objects, the name column to display, if not passed defaults to the value column"/>
		<cfargument name="selectedIndex"		type="numeric" 	required="false" default="0" hint="selected index"/>
		<cfargument name="selectedValue"		type="string" 	required="false" default="" hint="selected value if any"/>
		<cfargument name="bind"					type="any" 		required="false" default="" hint="The entity binded to this control"/>
		<cfargument name="bindProperty"			type="any" 		required="false" default="" hint="The property to use for the value, by convention we use the name attribute"/>
		<!--- html arguments --->
		<cfargument name="disabled"				type="boolean" 	required="false" default="false" hint="Disabled button or not?"/>
		<cfargument name="multiple"				type="boolean" 	required="false" default="false" hint="multiple button or not?"/>
		<cfargument name="help"					type="string"	required="false" default="" hint="The help text to display for the textarea"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="label"				type="string"	required="false" default="#instance.defaultLabel#" hint="If passed we will prepend a label tag."/>
		<cfargument name="labelclass"			type="string"	required="false" default="#instance.defaultLabelClass#" hint="The class to assign to the label."/>
		<cfargument name="labelwrapper"			type="string"	required="false" default="#instance.defaultLabelWrapper#" hint="The wrapper tag to use around the label."/>
		<cfargument name="labelwrapperclass"	type="string"	required="false" default="#instance.defaultLabelWrapperClass#" hint="The class to assign to the label wrapper."/>
		<cfargument name="helpwrapper"			type="string"	required="false" default="#instance.defaultHelpWrapper#" hint="The wrapper tag to use around the help text.">
		<cfargument name="helpwrapperclass"		type="string"	required="false" default="#instance.defaultHelpWrapperClass#" hint="The class to assign to the help wrapper.">
		<cfargument name="groupwrapper"			type="string"	required="false" default="#instance.defaultGroupWrapper#" hint="The group wrapper tag to use around the whole works."/>
		<cfargument name="groupwrapperclass"	type="string"	required="false" default="#instance.defaultGroupWrapperClass#" hint="The class to assign to the group wrapper."/>

		<cfscript>
			var buffer = createObject("java","java.lang.StringBuffer").init('');
			var excludeList = "options,column,nameColumn,selectedIndex,selectedValue,bind,bindProperty,help,wrapper,wrapperclass,labelclass,labelwrapper,labelwrapperclass,helpwrapper,helpwrapperclass,groupwrapper,groupwrapperclass";

			// ID Normalization
			normalizeID(arguments);

			//group wrapper?
			if( len(arguments.groupwrapper) ) { wrapTag(buffer,arguments.groupwrapper,0,arguments.groupwrapperclass); }

			// label?
			if( len(arguments.label) ){ buffer.append( this.label(field=arguments.name,content=arguments.label,wrapper=arguments.labelWrapper,class=arguments.labelClass,wrapperclass=arguments.labelWrapperClass) ); }

			//wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,0,arguments.wrapperclass); }

			// disabled fix
			if( arguments.disabled ){ arguments.disabled = "disabled"; }
			else{ arguments.disabled = ""; }
			// multiple fix
			if( arguments.multiple ){ arguments.multiple = "multiple"; }
			else{ arguments.multiple = ""; }

			// create select
			buffer.append("<select");
			flattenAttributes(arguments,excludeList,buffer).append(">");

			// binding of option
			bindValue(arguments);
			if( structKeyExists(arguments,"value") AND len(arguments.value) ){
				arguments.selectedValue = arguments.value;
			}

			// options, are they inflatted already or do we inflate
			if( isSimpleValue(arguments.options) AND findnocase("</option>",arguments.options) ){
				buffer.append( arguments.options );
			}
			else{
				buffer.append( this.options(arguments.options,arguments.column,arguments.nameColumn,arguments.selectedIndex,arguments.selectedValue) );
			}

			// finalize select
			buffer.append("</select>");

			//help text?
			if( len(arguments.help) ){ buffer.append( this.help(content=arguments.help,wrapper=arguments.helpWrapper,wrapperclass=arguments.helpWrapperClass) ); }

			//wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,1); }

			//group wrapper?
			if( len(arguments.groupwrapper) ) { wrapTag(buffer,arguments.groupwrapper,1); }

			return buffer.toString();
		</cfscript>
	</cffunction>

	<!--- checkBox --->
	<cffunction name="checkBox" access="public" returntype="any" output="false" hint="Render out a checkbox. Remember that any extra arguments are passed as tag attributes">
		<cfargument name="name"					type="string"	required="false" default="" hint="The name of the field"/>
		<cfargument name="value"				type="string"	required="false" default="true" hint="The value of the field, defaults to true"/>
		<cfargument name="disabled"				type="boolean"	required="false" default="false" hint="Disabled"/>
		<cfargument name="checked"				type="boolean"	required="false" default="false" hint="Checked"/>
		<cfargument name="required"				type="boolean"	required="false" default="false" hint="Required"/>
		<cfargument name="help"					type="string"	required="false" default="" hint="The help text to display for the textarea"/>
		<cfargument name="bind"					type="any"		required="false" default="" hint="The entity binded to this control"/>
		<cfargument name="bindProperty"			type="any"		required="false" default="" hint="The property to use for the value, by convention we use the name attribute"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="label"				type="string"	required="false" default="#instance.defaultLabel#" hint="If passed we will prepend a label tag."/>
		<cfargument name="labelclass"			type="string"	required="false" default="#instance.defaultLabelClass#" hint="The class to assign to the label."/>
		<cfargument name="labelwrapper"			type="string"	required="false" default="#instance.defaultLabelWrapper#" hint="The wrapper tag to use around the label."/>
		<cfargument name="labelwrapperclass"	type="string"	required="false" default="#instance.defaultLabelWrapperClass#" hint="The class to assign to the label wrapper."/>
		<cfargument name="helpwrapper"			type="string"	required="false" default="#instance.defaultHelpWrapper#" hint="The wrapper tag to use around the help text.">
		<cfargument name="helpwrapperclass"		type="string"	required="false" default="#instance.defaultHelpWrapperClass#" hint="The class to assign to the help wrapper.">
		<cfargument name="groupwrapper"			type="string"	required="false" default="#instance.defaultGroupWrapper#" hint="The group wrapper tag to use around the whole works."/>
		<cfargument name="groupwrapperclass"	type="string"	required="false" default="#instance.defaultGroupWrapperClass#" hint="The class to assign to the group wrapper."/>

		<cfscript>
			arguments.type="checkbox";
			return inputField(argumentCollection=arguments);
		</cfscript>
	</cffunction>

	<!--- radioButton --->
	<cffunction name="radioButton" access="public" returntype="any" output="false" hint="Render out a radio button. Remember that any extra arguments are passed as tag attributes">
		<cfargument name="name" 				type="string"	required="false" default="" hint="The name of the field"/>
		<cfargument name="value" 				type="string"	required="false" default="true" hint="The value of the field, defaults to true"/>
		<cfargument name="disabled" 			type="boolean"	required="false" default="false" hint="Disabled"/>
		<cfargument name="checked" 				type="boolean"	required="false" default="false" hint="Checked"/>
		<cfargument name="bind" 				type="any" 		required="false" default="" hint="The entity binded to this control"/>
		<cfargument name="bindProperty" 		type="any" 		required="false" default="" hint="The property to use for the value, by convention we use the name attribute"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="label"				type="string"	required="false" default="#instance.defaultLabel#" hint="If passed we will prepend a label tag."/>
		<cfargument name="labelclass"			type="string"	required="false" default="#instance.defaultLabelClass#" hint="The class to assign to the label."/>
		<cfargument name="labelwrapper"			type="string"	required="false" default="#instance.defaultLabelWrapper#" hint="The wrapper tag to use around the label."/>
		<cfargument name="labelwrapperclass"	type="string"	required="false" default="#instance.defaultLabelWrapperClass#" hint="The class to assign to the label wrapper."/>
		<cfargument name="helpwrapper"			type="string"	required="false" default="#instance.defaultHelpWrapper#" hint="The wrapper tag to use around the help text.">
		<cfargument name="helpwrapperclass"		type="string"	required="false" default="#instance.defaultHelpWrapperClass#" hint="The class to assign to the help wrapper.">
		<cfargument name="groupwrapper"			type="string"	required="false" default="#instance.defaultGroupWrapper#" hint="The group wrapper tag to use around the whole works."/>
		<cfargument name="groupwrapperclass"	type="string"	required="false" default="#instance.defaultGroupWrapperClass#" hint="The class to assign to the group wrapper."/>

		<cfscript>
			arguments.type="radio";
			return inputField(argumentCollection=arguments);
		</cfscript>
	</cffunction>

	<!--- options --->
	<cffunction name="chooseGroupOptions" access="public" returntype="any" output="false" hint="Render out options. Remember that any extra arguments are passed as tag attributes">
		<cfargument name="values" 			type="any"		required="false" hint="The values array, list, or query to build options for"/>
		<cfargument name="column" 			type="any" 		required="false" default=""	hint="If using a query or array of objects the column to display as value and name"/>
		<cfargument name="nameColumn" 		type="any" 		required="false" default=""	hint="If using a query or array of objects, the name column to display, if not passed defaults to the value column"/>
		<cfargument name="selectedIndex" 	type="any" 		required="false" default="0" hint="selected index(s) if any. So either one or a list of indexes"/>
		<cfargument name="selectedValue" 	type="any" 		required="false" default=""	hint="selected value(s) if any. So either one or a list of values"/>
		<cfargument name="name"				type="string"	required="false" default=""	hint="The name of the field"/>
		<cfargument name="selectedColumn"	type="string"	required="false" default=""	hint="The name of the field used to determine selected status"/>
		<cfargument name="type" 			type="string"	required="false" default="radio" hint="The type of element we are rendering (checkbox or radio)"/>
		<cfscript>
			var buffer 		= createObject("java","java.lang.StringBuffer").init('');
			var val 		= "";
			var nameVal		= "";
			var selectedVal = false;
			var x	 		= 1;
			var qColumns 	= "";
			var thisName	= "";
			var thisValue	= "";
			var thisSelected = "";

			// check if an array? So we can do array of objects check
			if( isArray(arguments.values) AND arrayLen(arguments.values) ){
				// Check first element for an object, if it is then convert to query
				if( isObject(arguments.values[1]) ){
					arguments.values = entityToQuery(arguments.values);
				}
			}
			// is this a simple value, if so, inflate it
			if( isSimpleValue(arguments.values) ){
				arguments.values = listToArray(arguments.values);
			}

			// setup local variables
			val 	= arguments.values;
			nameVal = arguments.values;

			// query normalization?
			if( isQuery(val) ){
				// check if column sent? Else select the first column
				if( NOT len(column) ){
					// select the first one
					qColumns = listToArray( arguments.values.columnList );
					arguments.column = qColumns[1];
				}

				// column for values
				val 	= getColumnArray(arguments.values,arguments.column);
				nameVal = val;
				// name column values
				if( len(arguments.nameColumn) ){
					nameVal = getColumnArray(arguments.values,arguments.nameColumn);
				}
				// selected column values
				if( len(arguments.selectedColumn) ){
					selectedVal = getColumnArray(arguments.values,arguments.selectedColumn);
				}
			}

			// values
			for(x=1; x lte arrayLen(val); x++){

				thisValue = val[x];
				thisName = nameVal[x];
				thisSelected = selectedVal[x];

				// struct normalizing
				if( isStruct( val[x] ) ){
					// Default
					thisName = thisValue;

					// check for value?
					if( structKeyExists(val[x], "value") ){ thisValue = val[x].value; }
					if( structKeyExists(val[x], "name") ){ thisName = val[x].name; }

					// Check if we have a column to use for the default value
					if( structKeyExists( val[x], arguments.column ) ){ thisValue = val[x][column]; }

					// Do we have name column
					if( len( arguments.nameColumn ) ){
						if( structKeyExists( val[x], arguments.nameColumn ) ){ thisName = val[x][nameColumn]; }
					}
					else{
						if( structKeyExists( val[x], arguments.column ) ){ thisName = val[x][column]; }
					}

				}

				// create option
				buffer.append('<label><input type="#arguments.type#" name="#arguments.name#" value="#thisValue#"');

				// selected
				if( listfindNoCase( arguments.selectedIndex, x ) ){
					buffer.append('checked"');
				}
				// selected value
				if( thisSelected ){
					buffer.append('checked');
				}else if( listfindNoCase( arguments.selectedValue, thisValue ) ){
					buffer.append('checked');
				}
				buffer.append("> #thisName#</label>");
			}

			return buffer.toString();
		</cfscript>
	</cffunction>

	<!--- radioGroup --->
	<cffunction name="chooseGroup" access="public" returntype="any" output="false" hint="Render out a radio or checkbox group.">
		<cfargument name="type"					type="string"	required="false"	default="radio"			hint="The name of the field"/>
		<!--- group properties --->
		<cfargument name="name"					type="string"	required="false"	default=""				hint="The name of the field"/>
		<cfargument name="disabled"				type="boolean"	required="false"	default="false"			hint="Disabled"/>
		<cfargument name="checked"				type="boolean"	required="false"	default="false"			hint="Checked"/>
		<cfargument name="readonly"				type="boolean"	required="false"	default="false"			hint="Readonly"/>
		<cfargument name="help"					type="string"	required="false"	default=""				hint="The help text to display for the field"/>
		<cfargument name="bind"					type="any"		required="false"	default=""				hint="The entity binded to this control"/>
		<cfargument name="bindProperty"			type="any"		required="false"	default=""				hint="The property to use for the value, by convention we use the name attribute"/>
		<!--- radio button options --->
		<cfargument name="options"				type="any"		required="false"	default=""				hint="The value for the options, usually by calling our radioGroupOptions() method"/>
		<cfargument name="column"				type="any"		required="false"	default="actualValue"	hint="If using a query or array of objects the column to display as value and name"/>
		<cfargument name="nameColumn"			type="any"		required="false"	default="displayValue"	hint="If using a query or array of objects, the name column to display, if not passed defaults to the value column"/>
		<cfargument name="selectedIndex" 		type="any"		required="false"	default="0"				hint="selected index(s) if any. So either one or a list of indexes"/>
		<cfargument name="selectedValue" 		type="any"		required="false"	default=""				hint="selected value(s) if any. So either one or a list of values"/>
		<cfargument name="selectedColumn"		type="string"	required="false"	default="isChecked"		hint="The name of the field used to determine selected status"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="label"				type="string"	required="false" default="#instance.defaultLabel#" hint="If passed we will prepend a label tag."/>
		<cfargument name="labelclass"			type="string"	required="false" default="#instance.defaultLabelClass#" hint="The class to assign to the label."/>
		<cfargument name="labelwrapper"			type="string"	required="false" default="#instance.defaultLabelWrapper#" hint="The wrapper tag to use around the label."/>
		<cfargument name="labelwrapperclass"	type="string"	required="false" default="#instance.defaultLabelWrapperClass#" hint="The class to assign to the label wrapper."/>
		<cfargument name="helpwrapper"			type="string"	required="false" default="#instance.defaultHelpWrapper#" hint="The wrapper tag to use around the help text.">
		<cfargument name="helpwrapperclass"		type="string"	required="false" default="#instance.defaultHelpWrapperClass#" hint="The class to assign to the help wrapper.">
		<cfargument name="groupwrapper"			type="string"	required="false" default="#instance.defaultGroupWrapper#" hint="The group wrapper tag to use around the whole works."/>
		<cfargument name="groupwrapperclass"	type="string"	required="false" default="#instance.defaultGroupWrapperClass#" hint="The class to assign to the group wrapper."/>

		<cfscript>
			var buffer 		= createObject("java","java.lang.StringBuffer").init('');

			// ID Normalization
			normalizeID(arguments);

			//group wrapper?
			if( len(arguments.groupwrapper) ) { wrapTag(buffer,arguments.groupwrapper,0,arguments.groupwrapperclass); }

			// label?
			if( len(arguments.label)){ buffer.append( this.label(field=arguments.name,content=arguments.label,wrapper=arguments.labelWrapper,class=arguments.labelClass,wrapperclass=arguments.labelWrapperClass) ); }

			//wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,0,arguments.wrapperclass); }

			// binding?
			bindValue(arguments);

			// options, are they inflatted already or do we inflate
			if( isSimpleValue(arguments.options) ){
				buffer.append( arguments.options );
			}
			else{
				buffer.append( this.chooseGroupOptions(arguments.options,arguments.column,arguments.nameColumn,arguments.selectedIndex,arguments.selectedValue,arguments.name,arguments.selectedColumn,arguments.type) );
			}

			//help text?
			if( len(arguments.help) ){ buffer.append( this.help(content=arguments.help,wrapper=arguments.helpWrapper,wrapperclass=arguments.helpWrapperClass) ); }

			//wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,1); }

			//group wrapper?
			if( len(arguments.groupwrapper) ) { wrapTag(buffer,arguments.groupwrapper,1); }

			return buffer.toString();
		</cfscript>
	</cffunction>

	<!--- submitButton --->
	<cffunction name="submitButton" access="public" returntype="any" output="false" hint="Render out a submit button. Remember that any extra arguments are passed as tag attributes">
		<cfargument name="name"					type="string"	required="false" default="" hint="The name of the field"/>
		<cfargument name="value"				type="string"	required="false" default="Submit" hint="The value of the field"/>
		<cfargument name="disabled"				type="boolean"	required="false" default="false" hint="Disabled"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="groupwrapper"			type="string"	required="false" default="#instance.defaultGroupWrapper#" hint="The group wrapper tag to use around the whole works."/>
		<cfargument name="groupwrapperclass"	type="string"	required="false" default="#instance.defaultGroupWrapperClass#" hint="The class to assign to the group wrapper."/>
		<cfscript>
			arguments.type="submit";
			return inputField(argumentCollection=arguments);
		</cfscript>
	</cffunction>

	<!--- label --->
	<cffunction name="label" access="public" returntype="any" output="false" hint="Render a label tag. Remember that any extra arguments are passed as tag attributes">
		<cfargument name="field" 		type="string" required="true"	hint="The for who attribute"/>
		<cfargument name="content" 		type="string" required="false" default="" hint="The label content. If not passed the field is used"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">
		<cfargument name="label"				type="string"	required="false" default="#instance.defaultLabel#" hint="If passed we will prepend a label tag."/>
		<cfargument name="labelclass"			type="string"	required="false" default="#instance.defaultLabelClass#" hint="The class to assign to the label."/>

		<cfscript>
			var buffer = createObject("java","java.lang.StringBuffer").init('');

			// wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,0,arguments.wrapperclass); }

			// get content
			if( NOT len(content) ){ arguments.content = makePretty(arguments.field); }

			if( arguments.label == "label" ){
				arguments.for = arguments.field;
			}

			// create label tag
			if( len(arguments.label) ){
				buffer.append("<" & arguments.label);
				if( len(arguments.labelclass) ){ buffer.append(' class="' & arguments.labelClass & '"'); }
				flattenAttributes(arguments,"content,field,wrapper,label,labelclass",buffer).append(">#arguments.content#</" & arguments.label & ">");
			}

			//wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,1); }

			return buffer.toString();
		</cfscript>
	</cffunction>

	<!--- help --->
	<cffunction name="help" access="public" returntype="any" output="false" hint="Render the help text.">
		<cfargument name="content" 		type="string" required="false" default="" hint="The label content. If not passed the field is used"/>
		<!--- container/style arguments --->
		<cfargument name="wrapper"				type="string"	required="false" default="#instance.defaultWrapper#" hint="The wrapper tag to use around the tag.">
		<cfargument name="wrapperclass"			type="string"	required="false" default="#instance.defaultWrapperClass#" hint="The class to assign to the wrapper.">

		<cfscript>
			var buffer = createObject("java","java.lang.StringBuffer").init('');

			// wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,0,arguments.wrapperclass); }

			//write help text to buffer
			buffer.append(arguments.content);

			//wrapper?
			if( len(arguments.wrapper) ) { wrapTag(buffer,arguments.wrapper,1); }

			return buffer.toString();
		</cfscript>
	</cffunction>

	<!--- wrapTag --->
	<cffunction name="wrapTag" output="false" access="private" returntype="any">
		<cfargument name="buffer">
		<cfargument name="tag">
		<cfargument name="end" required="false" default="false">
		<cfargument name="tagclass" required="false" default="">
		<cfscript>
			var slash = "";
			if( len(arguments.tag) ){
				if( arguments.end ){ slash = "/"; }
				if( len(arguments.tagclass) ) {
					arguments.buffer.append("<#slash##arguments.tag# class='#arguments.tagclass#'>");
				} else {
					arguments.buffer.append("<#slash##arguments.tag#>");
				}
			}
		</cfscript>
	</cffunction>

	<cffunction name="getColumnArray" access="public" returntype="any" output="false" hint="Returns an array of the values">
		<cfargument name="qry"			type="query"	required="true" hint="cf query" />
		<cfargument name="ColumnName"	type="string"	required="true" hint="column name" />
		<cfscript>
			var arValues = arrayNew(1);
			var i = 0;

			if( arguments.qry.recordcount ){

			for( i = 1; i LTE arguments.qry.recordcount; i =i + 1 ){
				arrayAppend(arValues, arguments.qry[arguments.ColumnName][i]);
			}
		}
		return arValues;
	</cfscript>
	</cffunction>

</cfcomponent>
