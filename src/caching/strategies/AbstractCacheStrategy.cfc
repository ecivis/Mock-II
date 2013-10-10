<cfcomponent output="false">

	<cffunction name="init" returntype="AbstractCacheStrategy" access="public" output="false">
		<cfreturn this/>
	</cffunction>

	<cffunction name="put" returntype="void" access="public" output="false">
		<cfargument name="key" type="string" required="true"/>
		<cfargument name="data" type="any" required="true"/>
	</cffunction>

	<cffunction name="get" returntype="any" access="public" output="false">
		<cfargument name="key" type="string" required="true"/>

		<cfreturn ""/>
	</cffunction>

	<cffunction name="keyExists" returntype="boolean" access="public" output="false">
		<cfargument name="key" type="string" required="true"/>

		<cfreturn false/>
	</cffunction>

	<cffunction name="flush" returntype="void" access="public" output="false">
	</cffunction>

	<cffunction name="remove" returntype="void" access="public" output="false">
	</cffunction>

</cfcomponent>