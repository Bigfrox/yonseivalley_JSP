<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<h2>JDBC����̹� �׽�Ʈ </h2>

<%
  Connection conn=null;

  try{
	 String jdbcUrl = "jdbc:mariadb://localhost:3306/yonseivalley";
     String dbId = "root";
     String dbPass = "toor";
	
	 Class.forName("org.mariadb.jdbc.Driver");
	 conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 out.println("����� ����Ǿ����ϴ�.");
  }catch(Exception e){ 
	 e.printStackTrace();
  }
%>
