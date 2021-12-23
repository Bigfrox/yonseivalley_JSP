<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="NewFile.css">


<title>���̳ʸ� ���� ���</title>
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
		<div class="intro_wine"></div>
		
			
		<div class="bg-text">
		  
		  <h3>������ �׸��� ������.</h3>

	
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	ResultSet result = null;
	
	
	
	Connection conn = null;
	Statement stmt = null;
	
	
	//String query = "select * from winery;";
	
	String query = "select winery.winery_ID,owner,address,tel_number,grade_ID, sum(wineproduction.amount), sum(winetrade.amount) from winery left join wineproduction on winery.winery_ID = wineproduction.winery_ID left join winetrade on winery.winery_ID = winetrade.winery_ID group by winery_ID;";
	
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
%>

		<table border="1">
			<th>winery ID</th>
			<th>������</th>
			<th>�ּ�</th>
			<th>����ó</th>
			<th>������ ���</th>
			<th>�ѻ��귮</th>
			<th>�Ѱŷ���</th>
			
			
			
			
		
<%	
		while(result.next()){
			
%>
		<tr>
			<td><%=result.getNString(1) %></td>
			
			<td><%=result.getNString(2) %></td>
			
			<td><%=result.getNString(3) %></td>
			
			<td><%=result.getNString(4) %></td>
			
			<td><%=result.getNString(5) %></td>
			<td><%=result.getInt(6) %></td>
			<td><%=result.getInt(7) %></td>
			
		</tr>
			
			
<%
		}
%>
</table>
<h>������ ����</h>
<form action = 'print_single_winery.jsp' method = 'post'>
		<div>
		<label>���̳ʸ� ID</label> <input name ="winery_ID" type="text" />
		</div>
		<button type="submit">������ ����</button>
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