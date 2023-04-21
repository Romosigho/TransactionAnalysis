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
    <title>Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
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
  %> 
<h1>Analysis Results</h1>
<hr>
<p>
<div align="center">
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

<h4>Cards with multiple transactions to the same address/with the same description (>1)</h4>
</div>
<p>

<div align="center">
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
String sql ="select * from frequent_deposit";
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
<h4>Cards with similar deposited amounts (>1)</h4>
</div>
<p>

<div align="center">
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
String sql ="select * from frequent_withdraw";
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
<h4>Cards with similar withdrawn amounts (>1)</h4>
</div>
<p>

<div align="center">
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
<h4>Cards with same start date transactions (>1)</h4>
</div>
<p>

<div align="center">
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
<h4>Flagged cards with all of the factors above</h4>
</table>
<hr>
</div>
<div class="parent_div">
<a href="results.jsp"> <button class="button-m" role="button">Go Back</button></a>
<div class="parent_div">
</body>
  </html>