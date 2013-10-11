Mock-II
=======

If you use the Mach-II [Logging](https://github.com/Mach-II/Mach-II-Framework/wiki/Introduction-to-Logging) and [Caching](https://github.com/Mach-II/Mach-II-Framework/wiki/Introduction-to-Caching) packages in your model by injecting them using [ColdSpring](http://www.coldspringframework.org/) with the `MachII.util.UtilityConnector`, you may have had difficulty creating and running unit tests for your model components. This project is a collection of components that implement the minimum amount of code to mock dependencies when outside of a Mach-II application.

To use Mock-II, just copy the source files somewhere and create an application-specific mapping in the `Application.cfc` used in your unit testing environment. For example:

```cfm
<cfset this.mappings["/MachII"] = expandPath("/tests/MockII")/>
```

You can then get a bean reference from ColdSpring where it's loaded the mocked components as dependencies. The mock `Log.cfc` will return false for all tests such as `isDebugEnabled()` and simply write out any log messages received anyway to the CFML engine's application log file. The mock `AbstractCacheStrategy.cfc` returns false for any `keyExists()` call. The `put()` method does nothing. The `get()` method will return an empty string.

Test Automation
---------------

If you deploy unit tests via a build process and execute them automatically, which you should, you can unzip Mock-II on the fly by including the following into your `build.xml` file:

```xml
<property name="project.xfer" value="http://fileserver/project"/>
<property name="project.cache" location="cache"/>
<property name="webapp.path" location="/server/webapps/yourapp"/>

<property name="mockii.dist" value="mock-ii-0.0.zip"/>
<property name="mockii.hash" value="c6c627bd1fa701af1200889f27e192bc3f307cd3"/>

<target name="deploy-tests">
	<get src="${project.xfer}/${mockii.dist}" dest="${project.cache}/${mockii.dist}" skipexisting="true"/>
	<checksum file="${project.xfer}/${mockii.dist}" algorithm="sha1" property="${mockii.hash}" verifyproperty="valid"/>
	<fail message="The SHA hash for ${mockii.dist} does not match ${mockii.hash}.">
		<condition>
			<isfalse value="${valid}"/>
		</condition>
	</fail>
	<delete dir="${webapp.path}/tests/MockII"/>
	<mkdir dir="${webapp.path}/tests/MockII"/>
	<unzip src="${project.cache}/${mockii.dist}" dest="${webapp.path}/tests/MockII"/>
</target>
```

There is a simple `build.xml` in the Mock-II project root for generating the distribution archive by running `ant dist`. A version also available in the GitHub repository files, although the version and hashsum should be verified before including in your project's build.