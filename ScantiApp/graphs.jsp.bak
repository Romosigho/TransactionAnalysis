<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<html>
  <head>
  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.ResultSet"%>
  <%@page import="java.sql.Statement"%>
  <%@page import="java.sql.Connection"%>
  <%@page import="java.util.*" %>
  <%@page import="java.io.File" %>
  <%@page import="org.jfree.data.general.DefaultPieDataset" %>
  <%@page import="org.jfree.chart.ChartFactory" %>
  <%@page import="org.jfree.chart.ChartUtils" %>
  <%@page import="org.jfree.chart.JFreeChart" %>
  
  
    <meta charset="UTF-8">
    <title>SCANTI - Transaction Analysis Tool</title>
	<link rel="stylesheet" href="./style.css">
  </head>
  <body>
  <img src = "Scanti3.png" width="175" height="150">
  <hr>
  <p>
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
	DefaultPieDataset dataset = new DefaultPieDataset();
  %> 
  
  <%
	try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement=connection.createStatement();
	String sql = "SELECT DISTINCT CardNumber, Count(*) as Count FROM transactions GROUP BY CardNumber";
	resultSet = statement.executeQuery(sql);
    while (resultSet.next()) 
      { 
		 dataset.setValue(
         resultSet.getString("CardNumber"),
         Double.parseDouble(resultSet.getString("Count")));
      } 
	connection.close();
	} catch (Exception e2) {
	e2.printStackTrace();
	}
	
	JFreeChart chart = ChartFactory.createPieChart("Overall Card Activity", dataset, true, true, false); 
	int width = 560;    
    int height = 370;   
    File pieChart = new File("C:\\Program Files\\apache-tomcat-9.0.68\\webapps\\Scanti\\", "Pie_Chart.jpeg");
    ChartUtils.saveChartAsJPEG(pieChart , chart , width , height);
  %>
 <p>
 <br>
 <center><img src = "Pie_Chart.jpeg" width="560" height="370"></center>
 
 <%
 try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
	
	Connection connection2 = null;
    Statement statement2 = null;
    ResultSet resultSet2 = null;
    DefaultPieDataset dataset2 = new DefaultPieDataset();
 
 try{
	connection2 = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement2=connection2.createStatement();
	String sql2 = "SELECT DISTINCT CardNumber, Count(*) as Count FROM frequent_desc GROUP BY CardNumber";
	resultSet2 = statement2.executeQuery(sql2);
    while (resultSet2.next()) 
      { 
		 dataset2.setValue(
         resultSet2.getString("CardNumber"),
         Double.parseDouble(resultSet2.getString("Count")));
      } 
	connection2.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	
	JFreeChart chart2 = ChartFactory.createPieChart("Same Description", dataset2, true, true, false); 
	int width2 = 560;    
    int height2 = 370;   
    File pieChart2 = new File("C:\\Program Files\\apache-tomcat-9.0.68\\webapps\\Scanti\\", "Chart2.jpeg");
    ChartUtils.saveChartAsJPEG(pieChart2 , chart2 , width2 , height2);
  %> 
  <p>
  <br>
 <center><img src = "Chart2.jpeg" width="560" height="370"></center>
 
 <%
 try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
	
	Connection connection3 = null;
    Statement statement3 = null;
    ResultSet resultSet3 = null;
    DefaultPieDataset dataset3 = new DefaultPieDataset();
 
 try{
	connection3 = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement3=connection3.createStatement();
	String sql3 = "SELECT DISTINCT CardNumber, Count(*) as Count FROM frequent_deposit GROUP BY CardNumber";
	resultSet3 = statement3.executeQuery(sql3);
    while (resultSet3.next()) 
      { 
		 dataset3.setValue(
         resultSet3.getString("CardNumber"),
         Double.parseDouble(resultSet3.getString("Count")));
      } 
	connection3.close();
	} catch (Exception e3) {
	e3.printStackTrace();
	}
	
	JFreeChart chart3 = ChartFactory.createPieChart("Same Deposit", dataset3, true, true, false); 
	int width3 = 560;    
    int height3 = 370;   
    File pieChart3 = new File("C:\\Program Files\\apache-tomcat-9.0.68\\webapps\\Scanti\\", "Chart3.jpeg");
    ChartUtils.saveChartAsJPEG(pieChart3 , chart3 , width3 , height3);
  %> 
  <p>
  <br>
 <center><img src = "Chart3.jpeg" width="560" height="370"></center>
 
  <%
 try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
	
	Connection connection4 = null;
    Statement statement4 = null;
    ResultSet resultSet4 = null;
    DefaultPieDataset dataset4 = new DefaultPieDataset();
 
 try{
	connection4 = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement4=connection4.createStatement();
	String sql4 = "SELECT DISTINCT CardNumber, Count(*) as Count FROM frequent_withdraw GROUP BY CardNumber";
	resultSet4 = statement4.executeQuery(sql4);
    while (resultSet4.next()) 
      { 
		 dataset4.setValue(
         resultSet4.getString("CardNumber"),
         Double.parseDouble(resultSet4.getString("Count")));
      } 
	connection4.close();
	} catch (Exception e4) {
	e4.printStackTrace();
	}
	
	JFreeChart chart4 = ChartFactory.createPieChart("Same Withdraw", dataset4, true, true, false); 
	int width4 = 560;    
    int height4 = 370;   
    File pieChart4 = new File("C:\\Program Files\\apache-tomcat-9.0.68\\webapps\\Scanti\\", "Chart4.jpeg");
    ChartUtils.saveChartAsJPEG(pieChart4 , chart4 , width4 , height4);
  %> 
  <p>
  <br>
 <center><img src = "Chart4.jpeg" width="560" height="370"></center>
 
  <%
 try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
	
	Connection connection5 = null;
    Statement statement5 = null;
    ResultSet resultSet5 = null;
    DefaultPieDataset dataset5 = new DefaultPieDataset();
 
 try{
	connection5 = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement5=connection5.createStatement();
	String sql5 = "SELECT DISTINCT CardNumber, Count(*) as Count FROM same_date GROUP BY CardNumber";
	resultSet5 = statement5.executeQuery(sql5);
    while (resultSet5.next()) 
      { 
		 dataset5.setValue(
         resultSet5.getString("CardNumber"),
         Double.parseDouble(resultSet5.getString("Count")));
      } 
	connection5.close();
	} catch (Exception e5) {
	e5.printStackTrace();
	}
	
	JFreeChart chart5 = ChartFactory.createPieChart("Same Date", dataset5, true, true, false); 
	int width5 = 560;    
    int height5 = 370;   
    File pieChart5 = new File("C:\\Program Files\\apache-tomcat-9.0.68\\webapps\\Scanti\\", "Chart5.jpeg");
    ChartUtils.saveChartAsJPEG(pieChart5 , chart5 , width5 , height5);
  %> 
  <p>
  <br>
 <center><img src = "Chart5.jpeg" width="560" height="370"></center>
			
  <div class="parent_div">
<a href="analytics.jsp"> <button class="button-m" role="button">Go Back</button></a>
</div>

</body>
  </html>