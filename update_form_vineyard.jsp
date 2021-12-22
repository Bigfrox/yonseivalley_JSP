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
<title>포도농장 정보 수정</title>
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
		  
		  <h3>포도농장 정보 수정</h3>
	
	
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	ResultSet result = null;
	
	String vineyard_ID = request.getParameter("vineyard_ID");
	String owner = null;
	String address = null;
	String tel_number = null;
	
	Connection conn = null;
	Statement stmt = null;
	
	
	String query = "select * from vineyard where vineyard_ID ='" + vineyard_ID +"';";
	
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);

		while(result.next()){
			vineyard_ID = result.getNString(1);
			owner = result.getNString(2);
			address = result.getNString(3);
			tel_number = result.getNString(4);
		}
			


%>

	
	<div>
		<h1>Form</h1>
		<p> 포도농장</p>
		
	</div>
	<form action = 'update_detail_vineyard.jsp' method = 'post'>
		<div>
		<label>포도농장 ID</label> <input name ="vineyard_ID" type="text" value="<%=vineyard_ID%>" readonly/>
		</div>
		<div>
		<label>소유자</label> <input name = "owner" type="text"  value="<%=owner%>" />
		</div>
		
		<div>
		<label>주소</label> <input name = "address" type="text" value="<%=address%>" />
		</div>
		
		<div>
		<label>전화번호</label> <input name = "tel_number" type="text" value="<%=tel_number%>" />
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