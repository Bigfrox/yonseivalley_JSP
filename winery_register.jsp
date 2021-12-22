<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>REGISTER</title>
</head>
<body>
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	
	String update_query = "";
	
	
	Connection conn = null;
	Statement stmt = null;
	
	
	String winery_ID = (String) session.getAttribute("winery_ID");
	String owner = (String) session.getAttribute("owner");
	String address = (String) session.getAttribute("address");
	String tel_number = (String) session.getAttribute("tel_number");
	int inv_white = (Integer) session.getAttribute("inv_white");
	int inv_red = (Integer) session.getAttribute("inv_red");
	int money = (Integer) session.getAttribute("money");
	String grade_ID = (String) session.getAttribute("grade_ID");
	String vineyard_ID = (String) session.getAttribute("vineyard_ID");
	
	String insert_value_single = "INSERT INTO winery (winery_ID, owner, address, tel_number, inv_white, inv_red,money,grade_ID,vineyard_ID) values('"+winery_ID+"','"+ owner +"','"+address+"','"+tel_number + "',"+ inv_white + ","+inv_red+","+money+",'"+grade_ID +"','" +vineyard_ID + "');";
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(insert_value_single);
	
%>

	<h1>성공!</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName %>에 등록하였습니다.
	<p class="lead">
	수행한 SQL Statement : 
	<%=insert_value_single %>
	
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
	
</body>
</html>