<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<html>
  <head>
    <meta http-equiv="contentType" content="text/html"; charset="UTF-8">
    <title>SCANTI - Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
<body>
<br>
<img src = "Scanti3.png" width="175" height="150">
<h1 style="color:white;">Login as Existing User</h1>
<br>
<hr>
<s:form action="loginAction" autocomplete="off">  
<s:textfield name="username" label="Username"></s:textfield>  
<s:password name="password" label="Password"></s:password>  
  
<s:submit value="Login"></s:submit>  
  
</s:form> 
<hr>
<div class="parent_div">
<a href="index.html"> <button class="button-m" role="button">Go Back</button></a>
<div class="parent_div">
 </body>
</html> 