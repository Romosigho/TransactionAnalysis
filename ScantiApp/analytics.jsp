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
	h3 {
		text-shadow: 2px 2px #000C66;
	}
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
<h1 style="color:white;"><center>Your Scan Analytics<center></h1>
<hr>
<h3 style="color:white;">Card Appearances & Activity within classes</h3>
<form class="form-inline" method="post" action="graphs.jsp">
    <button type="submit" name="save" class="btn btn-primary">View Charts</button>
</form>
<hr>

<h3 style="color:white;">Total Number of Unique Credit Cards uploaded</h3>
<table border="1" id="7">
<tr>
<td>Credit Cards</td>
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select COUNT(distinct CardNumber) as Count from transactions";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
n = Integer.parseInt(resultSet.getString(1)); 
%>
<tr>
<td><%=resultSet.getString("Count") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e10) {
e10.printStackTrace();
}
%>
</table>
<hr>
<p>

<h3 style="color:white;">General Probability of Credit Card appearances in each class</h3>
<h3 style="color:white;">(1.0 = 100% of unique credit cards)</h3>
<table border="1" id="6">
<tr>
<td>Same Description (>1)</td>
<td>Same Deposited (>1)</td>
<td>Same Withdrawn (>1)</td>
<td>Same Date (>1)</td>
</tr>

<!--Count of cases when card number is flagged in training set -->
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select (select COUNT(distinct CardNumber) as Count1 from frequent_desc where frequent_desc.CardNumber in (select CardNumber from transactions)), (select COUNT(distinct CardNumber) as Count2 from frequent_deposit where Deposit NOT LIKE '0.0' AND Deposit NOT LIKE '€0.0' AND frequent_deposit.CardNumber in (select CardNumber from transactions)), (select COUNT(distinct CardNumber) as Count3 from frequent_withdraw where Withdrawal NOT LIKE '0.0' AND Withdrawal NOT LIKE '€0.0' AND frequent_withdraw.CardNumber in (select CardNumber from transactions)), (select COUNT(distinct CardNumber) as Count4 from same_date where same_date.CardNumber in (select CardNumber from transactions))";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
Description = Integer.parseInt(resultSet.getString(1)); 
Deposit = Integer.parseInt(resultSet.getString(2));
WithD = Integer.parseInt(resultSet.getString(3));
SameDate = Integer.parseInt(resultSet.getString(4)); 

float p1Desc = (float)Description/n;
float p1Depo = (float)Deposit/n;
float p1With = (float)WithD/n;
float p1Date = (float)SameDate/n;

int Desc2 = n-Description;
int Depo2 = n-Deposit;
int With2 = n-WithD;
int Date2 = n-SameDate;

float p2Desc = (float)Desc2/n;
float p2Depo = (float)Depo2/n;
float p2With = (float)With2/n;
float p2Date = (float)Date2/n;

int total_flagged = Description+Deposit+WithD+SameDate;
%>
<tr>
<td><%=p1Desc %></td>
<td><%=p1Depo %></td>
<td><%=p1With %></td>
<td><%=p1Date %></td>
</tr>
<tr>
<td><%=Description + "/" + n +" cards"%></td>
<td><%=Deposit + "/" + n +" cards"%></td>
<td><%=WithD + "/" + n +" cards"%></td>
<td><%=SameDate + "/" + n +" cards"%></td>
</tr>
</table>

<p>
<table border="1" id="7">
<tr>
<td>Unique Description (=1)</td>
<td>Unique Deposited (=1)</td>
<td>Unique Withdrawn (=1)</td>
<td>Unique Date (=1)</td>
</tr>
<tr>
<td><%=p2Desc %></td>
<td><%=p2Depo %></td>
<td><%=p2With %></td>
<td><%=p2Date %></td>
</tr>
<tr>
<td><%=n-Description + "/" + n +" cards"%></td>
<td><%=n-Deposit + "/" + n +" cards"%></td>
<td><%=n-WithD + "/" + n +" cards"%></td>
<td><%=n-SameDate + "/" + n +" cards"%></td>
</tr>
</table>
<%
}
connection.close();
} catch (Exception e11) {
e11.printStackTrace();
}
%>
<hr>
<h3 style="color:white;">Average Deposit (>0.0)</h3>
<p>
<table border="1" id="1">
<tr>
<td>Average Deposit</td>
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="SELECT ROUND(AVG(Deposit), 2) AS average FROM transactions WHERE Deposit <> 0.0;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("average") %></td>

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
</table>
<hr>
<h3 style="color:white;">Average Withdrawal (>0.0)</h3>
<p>
<table border="1" id="1">
<tr>
<td>Average Withdrawal</td>
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="SELECT ROUND(AVG(Withdrawal), 2) AS average2 FROM transactions WHERE Withdrawal <> 0.0;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("average2") %></td>

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
</table>

<hr>
<p>
<h3 style="color:white;">Search for a Transaction</h3>
<p>
<form class="form-inline" method="post" action="searchresults.jsp">
    <input type="text" name="CardNumberS" class="form-control" placeholder="Card Number" autocomplete="off">
	<input type="text" name="DateOfS" class="form-control" placeholder="Date" autocomplete="off">
	<input type="text" name="DescriptionS" class="form-control" placeholder="Description" autocomplete="off">
	<p>
    <input type="submit" value="Search">
</form>

<br>
<div class="parent_div">
<center><a href="report.jsp"> <button class="button-m" role="button">Go Back</button></a></center>
</div>

</body>
  </html>