<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>SCANTI - Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
<body>
<br>
<h1 style="color:white;">New Transaction</h1>
<br>
<hr>
<div align="center">
<h3 style="color:white;">Upload a CSV/Text File (25mb max)</h3>
<h4 style="color:white;"> FILES MUST BE UPLOADED USING A SPECIFIC FORMAT</h4>
<h4 style="color:white;"> DOWNLOAD AND READ THROUGH USER GUIDE FILE BELOW BEFORE USE</h4>
<P>
<hr>
  <s:form action="fileInput" method="post" enctype="multipart/form-data">

      <s:file accept=".csv,text/csv,.txt" label="File" name="fileUpload"/>
      <s:submit value="Upload" method="execute"/>

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