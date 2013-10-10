<cfcomponent output="false">

	<cffunction name="init" returntype="Log" access="public" output="false">
		<cfreturn this/>
	</cffunction>

	<cffunction name="_log" returntype="void" access="private" output="false">
		<cfargument name="level" type="string" required="true">
		<cfargument name="message" type="string" required="true"/>

		<cflog type="#arguments.level#" log="application" text="#arguments.message#"/>
	</cffunction>

	<cffunction name="onMissingMethod" returntype="any" access="public" output="false">
		<cfargument name="missingMethodName" type="string" required="true"/>
		<cfargument name="missingMethodArguments" type="struct" required="true"/>

		<cfif listFindNoCase("trace,debug,info,warn,error,fatal", arguments.missingMethodName)>
			<cfif structKeyExists(arguments.missingMethodArguments, "message")>
				<cfset _log(arguments.missingMethodName, arguments.missingMethodArguments.message)/>
			</cfif>
			<cfreturn/>
		<cfelseif listFindNoCase("isTraceEnabled,isDebugEnabled,isInfoEnabled,isWarnEnabled,isErrorEnabled,isFatalEnabled", arguments.missingMethodName)>
			<cfreturn false/>
		</cfif>
	</cffunction>

</cfcomponent>