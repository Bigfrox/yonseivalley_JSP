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
<title>구매중</title>
</head>
<body>
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	ResultSet result = null;
	
	Connection conn = null;
	Statement stmt = null;
	
	String field_ID = request.getParameter("field_ID");
	//String location = request.getParameter("location");
	//int area = Integer.parseInt(request.getParameter("area"));
	//String variety = request.getParameter("variety");
	String vineyard_ID = request.getParameter("vineyard_ID");
	
	int area = 0;
	
	//String insert_value_single = "INSERT INTO field (field_ID, location, area, variety, vineyard_ID) values('"+field_ID+"','"+ location +"',"+area+",'"+variety +"','" +vineyard_ID + "');";
	
	
	String query = "select area from field where field_ID = '" + field_ID +"';";
	String update_field = "update field set vineyard_ID = '" + vineyard_ID + "' where field_ID = '"+ field_ID +"';";
	String update_money = null;
	String price = null;
	
	
	%>

	<%

	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
			
			
		while(result.next()){
			area = result.getInt("area");
			

		}
		
		price = Integer.toString(area*10);
		update_money = "update vineyard set money = money -"+ price +" where vineyard_ID='" + vineyard_ID + "';";
%>


	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>에서 수정하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=query %>
	
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
		stmt.executeUpdate(update_field);
	
%>

	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>에서 수정하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=update_field %>
	
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
		stmt.executeUpdate(update_money);
	
%>

	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>에서 수정하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=update_money %>
	
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