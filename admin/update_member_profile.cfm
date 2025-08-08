    <cfif structKeyExists(form, "fileUpload") and len(trim(form.fileUpload))>
        <cffile action="upload"
                fileField="fileUpload"
                destination="D:\git\cf_training\member\profile_pics\#session.auth.id#.jpg"
                nameconflict="overwrite"
                result="uploadResult" >
    </cfif>

    <cfquery name ="update_profile" datasource="web_project">
      
      update member_users
      set  fullname="#fullname#", email="#email#",username="#username#", password="#password#",profile_pic="D:\\git\\cf_training"
     where id="#ID#" 

</cfquery>


<cflocation  url= "/admin/admin_profile_view.cfm" addtoken="no">






<!---        <img src="D:\git\cf_training\fileUpload" alt="Girl in a jacket" width="50" height="50"> --->



          <!---

           <cffile action="readbinary"
	       file="C:\docs\shopping.html"
	       variable="shoppingList">
           <cfoutput>#shoppingList#</cfoutput>

           <cffile action="delete"

	file="C:\docs\accessLog.txt">

    <cfif FileExists("C:\docs\accessLog.txt")>

   <cffile action="delete"

	   file="C:\docs\accessLog.txt">

<cfelse>

   <p>Sorry, can't delete the file - it doesn't exist.</p>

</cfif>
           --->
           
           
           
           
           
           
           
           
           
           
           
           <!---
           
           
            <cftry>
                <cfset myImage = ImageNew("#uploadResult.serverDirectory#/#uploadResult.serverFile#")>
                <cfset imgOkay = "Yes">
            <cfcatch type="any">
                <cfset imgOkay = "No">
            </cfcatch>
            </cftry>

            <cfif imgOkay eq "Yes">
                <cffile action="move"
                        source="#uploadResult.serverDirectory#/#uploadResult.serverFile#"
                        destination="#ExpandPath('./images')#/#uploadResult.serverFile#">
                <cfoutput>Image successfully uploaded: #uploadResult.serverFile#</cfoutput>
            <cfelse>
                <cffile action="delete" file="#uploadResult.serverDirectory#/#uploadResult.serverFile#">
                <cfoutput>Error: The uploaded file is not a valid image or is corrupt.</cfoutput>
            </cfif>
        <cfelse>
            <cfoutput>Error uploading file.</cfoutput>
        </cfif>
    </cfif>

    <cfparam name="form.fileUpload" default="">



<cfif len(trim(form.fileUpload))>

  <cffile action="upload"

     fileField="fileUpload"

     destination="C:\docs">

  <p>Thankyou, your file has been uploaded.</p>

</cfif>
--->