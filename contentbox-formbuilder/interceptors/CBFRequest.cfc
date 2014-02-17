/**
* I am a new interceptor
*/
component extends="contentbox-admin.interceptors.CBRequest" {

	void function configure(){}

	void function preProcess(event,struct interceptData) eventPattern="^contentbox-formbuilder"{
		super.preProcess(event,interceptData);
	}

}