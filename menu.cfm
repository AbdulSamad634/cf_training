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

<cfif isdefined ("page_logout")>

<cfset StructClear(Session)>

</cfif>


<!--- <cfdump var ="#session#" >
 --->
<!---
<cfif isdefined ("session.client_fullname")>


<cfscript>
    StructClear(Session);
</cfscript>

       <cflock timeout=20 scope="Session" type="Readonly"> 
         <cfoutput> #StructKeyList(Session)# </cfoutput> 
       </cflock>


--->
      
<!---
     <cfset session.username = #username# >
     <cfset session.password = #passwrd# >

--->

        <div class="heading">

                <p>

                        Welcome.


                </p>



        </div>

        <!--- <cfdump var = "#server.coldfusion.productversion#" > --->

         <div class="button1"> 
         <a href="sign_up.cfm"><button class="btn btn-dark ">Sign Up</button></a>

         </div>

         <div class="button2">

         <a href="login.cfm"><button class="btn btn-dark ">Log In</button></a>

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

</cfoutput>
</body>
</html>