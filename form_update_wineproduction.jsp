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
<title>���̳ʸ� ���� ���� ����</title>
</head>
<body>

	<div class="wrap">
	<div class="header">
				<ul class="nav">
				<li><a href="./main.jsp">����ȭ��</a></li>
				<li><a href="./about.html">ABOUT</a></li>
				<li><a href="./service.html">SERVICE</a></li>
				<li><a href="./contact.html">CONTACT</a></li>
				</ul>
			</div>
		<div class="intro_town"></div>
		
			
		<div class="bg-text">
		  
		  <h3>������ �׸��� ������.</h3>
	
	
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	ResultSet result = null;
	
	String winery_ID = request.getParameter("winery_ID");
	String WP_ID = null;
	String category_ID = null;
	int year = 0;
	int amount = 0;
	
	
	Connection conn = null;
	Statement stmt = null;
	
	
	String query = "select * from wineproduction where winery_ID ='" + winery_ID +"';";
	
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
		
		while(result.next()){
			WP_ID = result.getNString(1);
			category_ID = result.getNString("category_ID");
			year = result.getInt("year");
			amount = result.getInt("amount");
			winery_ID = result.getNString("winery_ID");
			
		}
			


%>

	
	<div>
		<h1>Form</h1>
		<p> ���̳ʸ�</p>
		
	</div>
	<form action = 'update_winery_production.jsp' method = 'post'>
		<div>
		<label>WP ID</label> <input name ="WP_ID" type="text" value="<%=WP_ID%>" readonly/>
		</div>
		<div>
		<label>category_ID</label> <input name = "category_ID" type="text"  value="<%=category_ID%>" />
		</div>
		
		<div>
		<label>year</label> <input name = "year" type="number" value="<%=year %>" />
		</div>
		<div>
		<label>amount</label> <input name = "amount" type="number" value="<%=amount %>" />
		</div>
		
		
		<div>
		<label>���̳ʸ� ID</label> <input name = "winery_ID" type="text" value="<%=winery_ID%>"  readonly/>
		</div>
		
		
	
		
		<button type="submit">����</button>
	
	
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