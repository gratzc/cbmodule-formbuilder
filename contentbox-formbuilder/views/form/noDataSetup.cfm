<cfoutput>
#renderView( "viewlets/assets" )#
<!--============================ Sidebar ============================-->
<div class="sidebar">
	<cfinclude template="../sidebar/actions.cfm" >
	<cfinclude template="../sidebar/help.cfm" >
	<cfinclude template="../sidebar/about.cfm" >
</div>

<!--============================Main Column============================-->
<div class="main_column">
	<div class="box">
		<br />
		<h3>&nbsp;No Form Builder tables found</h3>
		#getPlugin( "MessageBox" ).renderMessage( "warning", "There are no tables or data setup for Form Builder, please install them manually or switch your ORM setting to update in your application CFC and reload ORM" )#
	</div>
</div>
</cfoutput>