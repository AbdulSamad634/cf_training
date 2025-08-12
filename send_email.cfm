<!DOCTYPE html>
 <html>
 <html>
 <body>
<cfoutput>

    <cfset my_email = #username#>
    <cfset token = createUUID()>
    <cfset expirationTime = dateAdd("h", 1, now())> <!-- Token valid for 1 hour -->

<cfquery name="get_ID" datasource="web_project">
select ID 
from member_users
where username="#username#" 
</cfquery>

<cfset ID=#get_ID.ID#>

<!--- An email is sent to the user containing a link to the password reset page, 
including the generated token as a URL parameter.
--->
<cfquery name="store_token" datasource="web_project">
    update member_users
    set token_id=#token#
    where ID=#ID# > 
</cfquery>

<cfmail to="my_email" from="se125@bjs-softsolution.com" subject="Your Order" type="html" port="2525" server="smtp.sendgrid.net" password="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">
  Hi there,
  This mail is sent so that you can reset your password.
  <cfinclude template="token.cfm?ID">
</cfmail>




</cfoutput>
</body>
</html>
