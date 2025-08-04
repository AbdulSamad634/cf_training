
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <link href=	"https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>Document</title>

<style>

.heading
{

        margin-top: 0;
        padding-top: 0;
background-color: black;
color: white;
font-size:small;
font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
text-align: center;
font-size: 400%;

}

p{

        margin-top: 0;
        padding-top: 0;
}

.button1
{

        
                 margin-bottom: 2%;
                 margin-top:10px;
                 margin-left: 10px;

}

.button2
{

        
                 margin-bottom: 2%;
                 margin-top:10px;
                 margin-left: 10px;

}

.button3
{

        
                 margin-bottom: 2%;
                 margin-top:10px;
                 margin-left: 10px;

}

</style>

</head>

<body>

<cfoutput>

<cfif isdefined("role")>

<cfquery name="Insert_user" datasource="my_office_ds" >

insert into user_form (fullname,email,role,username,passwrd)
values("#fullname#","#email#","#role#","#username#","#passwrd#");

</cfquery>

</cfif>



<cfif isdefined ("page_logout")>

    <cfset StructClear(Session)>

</cfif>  

<!--- <cfdump var="#session#" > --->

<!--- <cfif structKeyExists(session, "#session.auth.ID#") > --->

<cfif isdefined("session.auth.id")>

<cfif #session.auth.role# eq 'admin'>

<cflocation  url="admin_index.cfm" addtoken="no">

<cfelse>

<cflocation  url="member_index.cfm" addtoken="no">

</cfif>

</cfif>


  

        <div class="heading">

                <p>

                        Welcome


                </p>



        </div>

        <!--- <cfdump var = "#server.coldfusion.productversion#" > --->

         <div class="button1"> 
         <a href="sign_up.cfm"><button class="btn btn-dark ">Sign Up</button></a>

         </div>

         <div class="button2">

         <a href="admin_login.cfm"><button class="btn btn-dark ">Admin Log In</button></a>

         </div>

         <div class="button2">

         <a href="member_login.cfm"><button class="btn btn-dark ">Member Log In</button></a>

         </div>         



</cfoutput>
</body>
</html>
