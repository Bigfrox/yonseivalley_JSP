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
<title>포도농장 정보 출력</title>
</head>
<body>
<div class="wrap">
	<div class="intro_bg">
	</div>
</div>
<div>
	<ul class="nav">
		<li><a href="./main.jsp">메인화면</a></li>
		<li><a href="#">ABOUT</a></li>
		<li><a href="#">SERVICE</a></li>
		<li><a href="#">CONTACT</a></li>
	</ul>
	</div>
	
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
	
	
	String query = "select * from vineyard;";
	String query2 = "select sum(area) from field where vineyard_ID = 'VY00500';";
	
	
	
	
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		conn2 = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		PreparedStatement pstmt = conn2.prepareStatement(query2);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
%>

		<table border="1">
			<th>vineyard ID</th>
			<th>owner</th>
			<th>address</th>
			<th>tel_number</th>
			
		
			
			
			
		
<%	
		while(result.next()){
			
%>
		<tr>
			<td><%=result.getNString(1) %></td>
			<%
			//pstmt.setString(1,result.getNString("vineyard"));
			//result2 = pstmt.executeQuery(query2);
			//pstmt.close();
			//conn2.close();
			%>
			
			<td><%=result.getNString(2) %></td>
			
			<td><%=result.getNString(3) %></td>
			
			<td><%=result.getNString(4) %></td>
			

			
		</tr>
		
			
<%
		}
%>
</table>
<div>
<h>통계 요약정보</h>
<form action = 'vineyard_summary.jsp' method = 'post'>
		<div>
		<label>포도농장 ID</label> <input name ="vineyard_ID" type="text" />
		</div>
		<button type="submit">통계요약정보 보기</button>
</div>

<div>
<h>상세정보 보기</h>
<form action = 'print_single_vineyard.jsp' method = 'post'>
		<div>
		<label>포도농장 ID</label> <input name ="vineyard_ID" type="text" />
		</div>
		<button type="submit">상세정보 보기</button>
</div>
<%
//<input type="button" value="상세정보 보기" onclick="location.href='./print_single_vineyard.jsp'">
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
	
</body>
</html>