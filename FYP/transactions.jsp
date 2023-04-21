<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib uri="/struts-tags" prefix="s" %>  

<head>
    <meta http-equiv="contentType" content="text/html"; charset="UTF-8">
    <title>Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>

<body>
<h1>Uploaded File</h1>

<p> <s:property value="uploadedFileName"/> was uploaded successfully. </p>

<h2>
   File Name : <s:property value="fileUploadFileName"/> 
</h2> 

<h2>
   Content Type : <s:property value="fileUploadContentType"/> 
</h2> 

<h2>
   File : <s:property value="fileUpload"/> 
</h2> 

</body>
</html>