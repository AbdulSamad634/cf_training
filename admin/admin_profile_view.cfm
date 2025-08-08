
<!DOCTYPE html>

<html>
        
    <head>
        <link href=	"https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" >


        <style>

            body{
              font-family: "Inter", sans-serif;
    margin-top:20px;
    color: #1a202c;
    text-align: left;
    background-color: #e2e8f0;    
}

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

                 .form-img {
                display: block;
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 2rem; /* 32px */
                width: 100%;
                max-width: 200px;
                height: auto; /* Maintain aspect ratio */
                }

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

.main-body {
    padding: 15px;
}
.card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.card {
    position: relative;
    display: flex;
    flex-direction: row;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background-color: #e2e8f0;
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: none!important;
}

        </style>


    </head>

<body>

<cfoutput>


<div class="container text-center">

  <div class="row">

      <div class="col-3">
          <div class="row">
          <img src="/admin/profile_pics/#session.auth.id#.jpg" alt="error" width=50px height=240px>
          </div>
          <div>
          <h5 class="card-title">#session.auth.fullname#</h5>
          </div>
          <!--- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p> --->
          <!---<ahref="" class="btn btn-primary">Go somewhere</a> --->
      </div>

    <div class="col-8">

            <div class="col-md-14">
              <div class="card mb-3">
                <div class="card-body">
                  
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Full Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <cfset full_name= "#session.auth.FullName#">
                     <cfoutput>
                     <h4>#full_name#</h4>
                     </cfoutput>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <cfset email= "#session.auth.Email#">
                     <cfoutput>
                     <h4>#email#</h4>
                     </cfoutput>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Username</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <cfset username= "#session.auth.username#">
                     <cfoutput>
                     <h4>#username#</h4>
                     </cfoutput>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Admin ID</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <cfset adminid = "#session.auth.admin_id#">
                     <cfoutput>
                     <h4>#adminid#</h4>
                     </cfoutput>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Role</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <cfset role= "#session.auth.role#">
                     <cfoutput>
                     <h4>#role#</h4>
                     </cfoutput>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-sm-12">
                      <a class="btn btn-info " target="__blank" href="/member/member_profile_edit.cfm">Edit</a>
                    </div>
                  </div>


            </div>
         </div> 
       </div>


  </div> <!--- close div = col --->

</div> <!--- closes div = row --->


<cfquery name="get_users" datasource="web_project">
select* from member_users
where admin_id = #session.auth.admin_id#
</cfquery>

<cfdump var="#get_users#">

<!---

<cfif queryRecordCount(get_users) gte 1>


<cfloop query="get_users">

                    <cfset My_ID ="#ID#">
                    <cfset My_FullName = "#fullname#">
                    <cfset My_Email = "#email#">
                    <cfset My_UserName = "#username#">
                    <cfset My_Password = "#password#">


                   <!--------------------------------------------------------------------
                         Department ID : #Department_ID#
                    --------------------------------------------------------------------- --->

      <div class="col-3">
          <div class="row">
          <img src="../../member/profile_pics/#ID#" alt="error" width=50px height=240px>
          </div>
          <div>
          <h5 class="card-title">#My_FullName#</h5>
          </div>
          <!--- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p> --->
          <!---<ahref="" class="btn btn-primary">Go somewhere</a> --->
      </div>

    <div class="col-8">

 <div class="form-container">

            <form action="/admin/admin_users/user_display.cfm" method="POST">

                 <div style="margin-bottom: 2rem">
                 <h2 class="form-title"></h2>
                 <p class="form-desc">
                    Member User Details
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
                 name="fullname"
                 id="Full Name"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your full name"
                 value=#My_FullName#
                 readonly
                 />

   
 
                 <label for="email" class="form-label">Email Address</label>
                 <input
                 type="email"
                 name="email"
                 id="email"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your email"
                 value=#My_Email#
                 readonly
                 />

                 <label for="email" class="form-label">Username</label>
                 <input
                 type="text"
                 name="username"
                 id="email"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your email"
                 value=#My_UserName#
                 readonly
                 />

                 <label for="email" class="form-label">Password</label>
                 <input
                 type="text"
                 name="password"
                 id="email"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your email"
                 value=""
                 readonly
                 />

                   <label for="email" class="form-label">Admin ID</label>
                 <input
                 type="text"
                 name="password"
                 id="email"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter your email"
                 value="#session.auth.admin_id#"
                 readonly
                 />


                                <div class="row">
                    <div class="col-sm-12">
                      <a class="btn btn-info " target="__blank" href="/member/member_profile_edit.cfm">Edit</a>
                    </div>
                  </div>
            </form>
         </div>


         </div>
</div>

</cfloop>


</cfif>

</div>

</cfoutput>

</body>
--->


<cfif queryRecordCount(get_users) gte 1>

<cfloop query="get_users">

<div class="row">

     <div class="col-3">
          <div class="row">
          <img src="/member/profile_pics/#get_users.id#.jpg" alt="error" width=50px height=240px>
          </div>
          <div>
          <h5 class="card-title">"#get_users.fullname#"</h5>
          </div>
          <!--- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p> --->
          <!---<ahref="" class="btn btn-primary">Go somewhere</a> --->
      </div>


    <div class="col-8">

            <div class="col-md-14">
              <div class="card mb-3">
                <div class="card-body">
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Full Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <cfset full_name= "#session.auth.FullName#">
                  
                     <h4>"#get_users.fullname#"</h4>
                  
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <cfset email= "#session.auth.Email#">
                     <cfoutput>
                     <h4>#get_users.email#</h4>
                     </cfoutput>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Username</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <cfset username= "#session.auth.username#">
                     <cfoutput>
                     <h4>#get_users.username#</h4>
                     </cfoutput>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Admin ID</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <cfset adminid = "#session.auth.admin_id#">
                     <cfoutput>
                     <h4>#get_users.admin_id#</h4>
                     </cfoutput>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Role</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <cfset role= "#session.auth.role#">
                     <cfoutput>
                     <h4>#get_users.role#</h4>
                     </cfoutput>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-sm-12">
                      <a class="btn btn-info " target="__blank" href="/member/member_profile_edit.cfm">Edit</a>
                    </div>
                  </div>


            </div>
         </div> 
       </div>


  </div> <!--- close div = col --->

</div>

</cfloop>

</cfif>

</div>


</cfoutput>

</body>






