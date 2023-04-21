<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
<body>
<div align="center" class="green">
<hr>
<h5><s:property value="fileUpload"/> was uploaded successfully.</h5>
<hr>

<a href="report.jsp"> <button class="button-m" role="button">Get Analysis</button></a>
<a href="tasks.html"> <button class="button-m" role="button">Go Back</button></a>
</body>
<style>
.green {
  margin: auto;
  width: 50%;
  border: 3px solid green;
  padding: 10px;
}
</style>
</html>