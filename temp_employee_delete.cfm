
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

            <cfif session.auth.role eq "member">

                        <cflocation  url="member_index.cfm" addtoken="no">

        </cfif>

         <cfif isDefined("ID") >

             <cfset rowID = URL.ID > 

             <cfquery name="update_employee_data" datasource ="web_project">

                 update Employee_Data
                 set IsActive=0
                 where ID=#rowID#;

             </cfquery>   

             <!--- <cfdump var="#update_employee_data#"> --->

             <cfquery name="update_allowance_record" datasource="web_project" >

                 update Allowances_Record
                 set IsActive=0
                 where Employee_ID = #rowID#;

             </cfquery>    

             <!--- <cfdump var="#update_allowance_record#"> --->

         </cfif>     

             <cfquery name="display_temporary_record" datasource="web_project" >

                 select* 
                 from Employee_Data
                 where IsActive=0;

             </cfquery>

             

             <!--- <cfdump var="#display_temporary_record#"> --->

               <table class="table table-success table-striped-columns">

                <thead class="heading">

                <tr>
                <th colspan = "9">
                Temporary Employee
                </th>
                <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Phone</th>   
                <th>Joining Date</th>
                <th>Designation</th>
                <th>Department Name</th>
                <th>Action</th>

            </thead>

            <tbody>


                <cfloop query="display_temporary_record">

                    <tr>

                        <td>
                             #ID#
                        </td>

                        <td>
                             #Employee_Name#
                        </td>

                        <td>
                             #Gender#
                        </td>

                        <td>
                             #Email#
                        </td>

                        <td>
                             #Phone#
                        </td>

                        <td>
                             #DateFormat(#Joining_Date#, "ddd dd mmmm, yyyy")# 
                        </td>

                        <td>
                             #Designation#
                        </td>

                        <cfquery name="GetDeptName" datasource="web_project" >

                             select Dept_Name
                             from Department
                             where Dept_ID = #Department_ID#

                        </cfquery>

                        <td>
                             #GetDeptName.Dept_Name#
                        </td>
                   
                        <td>

                             <a href="employee_display.cfm?ID_Active=#ID#"><button class="btn btn-success">Restore</button></a>
                             <a href="permanent_delete.cfm?ID=#ID#"><button class="btn btn-danger">Permanent Delete</button></a>
            
                        </td>

                    </tr>

                </cfloop>

            </tbody>
        
         </table>
        

    </cfoutput>

</body>
  
