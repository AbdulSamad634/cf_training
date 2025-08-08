

<!--- hello.cfm --->

<!DOCTYPE html>

<html>
        
<head>

        <style>
                .heading
                        {

                            text-align: center;
                            font-size: larger;

                        }


                .starting
                {

                 margin-bottom: 2%;
                 margin-top:10px;
                 margin-left: 10px;

                }


        </style>

        <title>  </title>

        <link href=	"https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" >
        
</head>

<body>

 <cfoutput>

     <cfset member_email = "#session.auth.email#">

     <!--- <cfdump var="#member_email#" >
     <cfabort> --->

     
     <cfquery name="Query_One" datasource="web_project">

                 select allowances.allowance_id, allowances.allowance_name, allowances.payment
                 from member_users join employee_data on member_users.email = employee_data.email 
                 join allowances_record on employee_Data.id = allowances_record.employee_id
                 join allowances on allowances_record.allowance_id = allowances.allowance_id            
                 where  employee_data.email = "#member_email#"

     </cfquery>

     <!--- <cfdump var="#Query_One#">
     <cfabort> --->

             <table class="table table-primary table-striped-columns">

             <thead class="heading">

                <tr>
                <th colspan = "4">
                Allowance
                </th>
                <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Payment</th>
        
             </thead>

             <tbody>


                <cfloop query="Query_One">

                    <tr>
                    <td>
                    #allowance_id#
                    </td>
                    <td>
                    #allowance_name#
                    </td>
                    <td>
                    #payment#
                    </td>
         
                    </tr>

                 </cfloop>

             </tbody>
        
             </table>
                    
    </cfoutput>

</body>
  
