<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구매한 포도 등록</title>
</head>
<body>
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	
	
	
	
	Connection conn = null;
	Statement stmt = null;
	
	String winery_ID = request.getParameter("winery_ID");
	int num_white = Integer.parseInt(request.getParameter("inv_white"));
	int num_red = Integer.parseInt(request.getParameter("inv_red"));
	
	
	String update_query = "update winery set inv_white = inv_white+"+num_white+", inv_red = inv_red+"+num_red+", money = money - "+(num_white+num_red) +" where winery_ID='"+winery_ID+"';";
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(update_query);
	
%>

	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>에서 수정하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=update_query %>
	
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