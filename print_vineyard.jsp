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

<title>�������� ���� ���</title>
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
		  
		  
		  <h3>�������� ��� ���</h3>
	
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	ResultSet result = null;
	ResultSet result2 = null;
	
	
	
	Connection conn = null;
	Statement stmt = null;
	Connection conn2 = null;
	Statement stmt2 = null;
	
	
	//String query = "select * from vineyard;";
	String query = "select vineyard.vineyard_ID, owner,address,tel_number,sum(area), sum(grapetrade.amount), sum(grapeproduction.amount) from grapetrade left join field on grapetrade.vineyard_ID = field.vineyard_ID left join grapeproduction on grapeproduction.field_ID=field.field_ID left join vineyard on field.vineyard_ID = vineyard.vineyard_ID group by vineyard.vineyard_ID;";
	
	
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
%>

		<table border="1">
			<th>vineyard ID</th>
			<th>owner</th>
			<th>address</th>
			<th>tel_number</th>
			<th>�� ���� ����</th>
			<th>�� �ŷ���</th>
			<th>�� ���귮</th>
			
		
<%	
		while(result.next()){
			
%>
		<tr>
			<td><%=result.getNString(1) %></td>
			
			<td><%=result.getNString(2) %></td>
			
			<td><%=result.getNString(3) %></td>
			
			<td><%=result.getNString(4) %></td>
			
			<td><%=result.getInt(5) %></td>
			
			<td><%=result.getNString(6) %></td>
			<td><%=result.getNString(7) %></td>
			
			

			
		</tr>
		
			
<%
		}
%>
</table>

<div>
<h>������ ����</h>
<form action = 'print_single_vineyard.jsp' method = 'post'>
		<div>
		<label>�������� ID</label> <input name ="vineyard_ID" type="text" />
		</div>
		<button type="submit">������ ����</button>
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