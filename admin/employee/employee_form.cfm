<!DOCTYPE html>

 <html>

<head>
            <title>  </title>

            <link href=	"https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" >
         
         <style>

                /* General Body Styles */
                body {
                font-family: "Inter", sans-serif;
                background-color: #f3f4f6; /* A light gray background */
                margin: 0;
                padding: 0;
                }

                /* Main container to center the form */
                .main-center {
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                padding: 2rem;
                box-sizing: border-box;
                }

                /* The form card itself */
                .form-container {
                margin: 0 auto;
                max-width: 570px;
                width: 100%;
                background: white;
                padding: 2.5rem; /* 40px */
                border-radius: 0.75rem; /* 12px */
                box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1),
                0 4px 6px -4px rgba(0, 0, 0, 0.1);
                }

                /* Form image styling */
                .form-img {
                display: block;
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 2rem; /* 32px */
                width: 100%;
                max-width: 200px;
                height: auto; /* Maintain aspect ratio */
                }

                /* Form title and description */
                .form-title {
                font-size: 1.875rem; /* 30px */
                font-weight: 700;
                color: #111827; /* Dark gray */
                margin-bottom: 0.5rem; /* 8px */
                text-align: center;
                }

                .form-desc {
                color: #6b7280; /* Medium gray */
                margin-bottom: 2rem; /* 32px */
                font-size: 0.875rem; /* 14px */
                text-align: center;
                line-height: 1.5;
                }

                /* Styling for form labels */
                .form-label {
                display: block;
                margin-bottom: 0.5rem; /* 8px */
                font-size: 0.875rem; /* 14px */
                font-weight: 600;
                color: #374151; /* Slightly lighter dark gray */
                }

                /* Unified styling for text inputs and select dropdowns */
                .form-input,
                .form-select {
                width: 100%;
                padding: 0.875rem 1.25rem; /* 14px 20px */
                border: 1px solid #d1d5db; /* Light gray border */
                border-radius: 0.5rem; /* 8px */
                background: #ffffff;
                font-weight: 500;
                font-size: 1rem; /* 16px */
                color: #111827;
                outline: none;
                box-sizing: border-box;
                transition: border-color 0.2s, box-shadow 0.2s;
                margin-bottom: 1.25rem; /* 20px */
                }

                .form-input::placeholder {
                color: #9ca3af; /* Lighter gray for placeholder */
                }

                /* Focus state for inputs and selects */
                .form-input:focus,
                .form-select:focus {
                border-color: #6a64f1; /* Purple accent color */
                box-shadow: 0 0 0 3px rgba(106, 100, 241, 0.2);
                }

                /* Styling for the file input */
                .form-file {
                display: block;
                width: 100%;
                margin-bottom: 1.25rem; /* 20px */
                font-size: 0.875rem; /* 14px */
                color: #374151;
                }

                /* Custom styling for file input button */
                .form-file::file-selector-button {
                margin-right: 1rem;
                padding: 0.5rem 1rem;
                border: 1px solid #d1d5db;
                border-radius: 0.375rem;
                background-color: #f9fafb;
                color: #374151;
                font-weight: 500;
                cursor: pointer;
                transition: background-color 0.2s;
                }

                .form-file::file-selector-button:hover {
                background-color: #f3f4f6;
                }

                /* Container for the checkbox and its label */
                .form-checkbox-row {
                display: flex;
                align-items: flex-start;
                gap: 0.75rem; /* 12px */
                margin-top: 1.5rem; /* 24px */
                margin-bottom: 1.5rem; /* 24px */
                }

                /* Styling for the checkbox */
                .form-checkbox {
                margin-top: 0.125rem; /* 2px */
                height: 1.25rem; /* 20px */
                width: 1.25rem; /* 20px */
                border-radius: 0.25rem; /* 4px */
                border: 1px solid #d1d5db;
                cursor: pointer;
                flex-shrink: 0;
                }

                .form-checkbox:checked {
                background-color: #6a64f1;
                border-color: #6a64f1;
                }

                /* Submit button styling */
                .form-btn {
                text-align: center;
                width: 100%;
                font-size: 1rem; /* 16px */
                border-radius: 0.5rem; /* 8px */
                padding: 0.875rem 1.5rem; /* 14px 24px */
                border: none;
                font-weight: 600;
                background-color: #6a64f1; /* Purple accent color */
                color: white;
                cursor: pointer;
                margin-top: 1.5rem; /* 24px */
                transition: background-color 0.2s, box-shadow 0.2s;
                }

                .form-btn:hover {
                background-color: #5a54d1; /* Darker purple on hover */
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                }
                /* --- Mobile Responsive Styles --- */
                @media (max-width: 600px) {
                .main-center {
                padding: 1rem;
                }

                .form-container {
                padding: 1.5rem;
                }

                .form-title {
                font-size: 1.5rem; /* 24px */
                }
                }

         </style>

             <script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
    </script>

</head>

<body>

        <cfif session.auth.role eq "member">

                        <cflocation  url="\member\member_index.cfm" addtoken="no">

        </cfif>

    <cfoutput>

         <cfset My_ID = "">
         <cfset My_Employee_Name = "">
         <cfset My_Gender = "">
         <cfset My_Email = "">
         <cfset My_Phone = "">
         <cfset My_Joining_Date = "">
         <cfset My_Designation = "">
         <cfset My_Department_ID = "">
         <cfset My_Experience = "">
         <cfset My_Salary = "">

         <cfset mycheck = #structKeyExists(url,"ID")# >

         <cfif mycheck eq true>

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


                   <!--------------------------------------------------------------------
                         Department ID : #Department_ID#
                    --------------------------------------------------------------------- --->

             </cfloop> 

         </cfif>

         <div class="form-container">

            <form action="/admin/employee/employee_display.cfm" method="POST">

                 <div style="margin-bottom: 2rem">
                 <h2 class="form-title">Employee Data Input Form</h2>
                 <p class="form-desc">
                    Please provide your details below.
                 </p>
                 </div>  

                 <label for="" class="form-label">ID</label>
                 <input
                 type="number"
                 name="ID"
                 id="id"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your ID"
                 value=#My_ID#
                 readonly
                 required
                 />
 
                 <label for="" class="form-label">Full Name</label>
                 <input
                 type="text"
                 name="Employee_Name"
                 id="Full Name"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your full name"
                 value=#My_Employee_Name#
                 required
                 />

                 <label for="country" class="form-label">Gender</label>
                 <select name="Gender" id="gender" class="form-select" autocomplete="off" value=#My_Gender# required>
                 <option value="Male">Male</option> <!--- It means Male is displayed as option and value="Male" means when this option is selected, this value (i.e. Male is sanded to POST Method) --->
                 <option value="Female">Female</option>
                 </select>

   
 
                 <label for="email" class="form-label">Email Address</label>
                 <input
                 type="email"
                 name="Email"
                 id="email"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your email"
                 value=#My_Email#
                 required
                 />

                 <label for="phone" class="form-label">Phone Number</label>
                 <input
                 type="tel"
                 name="Phone"
                 id="phone"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your phone number"
                 value=#My_Phone#
                 required
                 />


                 <label for="phone" class="form-label">Joining Date</label>
                 <input
                 type="Date"
                 name="Joining_Date"
                 id="joiningdate"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your joining date"
                 value=#My_Joining_Date#
                 <!---  value="#DateFormat(#Joining_Date#,"yyyy-mm-dd")#" --->
                 required
                 />

                 <label for="" class="form-label">Designation</label>
                 <input
                 type="text"
                 name="Designation"
                 id="designation"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your designation"
                 value=#My_Designation#
                 required
                 />

                 <cfquery name ="GetDeptID" datasource="web_project" >

                            select*
                            from Department

                 </cfquery>

                 <!---
                    -----------------------------------------------------------------
                         Department NAME : #GetDeptName.Dept_Name#
                    -----------------------------------------------------------------    

                    ---> 
                                  
                 <label for="department" class="form-label">Department Name</label>
                 <select name="Department_ID" id="department_name" class="form-select" autocomplete="off"  required>
                 
                 <cfloop query ="GetDeptID">
                    <option <cfif My_Department_ID eq  getDeptid.Dept_ID> selected</cfif> value="#Dept_ID#">#Dept_Name#</option>
                 </cfloop>
                 </select>

                
                 <label for="" class="form-label">Experience</label>
                 <input
                 type="number"
                 name="Experience"
                 id="experience"
                 class="form-input"
                 placeholder="Enter your experience"
                 value=#My_Experience#
                 required
                 />

                 <label for="" class="form-label">Salary</label>
                 <input
                 type="number"
                 name="Salary"
                 id="salary"
                 class="form-input"
                 placeholder="Enter your salary"
                 value=#My_Salary#
                 required
                 />
  
                 <cfquery name ="Get_All_Allowances" datasource ="web_project" >

                        select *
                        from Allowances
                
                 </cfquery>

                 <label for="" class="form-label">Choose Allowances</label>
            
               <!--- <div class="form-checkbox-row"> --->
               <div>
                     <cfloop query="Get_All_Allowances">
                    <!---    <input type="checkbox" id="checkbox#Get_All_Allowances.Allowance_ID#" name= "Allowance_ID#Get_All_Allowances.Allowance_ID#" onChange="hideInput(this, payment#Get_All_Allowances.Allowance_ID#)" --->
                    <input type="checkbox" id="checkbox" name= "Allowance_ID"
                                <cfif mycheck eq true>
                                    <cfquery name ="Get_Employees_Allowances" datasource ="web_project" >
                                         select *
                                         from Allowances_record join Allowances on Allowances.Allowance_ID = Allowances_Record.Allowance_ID
                                         where Allowances_Record.Employee_ID = #MY_ID# and Allowances_Record.IsActive = 1;
                                    </cfquery>
                                         <!---  <cfdump var="#Get_All_Allowances#">
                                         <cfdump var="#Get_Employees_Allowances#">  --->
                                         <cfloop query="Get_Employees_Allowances">
                                             <cfif #Get_All_Allowances.Allowance_ID# eq #Get_Employees_Allowances.Allowance_ID# >
                                                checked
                                             </cfif>
                                         </cfloop>
                                    <!---<cfquery name="Updated_Payment" datasource="web_project">
                                        select allowances_record.payment
                                        from Allowances_record join Allowances on Allowances.Allowance_ID = Allowances_Record.Allowance_ID
                                        where Allowances_Record.Employee_ID = #My_ID#
                                    </cfquery>
                                    --->

                                </cfif>
                                value="#Get_All_Allowances.Allowance_ID#"
                            >
                             #Get_All_Allowances.Allowance_Name#<br>
                            <cfloop query="Get_Employees_Allowances">
                                            <cfif #Get_All_Allowances.Allowance_ID# eq #Get_Employees_Allowances.Allowance_ID# >
                                                <input type="number" name="allowance_Payment#Get_All_Allowances.Allowance_ID#" id="payment#Get_All_Allowances.Allowance_ID#" class="form-input" autocomplete="off" value="#Get_Employees_Allowances.Employee_Payment#" >
                                            </cfif>
                            </cfloop>
                     </cfloop>
                </div>

                 <button class="form-btn">Submit</button>
            
            </form>

         </div>

    </cfoutput>
<!---
<script>

    // $(function() 
    // {
    //     $("#checkbox").change(function(){
    //         console.log("hiii");
    //         $("#designation").hide();
    //     })
    // });
    
    function hideInput(check,elm){
        if(check.checked){
            $(elm).show(); 
        }else{
            $(elm).hide();
        }
        console.log("hiii");
        console.log(elm);
    }
</script>

--->
</body>


