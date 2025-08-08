

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

         <cfif isDefined("ID")>

             <cfset rowID = URL.ID > 

             <cfquery name="EmployeeQuery" datasource ="web_project">

                 select *
                 from Employee_Data 
                 where ID=#rowID#

             </cfquery>  

             <cfloop query="EmployeeQuery">

                 <cfset My_ID = #ID#>
                 <cfset My_Employee_Name = #Employee_Name#>
                 <cfset My_Gender = #Gender#>
                 <cfset My_Email = #Email#>
                 <cfset My_Phone = #Phone#>
                 <cfset My_Joining_Date = #DateFormat(#Joining_Date#,"yyyy-mm-dd")#>
                 <cfset My_Designation = #Designation#>
                 <cfset My_Department_ID = #Department_ID#>
                 <cfset My_Experience = #Experience#>
                 <cfset My_Salary = #Salary#>

             </cfloop>    

             <cfquery name="backup_insert" datasource="web_project" >

                 insert into deleted_Employees(ID, Employee_Name,Gender,Email,Phone,Joining_Date,Designation,Department_ID,Experience,Salary)
                 values(#My_ID#,'#My_Employee_Name#','#My_Gender#','#My_Email#','#My_Phone#','#My_Joining_Date#','#My_Designation#','#My_Department_ID#','#My_Experience#',#My_Salary#);

             </cfquery>

            <cfquery name="update_deleted_emp" datasource="web_project" >

             update deleted_Employees
             set IsDeleted=1
             where ID=#My_ID#

             </cfquery>

             <cfquery name="show_backup_result" datasource = "web_project">

                 select*
                 from deleted_Employees;

             </cfquery>


         <!--- <cfdump var="#show_backup_result#"> --->

         <cfquery name="backup_allowances_record_1" datasource="web_project" >

            select allowance_id 
            from allowances_Record
            where employee_id = #rowID#

         </cfquery>    

         <!--- <cfdump var="#backup_allowances_record_1#"> --->

         <cfif queryRecordCount(backup_allowances_record_1) gte 1 >
         
             <cfloop query="backup_allowances_record_1">

                 <cfquery name="backup_allowances_record_2" datasource="web_project" >

                     insert into deleted_allowances_Record (employee_id,allowance_id)
                     values(#My_ID#,#backup_allowances_record_1.allowance_id#)

                 </cfquery>

                 <cfquery name="update_deleted_allowances_record" datasource="web_project">

                    update deleted_allowances_record
                    set isdeleted=1
                    where employee_id = #My_ID#

                 </cfquery>

                 <cfquery name="show_backup_record" datasource="web_project" >

                     select* 
                     from deleted_allowances_record

                 </cfquery>            

                 <!--- <cfdump var="#show_backup_record#"> --->

                 <cfquery name="backup_allowances_record_3" datasource="web_project" >

                    delete 
                    from allowances_record
                    where employee_id = #rowId# and allowance_id =#backup_allowances_record_1.allowance_id# 

                 </cfquery>

             </cfloop>

             </cfif>

             <cfquery name="show_deleted_record" datasource="web_project" >

                 select* 
                 from allowances_record;

             </cfquery>

             <!--- <cfdump var="#show_deleted_record#"> --->
    
             <cfquery name="delete_temp" datasource="web_project" >

                 delete
                 from employee_data
                 where ID = #rowID#

             </cfquery>

             </cfif>


             <cflocation  url="/admin/employee/temp_employee_delete.cfm" addtoken="no">
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
  
