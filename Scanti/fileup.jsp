<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <meta http-equiv="contentType" content="text/html"; charset="UTF-8">
    <title>Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
<body>
<br>
<h1>New Transaction</h1>
<br>
<hr>
<div align="center">
<h3>Upload a CSV File (25mb max)</h3>
<b><h4> FILES MUST BE UPLOADED USING A SPECIFIC FORMAT</h4></b>
<b><h4> DOWNLOAD USER GUIDE FILE BELOW TO LEARN MORE</h4></b>
<P>
<hr>
  <s:form 
    action="fileAction" method="post" enctype="multipart/form-data">

      <s:file name="fileUpload" label="File"/>
      <s:submit value="Submit" align="center"></s:submit>

  </s:form>
  
</div>
<hr>
<div align="center">
<a href="sample.jsp"><button class="button-m" role="button"><h4><center>Download User Guide</button></a></center></h4>
</div>
<hr>

</body>
</html>