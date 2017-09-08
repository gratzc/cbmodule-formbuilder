<cfoutput>
	<cfset keysToDelete = ["_returnTo","formID","FIELDNAMES","g-recaptcha-response"] />
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