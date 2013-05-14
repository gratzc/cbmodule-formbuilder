<cfoutput>
<!--- Info Box --->
<div class="small_box">
	<div class="header">
		<img src="#prc.cbroot#/includes/images/settings.png" alt="info" width="24" height="24" />Actions
	</div>
	<div class="body">
		<!--- Forms --->
		<button class="button2" onclick="return to('#event.buildLink(prc.xehForms)#')">Forms</button>
		<button class="buttonred" onclick="return to('#event.buildLink('cbadmin.module.cbFormBuilder.settings.index')#')" title="Set global form settings">Settings</button>
	</div>
</div>
</cfoutput>