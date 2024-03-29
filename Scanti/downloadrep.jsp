<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<html>
  <head>
  <%@page import="java.net.*"%>
  <%@page import="java.io.*"%>
  <%@page import="java.util.*"%>
  <%@page import="java.util.stream.*"%>
  <%@page import="com.itextpdf.html2pdf.HtmlConverter"%>
  <%@page import="org.apache.commons.io.*"%>
  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.ResultSet"%>
  <%@page import="java.sql.Statement"%>
  <%@page import="java.sql.Connection"%>
  <%@page import="java.time.LocalDateTime"%>
  <%@page import="java.time.format.DateTimeFormatter"%>
  
  
    <meta http-equiv="contentType" content="text/html"; charset="UTF-8">
    <title>SCANTI - Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
<body>
<%   
URL url = null;
HttpURLConnection con = null;
InputStream inp = null;
OutputStream outp = null;
File fileInHtml = null;
HtmlConverter htmlConverter1 = null;

    String home = System.getProperty("user.home");
	
	fileInHtml = new File(home+"/Downloads/", "FinalReport.html");
    url = new URL("http://localhost:8080/Scanti/report.jsp");
    con = (HttpURLConnection)url.openConnection();
    try {
        inp = con.getInputStream();
        try {
            outp = new FileOutputStream(fileInHtml);
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
<%
try {
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH.mm.ss");  
   LocalDateTime now = LocalDateTime.now(); 
				htmlConverter1.convertToPdf(fileInHtml, new File(home+"/Downloads/", "Analysis ("+dtf.format(now)+").pdf"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			FileUtils.getFile(fileInHtml).delete();
%>

<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "auth";
String userid = "root";
String password = "root";

try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
	
	Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
	
try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement=connection.createStatement();
	String sql1 ="drop table transactions";
	String sql2 ="drop table frequent_desc";
	String sql3 ="drop table frequent_deposit";
	String sql4 ="drop table frequent_withdraw";
	String sql5 ="drop table same_date";
	String sql6 ="drop table flagged_cards";
	String sql7 ="create table transactions(ID INT PRIMARY KEY AUTO_INCREMENT, CardNumber varchar(20), Date varchar(9), Description varchar(255), DateOfCompletion varchar(9), Withdrawal varchar(255), Deposit varchar(255), Balance varchar(255))";
	String sql8 ="create table frequent_desc(ID INT PRIMARY KEY AUTO_INCREMENT, CardNumber varchar(20), Description varchar(255), Count varchar(255))";
	String sql9 ="create table frequent_deposit(ID INT PRIMARY KEY AUTO_INCREMENT, CardNumber varchar(20), Deposit varchar(255), Count varchar(255))";
	String sql10 ="create table frequent_withdraw(ID INT PRIMARY KEY AUTO_INCREMENT, CardNumber varchar(20), Withdrawal varchar(255), Count varchar(255))";
	String sql11 ="create table same_date(ID INT PRIMARY KEY AUTO_INCREMENT, CardNumber varchar(20), Date varchar(9), Count varchar(255))";
	String sql12 ="create table flagged_cards(ID INT PRIMARY KEY AUTO_INCREMENT, CardNumber varchar(20))";
	
	statement.addBatch(sql1);
    statement.addBatch(sql2);
    statement.addBatch(sql3);
    statement.addBatch(sql4);
    statement.addBatch(sql5);
    statement.addBatch(sql6);
	statement.addBatch(sql7);
	statement.addBatch(sql8);
	statement.addBatch(sql9);
	statement.addBatch(sql10);
	statement.addBatch(sql11);
	statement.addBatch(sql12);

    statement.executeBatch();

} catch (Exception e1) {
e1.printStackTrace();
}
%>

<div align="center" class="green">
<hr>
<h3 style="color:white;">Analysis downloaded.</h3>
<hr>

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
 </body>
</html> 