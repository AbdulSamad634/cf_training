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

  </cffunction>

    <cffunction name="onSessionStart" returntype="void">
      <!--- define all session variables, so they will always exist ---->

  

      <cfset clearSessionVariables()>

    </cffunction>

    <cffunction name="onRequestStart">

     <cfargument type="String" name="targetPage" required="true" /> 

     <!--- All of these folders/top level files require a login, specific roles are addressed below ---->  

     <cfset var securefolders = "admin">  

     <cfset var currentFolder = listFirst(cgi.script_name,"/")>

     <cfif currentFolder contains ".">

        <cfset currentFolder = "root">

     </cfif> <!--- the user's current location ---->  


     <!--- process login credentials --->

     <!--- begin cfif isDefined("form.UserEmail") and isDefined("form.UserPassword") ---> 

     <cfif isDefined("form.Username") and isDefined("form.Passwrd") and isDefined("form.doLogin")>

        <!--- user is attempting to log in, so process the login request ----> 
        <cfif NOT checkLogin(form.Username, form.Passwrd)> 
           <cfinclude template="menu.cfm"> <!--- login failed, so show login error form ----> 
        <cfreturn false>  
           <!--- close cfif NOT checkLogin(form.UserEmail, form.UserPassword) ---> 
        <cfelse>
           <cfinclude template="index.cfm">
        </cfif> 
    <!--- close cfif isDefined("form.UserEmail") and isDefined("form.UserPassword") and isDefined("form.doLogin") ---> 

    </cfif> 
 
<!--- /process login credentials --->
    

   </cffunction>


        
<!--- begin function checkLogin --->
<cffunction name="checkLogin">

  <cfargument name="p_Username" required=false default="" />
  <cfargument name="p_passwrd" required=false default="" />

  <cfset var passwrd = trim(arguments.p_passwrd)>
  <cfset var Username     = trim(arguments.p_Username)>
  <cfset var getUser = "">

  <cftry>
      <cfif len(Passwrd) eq 0 or len(Username) eq 0>
         <cfthrow message="Please enter Email and Password">
      </cfif> 
    
      <cfquery name="getUser" datasource="my_office_ds">
       SELECT ID, FullName, email, Username, Passwrd
        FROM user_form
       WHERE Username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Username#" maxlength="255"> 
      </cfquery>
      <cfif getuser.recordCount eq 0>
        <cfthrow message="Incorrect email address and/or password. Be sure to enter the correct, original email address with which you registered. Please type your password carefully.">
      <cfelseif getUser.Passwrd is not Passwrd>
        <cfthrow message="Invalid Password.">
       </cfif>
    
      <cfset clearSessionVariables()>
      <cfset SESSION.auth.isLoggedIn = "Yes">
      <cfset SESSION.auth.ID     = getUser.ID>
      <cfset SESSION.auth.FullName  = getUser.fullName>
      <cfset SESSION.auth.Username  = getUser.Username>
      

 <!--- Now that user is logged in, send her to web root --->

 <cflocation url="index.cfm">

      
      <cfreturn true>
      
      
  <cfcatch>
      <cfset clearSessionVariables()>
    <cfreturn false>
  </cfcatch>
  </cftry>
    
</cffunction>
<!--- close function checkLogin --->


</cfcomponent>
