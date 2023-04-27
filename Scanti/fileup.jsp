<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <meta http-equiv="contentType" content="text/html"; charset="UTF-8">
    <title>SCANTI - Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
<body>
<br>
<h1>New Transaction</h1>
<br>
<hr>
<div align="center">
<h3>Upload a CSV/Text File (25mb max)</h3>
<b><h4> FILES MUST BE UPLOADED USING A SPECIFIC FORMAT</h4></b>
<b><h4> DOWNLOAD AND READ THROUGH USER GUIDE FILE BELOW BEFORE USE</h4></b>
<P>
<hr>
  <s:form 
    action="fileAction" method="post" enctype="multipart/form-data">

      <s:file name="fileUpload" accept=".csv,text/csv,.txt" label="File"/>
      <s:submit value="Submit" align="center"></s:submit>

  </s:form>
  
</div>
<p>
<hr>
<p>
<div align="center">
<a href="sample.jsp"><button class="button-m" role="button"><h4><center>Download User Guide</button></a></center></h4>
</div>
<p>
<hr>
<p>
<div align="center">
<a href="tasks.html"> <button class="button-m" role="button">Go Back</button></a>
</div>

</body>
</html>