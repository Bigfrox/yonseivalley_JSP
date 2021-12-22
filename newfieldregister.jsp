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

<title>���ο� �� ���� ���� �Է�</title>
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
		  
		  <h3>������ �������� ������.</h3>
		  
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
		<p> ���ο� ������ ���� ���</p>
		
	</div>
	<form action = 'PurchaseNewField.jsp' method = 'post'>
		<div>
		<label>field ID</label> <input name ="field_ID" type="text" />
		</div>
		
		
		<div>
		<label>vineyard ID</label> <input name = "vineyard_ID" type="text" />
		</div>
		
		
		<div>
			<label>�����ͺ��̽��� ���</label>
			<input type="checkbox" name="register">
		</div>
		<button type="submit">����</button>
	
	
	</form>


</div>
</div>


</body>
</html>