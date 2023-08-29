<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<html>
  <head>
	<%@page import="java.io.FileOutputStream"%>
	<%@page import="java.io.IOException"%>
	<%@page import="java.io.UnsupportedEncodingException"%>
	<%@page import="java.net.URLEncoder"%>
	<%@page import="java.security.SecureRandom"%>
	<%@page import="org.apache.commons.codec.binary.Base32"%>
	<%@page import="com.google.zxing.BarcodeFormat"%>
	<%@page import="com.google.zxing.MultiFormatWriter"%>
	<%@page import="com.google.zxing.WriterException"%>
	<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
	<%@page import="com.google.zxing.common.BitMatrix"%>
	<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
	<%@ page import="javax.servlet.http.*"%>
	<%@ page import="com.opensymphony.xwork2.ActionSupport"%>
	<%@ page import="javax.servlet.http.HttpServletRequest"%>
	<%@ page import="javax.servlet.http.HttpServletResponse"%>
  <meta http-equiv="contentType" content="text/html"; charset="UTF-8">
    <title>SCANTI - Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
<body>
<br>
<img src = "Scanti3.png" width="175" height="150">
<h1 style="color:white;">User Authentication</h1>
	
<br>
<hr>
<h4 style="color:white;">Scan the following code into Google Authenticator:</h4>
<img src = "test.png" width="200" height="200">
<h4 style="color:white;">Once you do this, enter your generated code into the "Authenticator Code" field above.</h4>
<p>
<s:form action="authAction" autocomplete="off">  
<s:textfield name="authenticator1" label="Authenticator Code"></s:textfield> 
  
<s:submit value="Validate"></s:submit>  
  
</s:form> 
<hr>
<p>



<a href="login.jsp"> <button class="button-m" role="button">Go Back</button></a>

 </body>
</html> 