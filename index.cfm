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

<!--- <cfdump var="#session#"> --->

<cfif isdefined("session.auth.ID") >

<!---
<cfif isdefined ("username")>


        <cfquery name="check_user" datasource="my_office_ds">

             select*
             from user_form
             where username="#username#"

        </cfquery>

         <cfset session.client_fullName=check_user.Fullname>




HELLO #session.client_fullName#

        <cfquery name="check_user" datasource="my_office_ds">

             select*
             from user_form
             where username="#username#" AND passwrd="#passwrd#"

        </cfquery>

<cfif queryRecordCount(check_user) gte 1>

--->
        <div class="heading">

                <p>

                        Welcome to Office Management


                </p>



        </div>


        <!--- <cfdump var = "#server.coldfusion.productversion#" > --->

         <div class="button1"> 
         <a href="employee_form.cfm"><button class="btn btn-dark ">Add New Employee</button></a>

         </div>

         <div class="button2">

         <a href="employee_display.cfm"><button class="btn btn-dark ">Display Employees</button></a>

         </div>

         <div class="button3">

         <a href="allowance_form.cfm"><button class="btn btn-dark ">Add New Allowance</button></a>

         </div>


         <div class="button3">

         <a href="allowance_display.cfm"><button class="btn btn-dark ">Display Allowances</button></a>

         </div>

         <div class="button3">

         <a href="temp_employee_delete.cfm"><button class="btn btn-dark ">Recycle Bin</button></a>

         </div>

         
         <div class="button3">

         <a href="menu.cfm?page_logout=#1#"><button class="btn btn-dark ">Log Out</button></a>

         </div>

         <!---

         <cfajaximport tags="cfmessagebox">

         <cfform name="test">

         <cfinput type="button" name="x" value="Create Message Box"

         onClick="ColdFusion.MessageBox.create('Messagebox1', 'confirm','Confirm',

         'Do you want to save the file?',

         onfinish, {width:200, modal:false})">

         </cfform>

         <script language="JavaScript" type="text/javascript">

         function onfinish()


         {

          alert('Button clicked');

         };

        </script>

--->

<cfelse>

<cflocation  url="menu.cfm">
</cfif>


</cfoutput>
</body>
</html>