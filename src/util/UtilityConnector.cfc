<cfcomponent output="false">

	<cffunction name="init" returntype="UtilityConnector" access="public" output="false">
		<cfreturn this/>
	</cffunction>

	<cffunction name="getLogFactory" returntype="MachII.logging.LogFactory" access="public" output="false">
		<cfreturn createObject("component", "MachII.logging.LogFactory").init()/>
	</cffunction>

	<cffunction name="getCacheStrategyManager" returntype="MachII.caching.CacheStrategyManager" access="public" output="false">
		<cfreturn createObject("component", "MachII.caching.CacheStrategyManager").init()/>
	</cffunction>

</cfcomponent>