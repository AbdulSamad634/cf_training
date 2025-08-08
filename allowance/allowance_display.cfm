

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


        <cfif session.auth.role eq "member">

                        <cflocation  url="\member\member_index.cfm" addtoken="no">

        </cfif>

    <cfoutput>
        

         <cfif isDefined("Allowance_ID")> 

             <cfquery name="Query_One" datasource="web_project">

                 select*
                 from Allowances
                 where Allowances.Allowance_ID = #Allowance_ID#;  

             </cfquery>

             <!--- <cfdump var ="#Query_Status#" > --->

             <cfif queryRecordCount(Query_One) gte 1>

                 <cfquery name="Update" datasource="web_project" >

                     Update Allowances
                     Set Allowance_ID ="#Allowance_ID#", Allowance_Name="#Allowance_Name#",Payment="#Payment#"
                     where Allowances.Allowance_ID = #Allowance_ID#; 

                 </cfquery>

             <cfelse>

                 <cfquery datasource="web_project" name ="Insert_Data">

                    insert into Allowances (Allowance_ID, Allowance_Name, Payment)
                    values("#Allowance_ID#","#Allowance_Name#","#Payment#")

                 </cfquery>

             </cfif>
                          
         </cfif>

         <cfquery name="Query_Status" datasource="web_project">

                          select*
                          from Allowances

    
         </cfquery>
    
         <table class="table table-dark table-striped-columns">

            <thead class="heading">

                <tr>
                <th colspan = "4">
                Allowance
                </th>
                <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Payment</th>
                <th></th>
            
            </thead>

            <tbody>


                <cfloop query="Query_Status">

                    <tr>
                    <td>
                    #Allowance_ID#
                    </td>
                    <td>
                    #Allowance_Name#
                    </td>
                    <td>
                    #Payment#
                    </td>
                    <td>
    
                     <a href="/admin/allowance/allowance_form.cfm?Allowance_ID=#Allowance_ID#"><button class="btn btn-danger">Edit</button></a>
            
                    </td>
                    </tr>

                </cfloop>

            </tbody>
        
         </table>

    </cfoutput>

</body>
  
