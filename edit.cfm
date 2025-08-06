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




        <cfquery name="check_user" datasource="web_project">

             select*
             from user_form


        </cfquery>

        <Cfdump var="#check_user#">





</cfoutput>
</body>
</html>