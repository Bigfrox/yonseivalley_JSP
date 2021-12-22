<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="NewFile.css">
<title>새로운 포도농장 정보 입력</title>
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
	
	
	
	Connection conn = null;
	Statement stmt = null;
	
	
	String query = "select * from field where vineyard_ID is NULL;";
	
	
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
			<th>vineyard ID</th>
			
			
			
		
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
	
	<div>
		<h1>Form</h1>
		<p> 포도농장</p>
		
	</div>
	<form action = 'RegisterNewVineyard.jsp' method = 'post'>
		<div>
		<label>포도농장 ID</label> <input name ="vineyard_ID" type="text" />
		</div>
		<div>
		<label>소유자</label> <input name = "owner" type="text" />
		</div>
		
		<div>
		<label>주소</label> <input name = "address" type="text" />
		</div>
		
		<div>
		<label>전화번호</label> <input name = "tel_number" type="text" />
		</div>
		<div>
		<label>화이트 포도 재고량</label> <input name = "inv_white" type="number" />
		</div>
		
		<div>
		<label>레드 포도 재고량</label> <input name = "inv_red" type="number" />
		</div>
		<div>
		<label>돈</label> <input name = "money" type="number" />
		</div>
		
		<div>
		<label>소유할 밭 ID </label> <input name = "field_ID" type="text"/>
		</div>
		
		
		<div>
			<label>데이터베이스에 등록</label>
			<input type="checkbox" name="register">
		</div>
		<button type="submit">전송</button>
	
	
	</form>
</div>
</div>
</body>
</html>