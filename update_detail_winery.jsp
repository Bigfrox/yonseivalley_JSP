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
<title>와이너리 정보 수정</title>
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

	String winery_ID = request.getParameter("winery_ID");
	String owner = request.getParameter("owner");
	String address = request.getParameter("address");
	String tel_number = request.getParameter("tel_number");
	String grade_ID = request.getParameter("grade_ID");
	String vineyard_ID = request.getParameter("vineyard_ID");
	
	
	String query = "update winery set owner ='" + owner + "', address ='" + address +"', tel_number='"+ tel_number +"', grade_ID='"+ grade_ID +"' where winery_ID = '" + winery_ID + "';";
	
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);

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

<div>
	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>를 수정하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=query %>
	
	</div>
	

</body>
</html>