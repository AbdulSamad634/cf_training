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

</head>

<body>


    <cfoutput>



         <div class="form-container">

            <form action="admin_index.cfm" method="POST">

                 <div style="margin-bottom: 2rem">
                 <h2 class="form-title">Reset Your Password</h2>
                 <p class="form-desc">
                
                 </p>
                 </div>  

                 <label for="" class="form-label">Enter your old password</label>
                 <input
                 type="text"
                 name="Old_Password"
                 id="id"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter Old Password"
                 <!--- value=#My_ID#
                 readonly  --->
                 
                 required
                 />
 
                 <label for="" class="form-label">New Password</label>
                 <input
                 type="text"
                 name="New_Password"
                 id="Full Name"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Enter New Password"
                 required
                 />

                 <label for="Confirm_Password" class="form-label">Confirm Password</label>
                 <input
                 type="text"
                 name="Confirm_Password"
                 id="phone"
                 autocomplete="off"
                 class="form-input"
                 placeholder="Confirm Password"
                 <!--- value=#My_Phone# --->
                 required
                 />


                 <button class="form-btn">Submit</button>

            </form>

               

         </div>

    </cfoutput>

</body>


