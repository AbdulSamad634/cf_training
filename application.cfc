<cfcomponent
	displayname="Application"
	output="true"
	hint="Handle the application.">


	<!--- Set up the application. --->
	    <cfset THIS.Name = "AppCFC" />
	    <cfset THIS.ApplicationTimeout = CreateTimeSpan(0,0,60,0) />
        <cfset THIS.SessionManagement = true />
        <cfset this.scriptProtect = "No">
        <cfset This.SessionTimeOut =createTimespan(0,0,20,0) />
        <cfset this.clientManagement = "false">
	    <cfset THIS.SetClientCookies = false />



    <cffunction name="onApplicationStart" output="false" returnType="void">

        <!--- Set up Application variables. Locking the Application scope is not necessary in this method. --->
		<cfset Application.configured = 1>
		<cfset Application.datetimeConfigured = TimeFormat(Now(), "hh:mm tt") & "  " & DateFormat(Now(), "mm.dd.yyyy")>
		<cfset Application.currentSessions = 0>
        <!---

        <cfif session.auth.Username eq "" >
        this.defaultpage="menu.cfm"
        <cfelse>
        this.defaultpage="index.cfm"
        </cfif>

        --->
    </cffunction> 


      <cffunction name="clearSessionVariables" returntype="void">
      <!--- defined all session variables, so they will always exist ---->
      <cfset session.auth = structNew()>
      <cfset session.auth.isLoggedIn  = false>
      <cfset session.auth.ID  = "">
      <cfset session.auth.FullName   = "">
      <cfset session.auth.Email   = "">
      <cfset session.auth.Username    = "">
      <cfset session.auth.Passwrd    = "">
      <cfset session.auth.Role = "" >
      <cfset session.currentpage= "#CGI.SCRIPT_NAME#">
  
      </cffunction>
 
    <cffunction name="onSessionStart" returntype="void">
      <!--- define all session variables, so they will always exist ---->
      <cfset clearSessionVariables()>

    </cffunction>


<cffunction name="onRequestStart" returnType="boolean" output="false">
    <cfif structKeyExists(form, "doLogin") and isDefined("form.Username") and isDefined("form.Passwrd")>
        <cfif NOT checkLogin(form.Username, form.Passwrd)>
            <cfinclude template="index.cfm">
            <cfreturn false> <!-- Don't continue to page if login failed -->
        </cfif>
    </cfif>
    <cfreturn true>
</cffunction>

        
 <!--- begin function checkLogin ---> 
 <cffunction name="checkLogin">
    <cfargument name="p_Username" required=false default="" />
    <cfargument name="p_password" required=false default="" />
    <cfset var input_Password = trim(arguments.p_password)>
    <cfset var input_Username = trim(arguments.p_Username)>
    <cfif len(input_Password) eq 0>
         <cfthrow message="Please enter Password">
    <cfelseif len(input_Username) eq 0>
         <cfthrow message="Please enter Username">
    </cfif>
    <cfquery name="getUser" datasource="web_project">
        SELECT ID, FullName, email,role, Username, Passwrd
         FROM user_form
        WHERE Username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#input_Username#" maxlength="255"> 
    </cfquery>
    <cfif getuser.recordCount eq 0>
    <cfthrow message="Incorrect email address and/or password. Be sure to enter the correct, original email address with which you registered. Please type your password carefully.">
    </cfif>
    <!---
      <cfif getuser.recordCount eq 1>
    <cfthrow message="found correct email address and/or password.">
    </cfif>
    --->
    <cfset clearSessionVariables()>
    <cfset SESSION.auth.isLoggedIn = "Yes">
    <cfset SESSION.auth.ID     = getUser.ID>
    <cfset SESSION.auth.FullName  = getUser.fullName>
    <cfset SESSION.auth.Username  = getUser.Username>
    <cfset SESSION.auth.Email = getUser.Email>
    <cfset SESSION.auth.Role      = getUser.Role>
    <!--- Now that user is logged in, send her to web root --->
    <!--- <cfdump var="#session#" label="SESSION in checkLogin()"> --->
     <cfif Session.auth.Role eq 'admin' >
         <cflocation url="admin_index.cfm">
    <cfelse>   
        <cflocation url="member_index.cfm">
    </cfif>
    <cfreturn true>
</cffunction>
<!--- close function checkLogin --->

 <!--- begin function OnRequest ---> 
<cffunction name="onRequest" returnType="void" output="true">
    <!--- If not logged in and not on login page, redirect to login --->
    <cfif NOT structKeyExists(session, "auth") OR NOT session.auth.isLoggedIn>
        <cfif CGI.SCRIPT_NAME neq "/index.cfm">
            <cflocation url="index.cfm" addtoken="false">
        </cfif>
    </cfif>
    <!--- Only show header/footer if NOT login page --->
    <cfif CGI.SCRIPT_NAME neq "/index.cfm" AND structKeyExists(session, "auth") AND session.auth.isLoggedIn>
        <cfinclude template="header.cfm">
    </cfif>
    <cfinclude template="#CGI.SCRIPT_NAME#">
    <cfif CGI.SCRIPT_NAME neq "/index.cfm" AND structKeyExists(session, "auth") AND session.auth.isLoggedIn>
        <cfinclude template="footer.cfm">
    </cfif>
</cffunction>

<!--- close function OnRequest --->


<!--- My Earlier OnRequestStart Function

<!--- Pre-request processing ---> 
 <cffunction name="onRequestStart"  returnType="boolean" output="false" >

 <cfif isDefined("form.doLogin")>
    <cfoutput><h3>Form submitted:</h3></cfoutput>
    <cfdump var="#form#">
    <cfabort>
</cfif>
    <!--- Perform any necessary pre-request processing here --->
    <!---<cfset stringurl = CGI.SCRIPT_NAME>
    <cfset searchString = 'Employee_Portal'> --->
<!--- --->
   <cfif structKeyExists(session, 'auth')>
        <cfif structKeyExists(url, 'page_logout')>
            <!---  <cfset createObject("component", '\components.user_authentication').user_logout() /> --->
            <cflocation  url="index.cfm" addtoken='no'> 
            <cfabort> 
        </cfif>
        <cfif session.auth.role eq "admin" > <!--- and findNoCase(searchString, stringurl) eq 0> --->
            <cflocation  url="admin_index.cfm">
            <cfabort>
        </cfif>
        <cfif session.auth.role eq "member" >
            <cflocation url="member_index.cfm">
            <cfabort>
        </cfif>
    </cfif> 
    <!--- /process login credentials --->
    <cfargument type="String" name="targetPage" required="true" /> 
    <cfif isDefined("form.Username") and isDefined("form.Passwrd") and isDefined("form.doLogin")>
        <!--- user is attempting to log in, so process the login request ----> 
  
        <cfif NOT checkLogin(form.Username, form.Passwrd)> 
    
          <cflocation url="index.cfm" addtoken="false">
          <cfabort> <!--- login failed, so show login error form ----> 
          <cfreturn false>
          <cfelseif session.auth.role eq "admin">
            <cflocation url="admin_index.cfm" addtoken="false">
            <cfabort>
         <cfelseif session.auth.role eq "member">
            <cflocation url="member_index.cfm" addtoken="false">
            <cfabort>
     
          </cfif>

        <!--- close cfif isDefined("form.UserEmail") and isDefined("form.UserPassword") and isDefined("form.doLogin") ---> 
    </cfif>

</cffunction>



--->



<!--- close function checkLogin --->


<!---
<cffunction name="onRequestStart" returnType="boolean" output="true">
    <cfif structKeyExists(form, "doLogin")>
        <cfoutput><h2>Form Data</h2></cfoutput>
        <cfdump var="#form#">
        <cfabort>
    </cfif>
    <cfreturn true>
</cffunction>

--->
<!---

<cffunction name="onRequest" returnType="void" output="true">
    <cfargument name="targetPage" type="string" required="true">
    
    <!--- Skip footer/header when login page is being loaded --->
    <cfif listLast(arguments.targetPage, "/") neq "login.cfm">
        <cfinclude template="header.cfm">
    </cfif>

    <!--- Load requested page --->
    <cfinclude template="#arguments.targetPage#">

    <cfif listLast(arguments.targetPage, "/") neq "login.cfm">
        <cfinclude template="footer.cfm">
    </cfif>
</cffunction>
--->

<cffunction name="onRequest" returnType="void" output="true">


    <!--- If not logged in and not on login page, redirect to login --->
    <cfif NOT structKeyExists(session, "auth") OR NOT session.auth.isLoggedIn>
        <cfif CGI.SCRIPT_NAME neq "/index.cfm">
            <cflocation url="index.cfm" addtoken="false">
        </cfif>
    </cfif>

    <!--- Only show header/footer if NOT login page --->
    <cfif CGI.SCRIPT_NAME neq "/index.cfm" AND structKeyExists(session, "auth") AND session.auth.isLoggedIn>
        <cfinclude template="header.cfm">
    </cfif>

    <cfinclude template="#CGI.SCRIPT_NAME#">

    <cfif CGI.SCRIPT_NAME neq "/index.cfm" AND structKeyExists(session, "auth") AND session.auth.isLoggedIn>
        <cfinclude template="footer.cfm">
    </cfif>
</cffunction>




<!---

<cffunction name="onRequest" returnType="void" output="true">
<!---
<cfif not structKeyExists(session, 'auth.isloggedIn') and CGI.SCRIPT_NAME neq '/login.cfm'>
TRUE
            <cflocation  url="login.cfm" addtoken="false">
    <cfelse>
<!---     <cftransaction>      --->

        <cfif structKeyExists(session, 'auth')>
          <cfinclude  template="\header.cfm">
        </cfif>
        <cfinclude template="#CGI.SCRIPT_NAME#">
        <cfif structKeyExists(session, 'auth')>
          <cfinclude  template="\footer.cfm">

        </cfif>

        </cfif>

        --->

       <cfif not structKeyExists(session, 'auth.isloggedIn') and CGI.SCRIPT_NAME neq '/login.cfm'>
            <cflocation  url="login.cfm" addtoken="false" >
    </cfif>
<!---     <cftransaction>      --->
        <cfif structKeyExists(session, 'auth.isloggedIn')>
          <cfinclude  template="header.cfm">
        </cfif>
        <cfinclude template="#CGI.SCRIPT_NAME#">
        <cfif structKeyExists(session, 'auth.isloggedIn')>
          <cfinclude  template="footer.cfm">
        </cfif>
     

</cffunction>

--->


  <!--- Post-request processing --->
  <cffunction name="onRequestEnd" returnType="void" output="false">
    <!--- Perform any necessary post-request processing here --->
  </cffunction>
  <!--- Cleanup and finalization --->
  <cffunction name="onApplicationEnd" returnType="void" output="false">
    <!--- Perform any necessary cleanup or finalization tasks here --->
  </cffunction>
</cfcomponent>
