<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구매한 밭 등록</title>
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
	
	
	String vineyard_ID = request.getParameter("vineyard_ID");
	String owner = request.getParameter("owner");
	String address = request.getParameter("address");
	String tel_number = request.getParameter("tel_number");
	int inv_white = Integer.parseInt(request.getParameter("inv_white"));
	int inv_red = Integer.parseInt(request.getParameter("inv_red"));
	int money = Integer.parseInt(request.getParameter("money"));
	
	String field_ID = request.getParameter("field_ID");
	String location = null;
	int area = 0;
	String variety = null;	
	
	String query = "select * from field where field_ID ='" + field_ID + "';";
	
	String insert_vineyard = "INSERT INTO vineyard (vineyard_ID,owner,address,tel_number,inv_white,inv_red,money) values('" + vineyard_ID + "', '" +owner+"','" + address + "','"+tel_number+"', " + inv_white+ "," +inv_red+ ","+money+ ");";
	
	
	//insert into vineyard
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(insert_vineyard);
		
		
	
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
	
	//select from field
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
		System.out.println("Success@@@@@@@@@@@");
		
		
		location = result.getNString(2);
		//System.out.println("location : "+location);
		area = result.getInt(3);
		variety = result.getNString(4);		
	
		
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
	//System.out.println("[*]location : "+location);
	String update_query = "update field set vineyard_ID='" + vineyard_ID + "' where field_ID='"+ field_ID +"';";
	//update field
		try{
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			stmt.executeUpdate(update_query);
			
			
		
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
	<%=update_query %>
	
	
</body>
</html>