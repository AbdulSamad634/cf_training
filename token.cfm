<!DOCTYPE html>
 <html>
 <body>
 <cfoutput>

<!--- The user clicks the link in the email, which directs them to a password reset page. 
The token is passed in the URL. --->

    <cfparam name="url.token" default="">
    <cfif len(url.token)>
        <cfquery name="getUser" datasource="web_project">
            SELECT UserID, TokenExpiration FROM Users WHERE ResetToken = <cfqueryparam value="#url.token#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif getUser.recordCount EQ 1 AND now() LT getUser.TokenExpiration>
            <cflocation url="reset_password.cfm">
        <cfelse>
            <!-- Token is invalid or expired -->
        </cfif>
    </cfif>


</cfoutput>
</body>
