

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

    <cfoutput>
    
         <!--- #ID#-#Employee_Name#-#Gender#-#Email#-#Phone#-#DateFormat(#Joining_Date#,"yyyy-mm-dd")#-#Designation#-#Dept_Name#-#Experience#-#Salary# --->


         <!--- <cfdump var ="#Query_Status#"> --->


         <cfset My_ID ="">
         <cfset My_FullName = "">
         <cfset My_Email = "">
         <cfset My_UserName = "">
         <cfset My_Password = "">


 <cfset mycheck = #structKeyExists(url,"ID")# >

         <cfif mycheck eq true>

             <cfset rowID = URL.ID > 

             <cfquery name="User_Query" datasource ="web_project">

                 select *
                 from member_users
                 where ID=#rowID#

             </cfquery>  

             <cfloop query="User_Query">

                    <cfset My_ID ="#ID#">
                    <cfset My_FullName = "#fullname#">
                    <cfset My_Email = "#email#">
                    <cfset My_UserName = "#username#">
        

             </cfloop>    

             <cfquery name="backup_insert" datasource="web_project" >

                 insert into deleted_users(ID, fullname,email,username)
                 values(#My_ID#,'#My_FullName#','#My_Email#','#My_UserName#');

             </cfquery>

    
             <cfquery name="delete_temp" datasource="web_project" >

                 delete
                 from member_users
                 where ID = #rowID#

             </cfquery>


             <cflocation  url="temp_user_delete.cfm" addtoken="no">

             </cfif>
    <!---
             <cfquery name="Query_Status" datasource="web_project">

                 select* 
                 from deleted_employees;    
    
             </cfquery>

             <!--- <cfdump var="#Query_Status#"> --->


             
            <table class="table table-danger table-striped-columns">

                <thead class="heading">

                <tr>
                <th colspan = "10">
                Permanent Deleted Employee
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
                <th>Experience</th>
                <th>Salary</th>  

             </thead>

            <tbody>


               <cfloop query="Query_Status">

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
                    #Experience#
                    </td>
                    <td>
                    #Salary#
                    </td>
                
                </cfloop>

            </tbody>
        
         </table>
        
        --->

    </cfoutput>

</body>
  
