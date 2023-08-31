<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<html>
  <head>
   <style>
	h4 {
		text-shadow: 2px 2px #000C66;
	}
	h1 {
		text-shadow: 2px 2px #000C66;
	}
	</style>
    <meta http-equiv="contentType" content="text/html"; charset="UTF-8">
    <title>SCANTI - Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
<body>
<br>
<img src = "Scanti3.png" width="175" height="150">
<h1 style="color:white;">Sign up as New User</h1>
<br>
<hr>
  
<s:form action="signupAction" autocomplete="off">  
<s:textfield name="username" label="Username"></s:textfield>  
<s:password name="password" label="Password"></s:password>  
  
<s:submit value="Sign Up"></s:submit>  
  
</s:form> 
<hr>
<div class="parent_div">
<a href="index.html"> <button class="button-m" role="button">Go Back</button></a>
<div class="parent_div">

</body>
</html>

 