
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

                        <cflocation  url="\member\member_index.cfm" addtoken="no">

        </cfif>

         <cfif isDefined("ID") >

             <cfset rowID = URL.ID > 

             <cfquery name="update_employee_data" datasource ="web_project">

                 update member_users
                 set IsActive=0
                 where ID=#rowID#;

             </cfquery>   



         </cfif>     

             <cfquery name="display_temporary_record" datasource="web_project" >

                 select* 
                 from member_users
                 where IsActive=0;

             </cfquery>

             

             <!--- <cfdump var="#display_temporary_record#"> --->

               <table class="table table-success table-striped-columns">

                <thead class="heading">
<tr>
                <th colspan = "6">
                User
                </th>
                <tr>
                <th>ID</th>
                <th>Fullname</th>
                <th>Email</th>
                <th>Username</th>
                <th>Password</th>
                <th>Action</th>

            </thead>

            <tbody>


                <cfloop query="display_temporary_record">

                    <tr>

                        <tr>
                    <td>
                    #ID#
                    </td>
                    <td>
                    #Fullname#
                    </td>
                    <td>
                    #Email#
                    </td>
                    <td>
                    #Username#
                    </td>
                    <td>
                    #Password#
                    </td>
                        <td>

                             <a href="/admin/admin_users/user_display.cfm?ID_Active=#ID#"><button class="btn btn-success">Restore</button></a>
                             <a href="admin/admin_users/permanent_user_delete.cfm?ID=#ID#"><button class="btn btn-danger">Permanent Delete</button></a>
            
                        </td>

                    </tr>

                </cfloop>

            </tbody>
        
         </table>
        

    </cfoutput>

</body>
  
