<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<html>
  <head>
  <%@page import="java.net.*"%>
  <%@page import="java.io.*"%>
  <%@page import="java.util.*"%>
  <%@page import="java.util.stream.*"%>
  
    <meta http-equiv="contentType" content="text/html"; charset="UTF-8">
    <title>Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
<body>
<%   
URL url = null;
HttpURLConnection con = null;
InputStream inp = null;
OutputStream outp = null;
File fileDownload = null;

    String home = System.getProperty("user.home");
	
	fileDownload = new File(home+"/Downloads/", "HowToUse.txt");
    url = new URL("http://localhost:8080/FYP/Guidelines_and_Sample_data.txt");
    con = (HttpURLConnection)url.openConnection();
    try {
        inp = con.getInputStream();
        try {
            outp = new FileOutputStream(fileDownload);
            try {
                byte buf[] = new byte[4096];
                for (int n = inp.read(buf); n > 0; n = inp.read(buf)) {
                    outp.write(buf, 0, n);
                }
            } finally {
                outp.close();
            }
        } finally {
            inp.close();
        }
    } finally {
        con.disconnect();
    }  
%>

<div align="center" class="green">
<hr>
<h4>User guide downloaded.</h4>
<hr>

<a href="fileup.jsp"> <button class="button-m" role="button">Go Back</button></a>
</body>
<style>
.green {
  margin: auto;
  width: 50%;
  border: 3px solid green;
  padding: 10px;
}
</style>   
 </body>
</html> 