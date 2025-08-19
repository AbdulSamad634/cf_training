

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

<!---
                


                     --->

                 <cfelse>

                     <cfquery datasource="web_project" name ="Insert_Data">

                         insert into Employee_Data (ID, Employee_Name,Gender,Email,Phone,Joining_Date,Designation,Department_ID,Experience,Salary)
                         values(#ID#,'#Employee_Name#','#Gender#','#Email#','#Phone#','#Joining_Date#','#Designation#',#Department_ID#,#Experience#,#Salary#)

                     </cfquery>

                 </cfif>

             </cfif> 

         </cfif>         
                
            <cfif isDefined ("Allowance_ID")>
                    <cfdump var="#Form.Allowance_ID#" >

<!--- following section  makes sure to update allowance payment value in database --->

                        <cfloop list = "#Form.Allowance_ID#" index="i">
                            <cfquery name ="Check_Allowance" datasource="web_project" >
                                select*
                                from allowances_record
                                where allowance_id = #i# and employee_id = #ID# and isactive=1;
                            </cfquery>
                             <!---   <cfdump var="#check_allowance#"> --->
                            <cfif queryRecordCount(Check_Allowance) gte 1 >
                                    <cfquery name="update_allowance_data" datasource="web_project">
                                        select allowance_ID
                                        from Allowances_Record
                                        where Employee_ID = #ID# and isactive = 1;
                                    </cfquery>
                                    <cfloop query="update_allowance_data">
                                        <cfquery name="final_Step" datasource="web_project">
                                            update allowances_record
                                            set employee_payment = #evaluate("allowance_payment#update_allowance_data.allowance_ID#")#
                                            where Employee_ID=#ID# AND Allowance_ID=#update_allowance_data.allowance_ID# and isactive=1;
                                        </cfquery>
                                    </cfloop>
                            </cfif>
                        </cfloop>

                     <!--- --->


                    <!--- following section makes sure to insert newly selected allowance in database--->
                    <cfloop list = "#Form.Allowance_ID#" index="i">
                            <cfquery name ="Check_Allowance" datasource="web_project" >
                                select*
                                from allowances_record
                                where allowance_id = #i# and employee_id = #ID#;
                            </cfquery>
                             <!---   <cfdump var="#check_allowance#"> --->
                            <cfif queryRecordCount(Check_Allowance) eq 0 >
                                <cfquery name="get_default_allowance" datasource="web_project">
                                    select payment
                                    from allowances
                                    where allowance_id = #i#
                                </cfquery>
                             <!---    <cfdump var="#get_default_allowance#"> --->
                                <cfset default_payment = "#get_default_allowance.payment#" >
                                <cfquery name="Allowences_Record" datasource ="web_project" >
                                        insert into Allowances_Record(Employee_ID,Allowance_ID,Employee_Payment)
                                        values(#ID#,#i#,#default_payment#)
                                </cfquery>
                            <cfelse> 
                            </cfif>
                    </cfloop>    

                    <!--- following section makes sure to inactive previously active allowance in database bcz it is unselected this time" --->


                            <cfquery name="set_active" datasource="web_project">
                                update allowances_record
                                set isactive = 0
                                where employee_id = #ID#;
                            </cfquery>
                            <!--- <cfdump var="#set_active#"> --->
                            <cfquery name="get_latest_employee" datasource="web_project">
                                select allowance_id
                                from allowances_record
                                where employee_id = #ID#
                            </cfquery>
                            <!---        <cfdump var="#get_latest_employee#"> --->
                            <cfloop query="get_latest_employee">
                                <cfset var1= "#get_latest_employee.allowance_id#">
                                    <cfloop list="#Form.Allowance_ID#" index="i" >
                                        <cfif #var1# eq #i# >
                                            TRUE
                                            <cfquery name="update_active" datasource="web_project">
                                                update allowances_record
                                                set isactive = 1
                                                where allowance_id = #i# and employee_id = #ID#;
                                            </cfquery>
                                        <cfelse>
                                            False
                                        </cfif>
                                    </cfloop>
                            </cfloop>

                            <cfquery name="first_updated_inactive" datasource="web_project">
                                select allowance_ID
                                from allowances_record
                                where employee_id = #ID# and isactive = 0;
                            </cfquery>
                            <cfloop query="first_updated_inactive">
                                <cfquery name="second_updated_inactive" datasource="web_project">
                                    select payment
                                    from allowances
                                    where allowance_id = "#first_updated_inactive.allowance_id#";
                                </cfquery>
                                <cfset updated_payment="#second_updated_inactive.payment#">
                                <cfquery name="third_updated_inactive" datasource="web_project">
                                    update allowances_record
                                    set employee_payment=#updated_payment#
                                    where employee_id = #ID# AND allowance_ID = "#first_updated_inactive.allowance_id#" and isactive=0;
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
  
