

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
        </style>

        <title>  </title>

        <link href=	"https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" >
        
    </head>

<!---


<cfif first_check eq "True">


        <cfquery name="Input" datasource="my_office_ds">

            insert into Employee_Data (ID, Employee_Name,Gender,Email,Phone,Joining_Date,Designation,Department_ID,Experience,Salary)
            values(#ID#,'#Employee_Name#','#Gender#','#Email#',#Phone#,'#Joining_Date#','#Designation#',#Department_ID#,#Experience#,#Salary#)

        </cfquery>

<cfelse>

    <cfset rowID = URL.ID > 

    <cfquery name="Update" datasource ="my_office_ds">

    
            Update Employee_Data
            Set Employee_Name ="#Employee_Name#",Gender="#Gender#",Email="#Email#",Phone="#Phone#",Joining_Date="#Joining_Date#",Designation="#Designation#",Department_ID=#Department_ID#,Experience=#Experience#,Salary=#Salary#
            where ID=#rowID#

    </cfquery> 


</cfif>        
--->

<body>

    <cfoutput>

         <cfif isDefined("ID")> 


        <cfquery name="Query_Status" datasource="my_office_ds">

            select*
            from Employee_Data
            where Employee_Data.ID = #ID#;  

        </cfquery>

<!--- <cfdump var="#Query_Status#"> --->

        <cfif queryRecordCount(Query_Status) gte 1 >

        <cfquery name="Update" datasource="my_office_ds" >

        Update Employee_Data
        Set Employee_Name ="#Employee_Name#",Gender="#Gender#",Email="#Email#",Phone="#Phone#",Joining_Date="#Joining_Date#",Designation="#Designation#",Department_ID=#Department_ID#,Experience=#Experience#,Salary=#Salary#
        where Employee_Data.ID = #ID#; 

        </cfquery>

        <cfelse>

        <cfquery name="Insert" datasource="my_office_ds">

        insert into Employee_Data (ID, Employee_Name,Gender,Email,Phone,Joining_Date,Designation,Department_ID,Experience,Salary)
            values(#ID#,'#Employee_Name#','#Gender#','#Email#',#Phone#,'#Joining_Date#','#Designation#',#Department_ID#,#Experience#,#Salary#)

        </cfquery>

        </cfif>

        </cfif>

        <!--- 
Form Operation = #form_operation#
 --->
<!---
<cfdump var="#EmployeeQuery#">
<cfabort>
--->

   <cfquery name="EmployeeQuery" datasource="my_office_ds">

            select*
            from Employee_Data

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
                <th>Department ID</th>
                <th>Experience</th>
                <th>Salary</th>
                <th></th>
            
            </thead>

            <tbody>


                <cfloop query="EmployeeQuery">

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
                    <td>
                    #Department_ID#
                    </td>
                    <td>
                    #Experience#
                    </td>
                    <td>
                    #Salary#
                    </td>
                    <td>

                    <!--- <input class="btn btn-danger" type="button" value="Edit" onclick="location.href='form.cfm'"> --->

                     <a href="form.cfm?ID=#ID#"><button class="btn btn-danger">Edit</button></a>
            
                    </td>
                    </tr>

                </cfloop>

            </tbody>
        
        </table>

<form >

</cfoutput>


</body>

</html>