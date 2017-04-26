/**
* Defines and returns field types
*/
component singleton{

	TypeService function init(){

		return this;
	}

	array function getTypes() {
		var types = [
			{
				typeID="1",
				typeName="Text",
				showOptions="false",
				view="text"
			},
			{
				typeID="2",
				typeName="Text Area",
				showOptions="false",
				view="textarea"
			},
			{
				typeID="3",
				typeName="Select",
				showOptions="true",
				view="select"
			},
			{
				typeID="4",
				typeName="CheckBox",
				showOptions="false",
				view="checkbox"
			},
			{
				typeID="5",
				typeName="Radio",
				showOptions="true",
				view="radio"
			},
			{
				typeID="6",
				typeName="CheckBox Group",
				showOptions="true",
				view="checkboxgroup"
			}
		]
		return types;
	}

	function getNameByTypeID(required numeric typeID) {
		var types = getTypes();
		var typeName = '';

		for (var i = 1; i lte len(types); i++) {
			if (types[i].typeID eq arguments.typeID) {
				typeName = types[i].typeName;
			}
		}

		return typeName;
	}

	function getViewByTypeID(required numeric typeID) {
		var types = getTypes();
		var view = '';

		for (var i = 1; i lte len(types); i++) {
			if (types[i].typeID eq arguments.typeID) {
				view = types[i].view;
			}
		}

		return view;
	}

	function getShowOptionByTypeID(required numeric typeID) {
		var types = getTypes();
		var showOptions = false;

		for (var i = 1; i lte len(types); i++) {
			if (types[i].typeID eq arguments.typeID) {
				showOptions = types[i].showOptions;
			}
		}

		return showOptions;
	}

}
