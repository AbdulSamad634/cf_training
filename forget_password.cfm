

<html>
<body>
<cfoutput>
<cfmail  to="rabiaasghar769@gmail.com" from="abdul.samad0165@gmail.com" subject="Your Order">
  Hi there,
  This mail is sent to confirm that we have received your order.
</cfmail>

<cfdump var=#getMailServers()#>
</cfoutput>
</body>
</html>