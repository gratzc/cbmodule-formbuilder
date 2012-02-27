<cfoutput>
	<cfset keysToDelete = ["_returnTo","formID","CAPTCHACODE","FIELDNAMES"] />
	<cfloop array="#keysToDelete#" index="key">
		<cfset structDelete(prc.formData,key) />
	</cfloop>
	<div id="form-submission" class="form-submission-container">
		<ul>
			<cfloop collection="#prc.formData#" item="key">
			<li>#key# : #prc.formData[key]#</li>
			</cfloop>
		</ul>
	</div>
</cfoutput>