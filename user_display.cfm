

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


         <!---
         <cfquery name="EmployeeQuery" datasource="web_project">

         select*
         from Employee_Data
          limit 1

         </cfquery>

         <cfset var1 = EmployeeQuery.ID>
         
         <cfdump var ="#var1#">

         --->

          <!---<cfset mycheck = #isDefined("ID")# > --->
<!---

         <cfquery name="showpolitics" datasource="web_project">

select* 
from Department;

            </cfquery>

            <cfdump var1 = "#showpolitics#">

            </cfoutput>
</body>



          <cfquery name="insertpolitics" datasource="web_project">


         insert into Politics (Party_ID, Party_Name )
values (1,'PTI'),
(2,'PMLN'),
(3, 'JUI-F'),
(4, 'MQM'),
(5, 'PPP');

          </cfquery>

                <cfquery name="droppolitics" datasource="web_project">

                drop table politics;

 </cfquery>



  <cfquery name="getpolitics" datasource="web_project">

  select* from Politics
</cfquery>

          <cfdump var1 = "#getpolitics#">

--->

<body>


        <cfif session.auth.role eq "member">

                        <cflocation  url="member_index.cfm" addtoken="no">

        </cfif>


    <cfoutput>
    
         <!--- #ID#-#Employee_Name#-#Gender#-#Email#-#Phone#-#DateFormat(#Joining_Date#,"yyyy-mm-dd")#-#Designation#-#Dept_Name#-#Experience#-#Salary# --->

         <!--- <cfdump var ="#Query_Status#"> --->



     <cfif isDefined("ID_Active") >

            <cfquery name="update_user_data" datasource ="web_project">

                 update member_users
                 set IsActive=1
                 where ID=#ID_Active#;

            </cfquery> 

         <cfelse>     
         
        <cfif isDefined("ID")> 

                 <cfquery name="Query_One" datasource="web_project">

                     select*
                     from member_users
                     where ID= #ID#;  

                 </cfquery>

                   <!--- <cfdump var ="#form#" > 
                    <cfabort> --->

                 <cfif queryRecordCount(Query_One) eq 1>

                     <cfquery name="Update" datasource="web_project" >

                         Update member_users
                         Set fullname ="#fullname#",email="#email#",username="#username#",password="#password#"
                         where ID=#ID#  

                    </cfquery>

                 <cfelse>

                     <cfquery datasource="web_project" name ="Insert_Data">

                        insert into member_users(id,fullname,email,username,password,admin_id)
                        values("#ID#","#fullname#","#email#","#username#","#password#","#session.auth.admin_ID#");

                     </cfquery>

                 </cfif>

        </cfif>

    </cfif>    
         
         <cfquery name="Query_Status" datasource="web_project">

                          select*
                          from member_users
                          where admin_id = "#session.auth.ID#" and isactive = 1
         </cfquery>
    
         <table class="table table-dark table-striped-columns">

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


                <cfloop query="Query_Status">

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

                    <!--- <input class="btn btn-danger" type="button" value="Edit" onclick="location.href='form.cfm'"> --->

                     <a href="new_user_form.cfm?ID=#ID#"><button class="btn btn-success">Edit</button></a>
                     <a href="temp_user_delete.cfm?ID=#ID#"><button class="btn btn-danger">Delete</button></a>
            
                    </td>
                    </tr>

                </cfloop>

            </tbody>
        
         </table>

    </cfoutput>

</body>
  
