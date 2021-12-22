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
<title>���̳ʸ� �Ǹų��� ���</title>
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
		  
		  <h3>�Ǹų��� ���</h3>
	
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	ResultSet result = null;
	
	String winery_ID = request.getParameter("winery_ID");
	
	Connection conn = null;
	Statement stmt = null;
	
	
	String query = "select winery_ID, title, amount, year,category_ID, standardprice from winetrade natural join winecategory where winery_ID='"+winery_ID+"';";
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
%>

		<table border="1">
			<th>winery ID</th>
			<th>title</th>
			<th>amount</th>
			<th>year</th>
			<th>category_ID</th>
			<th>ǥ�ذ���</th>

			
			
			
			
		
<%	
		while(result.next()){
			
%>
		<tr>
			<td><%=result.getNString(1) %></td>
			
			<td><%=result.getNString(2) %></td>
			
			<td><%=result.getInt(3) %></td>
			
			<td><%=result.getInt(4) %></td>
			
			<td><%=result.getNString(5) %></td>
			
			<td><%=result.getInt(6) %></td>
			
			
		</tr>
		
			
<%
		}
%>
</table>




	<div>
	<h1>����!</h1>
	<p>
		���������� �����ͺ��̽� <%=dbName %>�� �����Ͽ����ϴ�.
	<p class="lead">
	������ SQL Statement : 
	<%=query %>
	
	</div>
	
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
</div>
</div>
</body>
</html>