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
<title>밭 상세정보 출력</title>
</head>
<body>

	<div class="wrap">
	<div class="header">
				<ul class="nav">
				<li><a href="./main.jsp">메인화면</a></li>
				<li><a href="./about.html">ABOUT</a></li>
				<li><a href="./service.html">SERVICE</a></li>
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
	
	Connection conn = null;
	Statement stmt = null;
	
	
	String query = "select * from field where field_ID ='" + field_ID +"';";
	
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
%>

		<table border="1">
			<th>field ID</th>
			<th>location</th>
			<th>area</th>
			<th>variety</th>
			<th>vineyard_ID</th>
			
			
			
			
		
<%	
		while(result.next()){
			
%>
		<tr>
			<td><%=result.getNString(1) %></td>
			
			<td><%=result.getNString(2) %></td>
			
			<td><%=result.getInt(3) %></td>
			
			<td><%=result.getNString(4) %></td>
			
			<td><%=result.getNString(5) %></td>
			
			
		</tr>
		
			
<%
		}
%>
</table>


<div>
<h3>정보 수정</h3>
<form action = 'update_form_field.jsp' method = 'post'>
		<div>
		<label>밭 ID</label> <input name ="field_ID" type="text" value="<%=field_ID%>" readonly />
		</div>
		<button type="submit">수정하기</button>
</form>
</div>

<div>
<h3>생산 내역 수정</h3>
<form action = 'form_update_field_production.jsp' method = 'post'>
		<div>
		<label>밭 ID</label> <input name ="field_ID" type="text" value="<%=field_ID%>" readonly/>
		</div>
		<button type="submit">생산 내역 수정하기</button>
</form>
</div>

	
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