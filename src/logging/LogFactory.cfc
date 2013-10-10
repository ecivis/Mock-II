<cfcomponent output="false">

	<cffunction name="init" returntype="LogFactory" access="public" output="false">
		<cfreturn this/>
	</cffunction>

	<cffunction name="getLog" returntype="MachII.logging.Log" access="public" output="false">
		<cfargument name="channel" type="string" required="true"/>

		<cfreturn createObject("component", "MachII.logging.Log").init()/>
	</cffunction>

</cfcomponent>