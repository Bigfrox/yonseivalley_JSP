<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ���� ���</title>
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
	
	String WP_ID = "WP"+Integer.toString(year)+winery_ID.substring(2);
	
		
	
	String query = "select * from wineproduction where winery_ID ='" + winery_ID + "';";
	
	String insert_wineproduction = "INSERT INTO wineproduction (WP_ID,category_ID,year,amount,winery_ID) values('" + WP_ID + "', '" +category_ID+"'," + year+ "," +amount+ ",'"+winery_ID+ "');";
	
	
	//insert into vineyard
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(insert_wineproduction);
		
		
	
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
	
	//select from wineproduction
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
		%>
		
		
		<table border="1">
			<th>WP ID</th>
			<th>category</th>
			<th>year</th>
			<th>���귮</th>
			
			
			
			
			
		
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
	
	<h1>����!</h1>
	<p>
		���������� �����ͺ��̽� <%=dbName %>�� ����Ͽ����ϴ�.
	<p class="lead">
	������ SQL Statement : 
	<%=insert_wineproduction %>
	<%=query %>
	
	
</body>
</html>