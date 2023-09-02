<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<html>
  <head>
  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.ResultSet"%>
  <%@page import="java.sql.Statement"%>
  <%@page import="java.sql.Connection"%>
  
    <meta charset="UTF-8">
    <title>SCANTI - Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
  <style>
	h1 {
		text-shadow: 2px 2px #000C66;
	}
	tr:hover {background-color: #D6EEEE;}
	</style>
  <body>
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
	int n=0, Description=0, Deposit=0, WithD=0, SameDate=0;
  %> 
  <img src = "Scanti3.png" width="175" height="150">
<h1 style="color:white;"><center>Analysis Results<center></h1>
<hr>
<p>

<table border="1" id="1">
<tr>
<td>ID</td>
<td>Card Number</td>
<td>Description</td>
<td>Count</td>

</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from frequent_desc";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("ID") %></td>
<td><%=resultSet.getString("CardNumber") %></td>
<td><%=resultSet.getString("Description") %></td>
<td><%=resultSet.getString("Count") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e2) {
e2.printStackTrace();
}
%>
<%
try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e3) {
      e3.printStackTrace();
    }
	connection = null;
    statement = null;
    resultSet = null;
  %> 

<h3>Cards with multiple transactions to the same address/with the same description (>1)</h3> 
<p>

<table border="1" id="2">
<tr>
<td>ID</td>
<td>Card Number</td>
<td>Deposit</td>
<td>Count</td>
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from frequent_deposit where Deposit NOT LIKE '0.0' AND Deposit NOT LIKE '€0.0'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("ID") %></td>
<td><%=resultSet.getString("CardNumber") %></td>
<td><%=resultSet.getString("Deposit") %></td>
<td><%=resultSet.getString("Count") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e4) {
e4.printStackTrace();
}
%>
<%
try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e5) {
      e5.printStackTrace();
    }
	connection = null;
    statement = null;
    resultSet = null;
%>
<hr> 
<h3>Cards with similar deposited amounts that aren't 0.0 (>1)</h3>
<p>

<table border="1" id="3">
<tr>
<td>ID</td>
<td>Card Number</td>
<td>Withdrawal</td>
<td>Count</td>

</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from frequent_withdraw where Withdrawal NOT LIKE '0.0' AND Withdrawal NOT LIKE '€0.0'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("ID") %></td>
<td><%=resultSet.getString("CardNumber") %></td>
<td><%=resultSet.getString("Withdrawal") %></td>
<td><%=resultSet.getString("Count") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e6) {
e6.printStackTrace();
}
%>
<%
try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e7) {
      e7.printStackTrace();
    }
	connection = null;
    statement = null;
    resultSet = null;
%>
<hr> 
<h3>Cards with similar withdrawn amounts that aren't 0.0 (>1)</h3>
<p>

<table border="1" id="4">
<tr>
<td>ID</td>
<td>Card Number</td>
<td>Date</td>
<td>Count</td>

</tr>

<p>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from same_date";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("ID") %></td>
<td><%=resultSet.getString("CardNumber") %></td>
<td><%=resultSet.getString("Date") %></td>
<td><%=resultSet.getString("Count") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e8) {
e8.printStackTrace();
}
%>
<%
try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e9) {
      e9.printStackTrace();
    }
	connection = null;
    statement = null;
    resultSet = null;
%>
<hr> 
<h3>Cards with same start date transactions (>1)</h3>
<p>

<table border="1" id="5">
<tr>
<td>ID</td>
<td>Card Number</td>

</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from flagged_cards";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("ID") %></td>
<td><%=resultSet.getString("CardNumber") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e10) {
e10.printStackTrace();
}
%>
<hr>
<h3>Cards flagged with suspicious activity (>2)</h3>
</table>

<hr>
<br>
<p>
<a href="analytics.jsp"><button class="button-m" role="button">View Analytics</button></a>
<br>
<p>

<div class="parent_div">
<center><a href="downloadrep.jsp"><button class="button-m" role="button"><h4>Download Results</button></a></h4></center>
</div>
</body>
  </html>