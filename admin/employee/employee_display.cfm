

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

                        <cflocation  url="\member\member_index.cfm" addtoken="no">

        </cfif>


    <cfoutput>
    
         <!--- #ID#-#Employee_Name#-#Gender#-#Email#-#Phone#-#DateFormat(#Joining_Date#,"yyyy-mm-dd")#-#Designation#-#Dept_Name#-#Experience#-#Salary# --->

         <!--- <cfdump var ="#Query_Status#"> --->
         

         <cfif isDefined("ID_Active") >

            <cfquery name="update_employee_data" datasource ="web_project">

                 update Employee_Data
                 set IsActive=1
                 where ID=#ID_Active#;

            </cfquery> 

         <cfelse>
         
             <cfif isDefined("ID")> 

                 <cfquery name="Query_One" datasource="web_project">

                     select*
                     from Employee_Data
                     where Employee_Data.ID = #ID#;  

                 </cfquery>

                   <!--- <cfdump var ="#form#" > 
                    <cfabort> --->

                 <cfif queryRecordCount(Query_One) gte 1>

                     <cfquery name="Update" datasource="web_project" >

                         Update Employee_Data
                         Set Employee_Name ="#Employee_Name#",Gender="#Gender#",Email="#Email#",Phone="#Phone#",Joining_Date="#Joining_Date#",Designation="#Designation#",Department_ID=#Department_ID#,Experience=#Experience#,Salary=#Salary#
                         where Employee_Data.ID = #ID#; 

                    </cfquery>

                 <cfelse>

                     <cfquery datasource="web_project" name ="Insert_Data">

                         insert into Employee_Data (ID, Employee_Name,Gender,Email,Phone,Joining_Date,Designation,Department_ID,Experience,Salary)
                         values(#ID#,'#Employee_Name#','#Gender#','#Email#','#Phone#','#Joining_Date#','#Designation#',#Department_ID#,#Experience#,#Salary#)

                     </cfquery>

                 </cfif>

             </cfif> 

         </cfif>         
                
             <cfif isDefined ("Allowance_ID")>

               <!---     #Form.Allowance_ID# --->

                    <cfquery name="Delete_Previous_Record" datasource="web_project" >

                        delete
                        from Allowances_Record
                        where Employee_ID = #ID#

                    </cfquery>

                    <cfloop list = "#Form.Allowance_ID#" index="i">
                        

                             <cfquery name="Allowences_Record" datasource ="web_project" >

                                        insert into Allowances_Record(Employee_ID,Allowance_ID)
                                        values(#ID#,#i#)

                             </cfquery>

                    </cfloop>

                  </cfif> 


         <cfquery name="Query_Status" datasource="web_project">

                          select*
                          from Employee_Data Inner Join Department On Employee_Data.Department_ID = Department.Dept_ID
                          where IsActive=1
                          order by Employee_Data.ID asc          
    
         </cfquery>
    
         <table class="table table-dark table-striped-columns">

            <thead class="heading">

                <tr>
                <th colspan = "11">
                Employee
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
                <th>Action</th>
            
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
                    <td>

                    <!--- <input class="btn btn-danger" type="button" value="Edit" onclick="location.href='form.cfm'"> --->

                     <a href="/admin/employee/employee_form.cfm?ID=#ID#"><button class="btn btn-success">Edit</button></a>
                     <a href="/admin/employee/temp_employee_delete.cfm?ID=#ID#"><button class="btn btn-danger">Delete</button></a>
            
                    </td>
                    </tr>

                </cfloop>

            </tbody>
        
         </table>

    </cfoutput>

</body>
  
