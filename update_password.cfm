<!DOCTYPE html>
 <html>
 <body>
 <cfoutput>

<!--- The user clicks the link in the email, which directs them to a password reset page. 
The token is passed in the URL. --->

<cfquery name="update_password" datasource="web_project">
update member_users
set password="#new_password#"
where ID=#ID#
</cfquery>


</cfoutput>
</body>
