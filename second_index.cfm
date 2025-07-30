

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
         <cfquery name="EmployeeQuery" datasource="my_office_ds">

         select*
         from Employee_Data
          limit 1

         </cfquery>

         <cfset var1 = EmployeeQuery.ID>
         
         <cfdump var ="#var1#">

         --->

          <!---<cfset mycheck = #isDefined("ID")# > --->
<!---

         <cfquery name="showpolitics" datasource="my_office_ds">

select* 
from Department;

            </cfquery>

            <cfdump var1 = "#showpolitics#">

            </cfoutput>
</body>



          <cfquery name="insertpolitics" datasource="my_office_ds">


         insert into Politics (Party_ID, Party_Name )
values (1,'PTI'),
(2,'PMLN'),
(3, 'JUI-F'),
(4, 'MQM'),
(5, 'PPP');

          </cfquery>

                <cfquery name="droppolitics" datasource="my_office_ds">

                drop table politics;

 </cfquery>



  <cfquery name="getpolitics" datasource="my_office_ds">

  select* from Politics
</cfquery>

          <cfdump var1 = "#getpolitics#">

--->

<body>

    <cfoutput>
        


         <div class="starting">

         <a href="form.cfm"><button class="btn btn-dark ">Add a New Employee</button></a>

         </div>

         <!--- #ID#-#Employee_Name#-#Gender#-#Email#-#Phone#-#DateFormat(#Joining_Date#,"yyyy-mm-dd")#-#Designation#-#Dept_Name#-#Experience#-#Salary# --->


         <!--- <cfdump var ="#Query_Status#"> --->


         <cfif isDefined("ID")> 

             <cfquery name="Query_One" datasource="my_office_ds">

                 select*
                 from Employee_Data
                 where Employee_Data.ID = #ID#;  

             </cfquery>

             <!--- <cfdump var ="#Query_Status#" > --->

             <cfif queryRecordCount(Query_One) gte 1>

                 <cfquery name="Update" datasource="my_office_ds" >

                     Update Employee_Data
                     Set Employee_Name ="#Employee_Name#",Gender="#Gender#",Email="#Email#",Phone="#Phone#",Joining_Date="#Joining_Date#",Designation="#Designation#",Department_ID=#Dept_Name#,Experience=#Experience#,Salary=#Salary#,Party_ID=#Party_ID#
                     where Employee_Data.ID = #ID#; 

                 </cfquery>

             <cfelse>

                 <cfquery datasource="my_office_ds" name ="Insert_Data">

                     insert into Employee_Data (ID, Employee_Name,Gender,Email,Phone,Joining_Date,Designation,Department_ID,Experience,Salary,Party_ID)
                     values(#ID#,'#Employee_Name#','#Gender#','#Email#',#Phone#,'#Joining_Date#','#Designation#',#Dept_Name#,#Experience#,#Salary#,#Party_ID#)

                 </cfquery>

             </cfif>

         </cfif>

                       <cfquery name="Query_Status" datasource="my_office_ds">

                          select*
                          from Employee_Data Join Department On Employee_Data.Department_ID = Department.Dept_ID
                          Join Politics On Employee_Data.Party_ID = Politics.Party_ID
    
                      </cfquery>
    
         <table class="table table-dark table-striped-columns">

            <thead class="heading">

                <tr>
                <th colspan = "12">
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
                <th>Political Party</th>
                <th></th>
            
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

                 <!---   <cfquery name="GetDeptName" datasource="my_office_ds" >

                    select*
                    from Department
                    where Dept_ID = #Department_ID#

                    </cfquery>

                       <td>
                    #GetDeptName.Dept_Name#
                    </td>
                 --->
                    

                    <td>
                    #Dept_Name#
                    </td>

                    <td>
                    #Experience#
                    </td>
                    <td>
                    #Salary#
                    </td>
                    <td>
                    #Party_Name#
                    </td>
                    <td>

                    <!--- <input class="btn btn-danger" type="button" value="Edit" onclick="location.href='form.cfm'"> --->

                     <a href="form.cfm?ID=#ID#"><button class="btn btn-danger">Edit</button></a>
            
                    </td>
                    </tr>

                </cfloop>

            </tbody>
        
         </table>


    </cfoutput>

</body>
  
--->

<!---


--->
