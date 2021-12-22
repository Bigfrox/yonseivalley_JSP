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
<title>밭 포도 생산 내역 수정</title>
</head>
<body>

	<div class="wrap">
	<div class="header">
				<ul class="nav">
				<li><a href="./main.jsp">메인화면</a></li>
				<li><a href="./about.html">ABOUT</a></li>
				<li><a href="#">SERVICE</a></li>
				<li><a href="./contact.html">CONTACT</a></li>
				</ul>
			</div>
		<div class="intro_town"></div>
		
			
		<div class="bg-text">
		  
		  <h3>관리할 항목을 고르세요.</h3>
	
	
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	ResultSet result = null;
	
	String field_ID = request.getParameter("field_ID");
	String GP_ID = null;
	
	int year = 0;
	int amount = 0;
	
	
	Connection conn = null;
	Statement stmt = null;
	
	
	String query = "select * from grapeproduction where field_ID ='" + field_ID +"';";
	
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
		
		while(result.next()){
			GP_ID = result.getNString(1);
			year = result.getInt("year");
			amount = result.getInt("amount");
			field_ID = result.getNString("field_ID");
			
		}
			


%>

	
	<div>
		<h1>Form</h1>
		<p> 포도 생산 내역 수정</p>
		
	</div>
	<form action = 'update_field_production.jsp' method = 'post'>
		<div>
		<label>GP ID</label> <input name ="GP_ID" type="text" value="<%=GP_ID%>" readonly/>
		</div>
		
		
		<div>
		<label>year</label> <input name = "year" type="number" value="<%=year %>" />
		</div>
		<div>
		<label>amount</label> <input name = "amount" type="number" value="<%=amount %>" />
		</div>
		
		
		<div>
		<label>밭 ID</label> <input name = "field_ID" type="text" value="<%=field_ID%>"  readonly/>
		</div>
		
		
	
		
		<button type="submit">전송</button>
	
	
	</form>
<%

		
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

</div>
</div>

</body>
</html>