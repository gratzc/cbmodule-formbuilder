/**
* Defines and returns field types
*/
component singleton{

	property name="QueryHelperPlugin" inject="coldbox:plugin:QueryHelper";

	TypeService function init(){

		return this;
	}

	query function getTypes() {
		var query = QueryHelperPlugin.querySim("
			typeID,typeName,showOptions,view
			1|Text|false|text
			2|Text Area|false|textarea
			3|Select|true|select
			4|CheckBox|false|checkbox
			5|Radio|true|radio
			6|CheckBox Group|true|checkboxgroup
		");
		return query;
	}

	function getNameByTypeID(required numeric typeID) {
		var types = getTypes();
		var qry = QueryHelperPlugin.filterQuery(types,"typeID",typeID,"CF_SQL_NUMERIC");
		return qry.typeName;
	}

	function getViewByTypeID(required numeric typeID) {
		var types = getTypes();
		var qry = QueryHelperPlugin.filterQuery(types,"typeID",typeID,"CF_SQL_NUMERIC");
		return qry.view;
	}

	function getShowOptionByTypeID(required numeric typeID) {
		var types = getTypes();
		var qry = QueryHelperPlugin.filterQuery(types,"typeID",typeID,"CF_SQL_NUMERIC");
		return qry.showOptions;
	}

}
