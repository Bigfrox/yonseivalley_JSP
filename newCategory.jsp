<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구매한 밭 등록</title>
</head>
<body>
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	
	String update_query = "";
	
	
	Connection conn = null;
	Statement stmt = null;
	
	
	String category_ID = request.getParameter("category_ID");
	String title = request.getParameter("title");
	int standardPrice = Integer.parseInt(request.getParameter("standardPrice"));
	
	
	String insert_value_single = "INSERT INTO winecategory (category_ID, title, standardPrice) values('"+category_ID+"','"+ title +"','"+standardPrice+ "');";
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(insert_value_single);
	
%>

	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>에 등록하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=insert_value_single %>
	
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