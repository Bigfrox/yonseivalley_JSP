<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �� ���</title>
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
	
	String query = "select area from field where field_ID = '" + field_ID +"';";
	String price = null;
	String insert_vineyard = null;

	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
			
			
		while(result.next()){
			area = result.getInt("area");
			

		}
		
		price = Integer.toString(area*10);

	
		insert_vineyard = "INSERT INTO vineyard (vineyard_ID,owner,address,tel_number,inv_white,inv_red,money) values('" + vineyard_ID + "', '" +owner+"','" + address + "','"+tel_number+"', " + inv_white+ "," +inv_red+ ","+money+ " - "+price+");";
	
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

	
	<h1>����!</h1>
	<p>
		���������� �����ͺ��̽� <%=dbName %>�� ����Ͽ����ϴ�.
	<p class="lead">
	������ SQL Statement : 
	<%=update_query %>
	
	
</body>
</html>