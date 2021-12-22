<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="NewFile.css">
<title>생산중</title>
</head>
<body>
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	ResultSet result = null;
	
	String field_ID = request.getParameter("field_ID");
	String amount =request.getParameter("prod_amount");
	
	Connection conn = null;
	Statement stmt = null;
	
	String query_white = "update vineyard v natural join field f set v.inv_white = v.inv_white+f.area where f.variety='White' and field_ID ='"+ field_ID +"';";
	String query_red = "update vineyard v natural join field f set v.inv_red = v.inv_red+f.area where f.variety='Red' and field_ID ='"+ field_ID +"';";
	
	
	int year = 2021;
	String GP_ID = "GP"+Integer.toString(year)+field_ID.substring(2);
	String query_record_to_production = "INSERT INTO grapeproduction (GP_ID, year, amount, field_ID) values('"+GP_ID+"',"+ year +","+amount+", '"+ field_ID + "');";
	
	

	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(query_white);
	
%>

	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>에서 수정하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=query_white %>
	
	<%
		System.out.println("Success");
	} catch (SQLException se){
		se.printStackTrace();
		
	} finally {
		try{
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}
	%>
	
	<%

	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(query_red);
	
%>

	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>에서 수정하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=query_red %>
	
	<%
		System.out.println("Success");
	} catch (SQLException se){
		se.printStackTrace();
		
	} finally {
		try{
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}
	%>
	
	
	
	
	
	<%

	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(query_record_to_production);
	
%>

	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>에서 수정하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=query_record_to_production %>
	
	<%
		System.out.println("Success");
	} catch (SQLException se){
		se.printStackTrace();
		
	} finally {
		try{
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}
	%>

</body>
</html>