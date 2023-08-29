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
<body>
<br>
<img src = "Scanti3.png" width="175" height="150">
<h1>Transaction Analysis Tool</h1> 
<br>
<br>
<br>
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
	
<%
    String CardNumberS=request.getParameter("CardNumberS");
	String DateOfS=request.getParameter("DateOfS");
	String DescriptionS=request.getParameter("DescriptionS");
    try{
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	} catch (Exception e) {
      e.printStackTrace();
    }
%> 

<center><table border="1">
<tr>
<td>Card Number</td>
<td>Date</td>
<td>Description</td>
<td>DateOfCompletion</td>
<td>Withdrawal</td>
<td>Deposit</td>
<td>Balance</td>

</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from transactions WHERE CardNumber='"+CardNumberS+"' OR Date='"+DateOfS+"' OR Description ='"+DescriptionS+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("CardNumber") %></td>
<td><%=resultSet.getString("Date") %></td>
<td><%=resultSet.getString("Description") %></td>
<td><%=resultSet.getString("DateOfCompletion") %></td>
<td><%=resultSet.getString("Withdrawal") %></td>
<td><%=resultSet.getString("Deposit") %></td>
<td><%=resultSet.getString("Balance") %></td>
</tr>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table></center>
<br>

<div class="parent_div">
<a href="analytics.jsp"> <button class="button-m" role="button">Go Back</button></a>
</div>

</body>
  </html>