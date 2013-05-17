<cfoutput>
<!--- Info Box --->
<div class="small_box">
	<div class="header">
		<i class="icon-cogs"></i> Actions
	</div>
	<div class="body">
		<!--- Forms --->
		<button class="btn btn-danger" onclick="return to('#event.buildLink(prc.xehForms)#')">Forms</button>
		<button class="btn" onclick="return to('#event.buildLink('cbadmin.module.cbFormBuilder.settings.index')#')" title="Set global form settings">Settings</button>
	</div>
</div>
</cfoutput>