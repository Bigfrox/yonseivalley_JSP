<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>와인 판매 정보 등록</title>
</head>
<body>
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	
	
	
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet result = null;
	
	
	
	String category_ID = request.getParameter("category_ID");
	String winery_ID = request.getParameter("winery_ID");
	
	int year = Integer.parseInt(request.getParameter("year"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	String WT_ID = "WT"+Integer.toString(year)+winery_ID.substring(2);
	
		
	
	String query = "select * from winetrade where winery_ID ='" + winery_ID + "';";
	
	String insert_winetrade = "INSERT INTO winetrade (WT_ID,category_ID,year,amount,winery_ID) values('" + WT_ID + "', '" +category_ID+"'," + year+ "," +amount+ ",'"+winery_ID+ "');";
	
	
	//insert into winetrade
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(insert_winetrade);
		
		
	
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
	
	//select from winetrade
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
		%>
		
		
		<table border="1">
			<th>WT ID</th>
			<th>category</th>
			<th>판매년도</th>
			<th>판매량</th>
			
			
			
			
			
		
<%	
		while(result.next()){
			
%>
		<tr>
			<td><%=result.getNString(1) %></td>
			
			<td><%=result.getNString(2) %></td>
	
			<td><%=result.getInt(3) %></td>
			<td><%=result.getInt(4) %></td>
			
		</tr>
			
			
<%
		}
%>
</table>
		
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
	
	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>에 등록하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=insert_winetrade %>
	<%=query %>
	
	
</body>
</html>