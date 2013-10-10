<cfcomponent output="false">

	<cffunction name="init" returntype="CacheStrategyManager" access="public" output="false">
		<cfreturn this/>
	</cffunction>

	<cffunction name="getCacheStrategyByName" returntype="MachII.caching.strategies.AbstractCacheStrategy" access="public" output="false">
		<cfargument name="cacheStrategyName" type="string" required="true"/>

		<cfreturn createObject("component", "MachII.caching.strategies.AbstractCacheStrategy").init()/>
	</cffunction>

</cfcomponent>