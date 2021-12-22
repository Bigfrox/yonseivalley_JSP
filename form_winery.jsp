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
<title>���ο� ���̳ʸ� ���</title>
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
	
	
	
	Connection conn = null;
	Statement stmt = null;
	
	
	String query = "select * from vineyard where inv_white>0 or inv_red>0;";
	
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
%>

		<table border="1">
			<th>vineyard_ID</th>
			<th>owner</th>
			<th>address</th>
			<th>tel_number</th>
			<th>inv_white</th>
			<th>inv_red</th>
			<th>money</th>
			
			
			
		
<%	
		while(result.next()){
			
%>
			<tr>
				<td><%=result.getNString(1) %></td>
				
				<td><%=result.getNString(2) %></td>
				
				<td><%=result.getNString(3) %></td>
				
				<td><%=result.getNString(4) %></td>
				
				<td><%=result.getInt(5) %></td>
				
				<td><%=result.getInt(6) %></td>
				
				<td><%=result.getInt(7) %></td>
				
				
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
		<h1>���ο� ���̳ʸ� ���</h1>
		
		
	</div>
	<form action = 'winery_result.jsp' method = 'get'>
		<div>
		<label>���̳ʸ� ID</label> <input name ="winery_ID" type="text" />
		</div>
		<div>
		<label>������</label> <input name = "owner" type="text" />
		</div>
		
		<div>
		<label>�ּ�</label> <input name = "address" type="text" />
		</div>
		<div>
		<label>��ȭ��ȣ</label> <input name = "tel_number" type="text" />
		</div>
		
		<div>
		<label>ȭ��Ʈ���� ���</label> <input name = "inv_white" type="number" />
		</div>
		
		<div>
		<label>�������� ���</label> <input name = "inv_red" type="number" />
		</div>
		
		<div>
		<label>��</label> <input name = "money" type="number" />
		</div>
		
		<div>
		<label>���</label><br>
			<input type="radio" name ="grade_ID" value="1-tier" checked> 1���<br>
			<input type="radio" name ="grade_ID" value="2-tier"> 2���<br>
			<input type="radio" name = "grade_ID" value="3-tier"> 3���
		
		</div>
		
		<div>
		<label>vineyard ID</label> <input name ="vineyard_ID" type="text" />
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