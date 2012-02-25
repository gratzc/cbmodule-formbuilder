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
			typeID,typeName,showOptions
			1|Text|false
			2|Text Area|false
			3|Select|true
			4|CheckBox|false
			5|Radio|true
			6|CheckBox Group|true
		");
		return query;
	}

	function getNameByTypeID(required numeric typeID) {
		var types = getTypes();
		var qry = QueryHelperPlugin.filterQuery(types,"typeID",typeID,"CF_SQL_NUMERIC");
		return qry.typeName;
	}

	function getShowOptionByTypeID(required numeric typeID) {
		var types = getTypes();
		var qry = QueryHelperPlugin.filterQuery(types,"typeID",typeID,"CF_SQL_NUMERIC");
		return qry.showOptions;
	}

}
