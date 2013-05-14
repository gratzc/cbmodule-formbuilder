<!-----------------------------------------------------------------------
Author 	 :	Alagukannan Alagappan
Date     :  01/13/2011
Description :
 1) Get an public/private key from reCaptcha service for your site @  https://www.google.com/recaptcha/admin/create.
 2) Please add the following required settings to your module configuration file (ModuleConfig.cfc).
	reCaptcha.publicKey: public key got from reCaptcha
	reCaptcha.privateKey: private key got from reCaptcha
 3) place the reCaptcha.cfc plugin in the plugins directory and make sure the reCaptcha credentials are set for the service to work properly.

Further info on reCaptcha can be found @ http://www.google.com/recaptcha

Then just use the below methods:

Displays a RECAPTCHA image for form validation using the reCAPTCHA service http://www.google.com/recaptcha.
 The display(isSSL,theme,locale,tabIndex,message) method displays the recaptcha image. If the user is returning to the form from a failed captcha validation (using
validate method), an error message also appears under the image, which can be customized by the 'message' argument.
 The validate(recaptcha_challenge_field,recaptcha_response_field,remoteIP) method is used in the event that handles the form and takes as an argument the form field value from the
 request collection in which the user entered the RECAPTCHA code. It returns true if there is a match and false if not (and also
 sets a flag in the session scope to tell the plugin to display the error message if the user is redirected back to the form.)

This plugin is free to use and modify and is provided with NO WARRANTY of merchantability or fitness for a particular purpose.

Updates

----------------------------------------------------------------------->
<cfcomponent name="reCaptcha"
			 hint="plugin for reCaptcha functionality"
			 output="false"
			 singleton="true">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->
	<cfset variables.instance = structnew()>
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="controller" type="any" required="true" />
		<cfscript>
			setpluginName("reCaptcha");
			setpluginVersion("1.00");
			setpluginDescription("reCaptcha plugin for Coldbox");
			setSupportedThemes('red,white,blackglass,clean');
			setSupportedLocales('en,nl,fr,de,pt,ru,es,tr');
			//Return instance
			return this;
		</cfscript>
	</cffunction>

<!------------------------------------------- PUBLIC ------------------------------------------->

	<cffunction name="display" access="public" returntype="any" output="false" hint="I display the captcha and an error message, if appropriate">
		<cfargument name="isSSL"	type="boolean" default="false" hint="set to true to load recpatch via SSL">
		<cfargument name="theme" 	type="string"  default="red" hint="possible values include red,white,blackglass,clean" />
		<cfargument name="locale" 	type="string"  default="en" hint="locales supported by reCaptcha are en,nl,fr,de,pt,ru,es,tr" />
		<cfargument name="tabIndex" type="numeric" default="999" hint="any integer" />
		<cfargument name="message"  type="string"  default="Please enter the correct code shown in the graphic." hint="Message to display below captcha if validate method failed.">
		<cfargument name="publicKey" type="string" default="" hint="Your reCAPTCHA public key" />
		<cfset var ret = "" />
		<cfset var httpType = iif(arguments.isSSL,de('https'),de('http'))>
		<cfsavecontent variable="ret">
			<cfoutput>
			<script type="text/javascript">
				var RecaptchaOptions = {
				<cfif listfindnocase(getSupportedThemes(),arguments.theme) gt 0>
				theme : '#arguments.theme#',
				</cfif>
				<cfif listfindnocase(getSupportedLocales(),arguments.locale) gt 0>
				lang : '#arguments.locale#',
				</cfif>
				tabindex : #arguments.tabIndex#
			};
			</script>

			<script type="text/javascript"
				src="#httpType#://www.google.com/recaptcha/api/challenge?k=#arguments.publicKey#">
			</script>
			<noscript>
				<iframe src="#httpType#://www.google.com/recaptcha/api/noscript?k=#arguments.publicKey#" height="300" width="500" frameborder="0"></iframe><br>
				<textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
				<input type="hidden" name="recaptcha_response_field" value="manual_challenge">
			</noscript>
			<cfif not isValidated()>
				<br /><span class="cb_captchamessage"><cfoutput>#arguments.message#</cfoutput></span>
			</cfif>
			</cfoutput>
		</cfsavecontent>
		<!--- after it's decided whether to display the error message,
		clear the validation flag in case user just navigates to another page and comes back --->
		<cfset setValidated(true) />
		<cfreturn ret />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false" hint="I validate the passed in string against the recaptcha server">
		<cfargument name="recaptcha_challenge_field" 	type="string"  required="true" hint="takes the recaptcha_challenge_field form field value" />
		<cfargument name="recaptcha_response_field"  	type="string"  required="true" hint="takes the recaptcha_response_field form field response by the user"/>
		<cfargument name="remoteIP"  					type="string"  required="true" default="#cgi.REMOTE_ADDR#" hint="the client IP" />
		<cfargument name="privateKey"  					type="string"  default="" hint="Your reCAPTCHA private key" />
		<cfset var queryParams = structnew()>
		<cfset var result = false>

		<cfset queryParams.challenge = arguments.recaptcha_challenge_field>
		<cfset queryParams.response = arguments.recaptcha_response_field>
		<cfset queryParams.privateKey = arguments.privateKey>
		<cfset queryParams.remoteIP = arguments.remoteIP>

		<cfset result = $post(url='http://www.google.com/recaptcha/api/verify',queryParams= queryParams)>

		<cfif listfirst(result,chr(13)&chr(10)) eq 'true'>
			<cfset clearCaptcha() /><!--- delete the captcha struct --->
			<cfreturn true />
		<cfelse>
			<cfset setValidated(false) />
			<cfreturn isValidated() />
		</cfif>
	</cffunction>

	<cffunction name="getSupportedThemes" access="public" returntype="string" output="false">
		<cfreturn instance.themes />
	</cffunction>

	<cffunction name="getSupportedLocales" access="public" returntype="string" output="false">
		<cfreturn instance.locales />
	</cffunction>

<!------------------------------------------- PRIVATE ------------------------------------------->

	<cffunction name="setSupportedLocales" access="private" returntype="void" output="false">
		<cfargument name="locales" type="string" required="true" />
		<cfset instance.locales = arguments.locales />
	</cffunction>

	<cffunction name="setSupportedThemes" access="private" returntype="void" output="false">
		<cfargument name="themes" type="string" required="true" />
		<cfset instance.themes = arguments.themes />
	</cffunction>

	<cffunction name="getCaptchaStorage" access="private" returntype="any" output="false">
		<cfset var oSession = getPlugin("sessionstorage")>
		<cfset var captcha = structnew()>
		<cfset captcha.validated = true>

		<cfif not oSession.exists("cb_captcha")>
			<cfset oSession.setVar("cb_captcha",captcha)>
		</cfif>

		<cfreturn oSession.getVar("cb_captcha")>
	</cffunction>

	<cffunction name="setValidated" access="private" returntype="void" output="false">
		<cfargument name="validated" type="boolean" required="true" />
		<cfset getCaptchaStorage().validated = arguments.validated />
	</cffunction>

	<cffunction name="isValidated" access="private" returntype="boolean" output="false">
		<cfreturn getCaptchaStorage().validated />
	</cffunction>

	<cffunction name="clearCaptcha" access="private" returntype="void" output="false">
		<cfset getPlugin("sessionstorage").deleteVar("cb_captcha")>
	</cffunction>

	<cffunction name="$post" hint="posts data to an URL using CFHTTP and returns the filecontent" access="private" output="false" returntype="Any">
		<cfargument name="queryParams" 	   type="struct" required="true" hint="the search query parameters string for method" default="#structnew()#"  />
		<cfargument name="url"    		   type="string" required="true" hint="the gsaserver url to query"/>
		<cfargument name="method"		   type="string" required="true" hint="the http method to perform" default="post">

		<cfset var qresult = structnew()>
		<cfset var key = ''>

		<cfhttp
			url="#arguments.url#"
			method= "#arguments.method#"
			useragent="CFHTTP request"
			charset="utf-8"
			resolveurl="false"
			throwonerror="true"
			redirect="false"
			timeout="5"
			result="qresult">
			<cfloop collection="#arguments.queryParams#" item="key">
				<cfif len(queryParams[key]) gt 0>
					<cfhttpparam type="formfield" name="#lcase(key)#" value="#queryParams[key]#">
				</cfif>
			</cfloop>
		</cfhttp>

		<cfreturn qresult.filecontent />
	</cffunction>

</cfcomponent>