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
<title>밭 정보 수정</title>
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
		  
		  <h3>밭 정보 수정</h3>
	
	
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	ResultSet result = null;
	
	String field_ID = request.getParameter("field_ID");
	String location = null;
	int area = 0;
	String variety = null;
	String vineyard_ID = null;
	
	Connection conn = null;
	Statement stmt = null;
	
	
	String query = "select * from field where field_ID ='" + field_ID +"';";
	
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);

		while(result.next()){
			field_ID = result.getNString(1);
			location = result.getNString(2);
			area = result.getInt(3);
			variety = result.getNString(4);
			vineyard_ID = result.getNString(5);
		}
			


%>

	
	<div>
		<h1>Form</h1>
		<p> 밭</p>
		
	</div>
	<form action = 'update_detail_field.jsp' method = 'post'>
		<div>
		<label>밭 ID</label> <input name ="field_ID" type="text" value="<%=field_ID%>" readonly/>
		</div>
		<div>
		<label>위치</label> <input name = "location" type="text"  value="<%=location%>" />
		</div>
		
		<div>
		<label>면적</label> <input name = "area" type="number" value=<%=area %> />
		</div>
		
		<div>
		<label>품종</label>
			<select>
				<option value ="Red"> 레드포도</option>
				<option value ="White"> 화이트포도</option>
			</select>
		</div>
		
		<div>
		<label>포도농장 ID</label> <input name = "vineyard_ID" type="text" value="<%=vineyard_ID%>"  readonly/>
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