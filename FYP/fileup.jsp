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
<h5>Upload a File (25mb max)</h5>
<b><h5> CSV FILES MUST BE UPLOADED USING THE FOLLOWING FORMAT:</h5></b>
<P>
<h5><b> Card Number,Date,Description,Date of completion,Withdrawal,Deposit,Balance</h5>
<hr>
  <s:form 
    action="fileAction" method="post" enctype="multipart/form-data">

      <s:file name="fileUpload" label="File"/>
      <s:submit value="Submit" align="center"></s:submit>

  </s:form>
  
</div>
<hr>

</body>
</html>