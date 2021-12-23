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
<title>와이너리 상세정보 출력</title>
</head>
<body>

	<div class="wrap">
	<div class="header">
				<ul class="nav">
				<li><a href="./main.jsp">메인화면</a></li>
				<li><a href="./about.html">ABOUT</a></li>
				<li><a href="./service.html">SERVICE</a></li>
				<li><a href="./contact.html">CONTACT</a></li>
				</ul>
			</div>
		<div class="intro_town"></div>
		
			
		<div class="bg-text">
		  
		  <h3>관리할 항목을 고르세요.</h3>
	
<%
	String dbName = "yonseivalley";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/"+dbName;
	String dbUser = "root";
	String dbPass = "toor";
	ResultSet result = null;
	
	String winery_ID = request.getParameter("winery_ID");
	
	Connection conn = null;
	Statement stmt = null;
	
	// select winery_ID, title, amount from wineproduction natural join winecategory;
	//String query = "select * from winery natural left outer join wineinventory where winery_ID ='" + winery_ID +"';";
	String query = "select winery.winery_ID,owner,address,tel_number,inv_white,inv_red,money,grade_ID, vineyard_ID, wineinventory.amount as wine_amount, wineproduction.amount as prod_amount, wineproduction.year as prod_year ,winetrade.amount as trade_amount, winetrade.year as trade_year from winery left join wineinventory on winery.winery_ID = wineinventory.winery_ID left join wineproduction on wineproduction.winery_ID=wineinventory.winery_ID left join winetrade on winetrade.winery_ID=wineinventory.winery_ID where winery.winery_ID ='" + winery_ID + "';";
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
%>

		<table border="1">
			<th>winery ID</th>
			<th>owner</th>
			<th>address</th>
			<th>tel_number</th>
			<th>inv white</th>
			<th>inv red</th>
			<th>money</th>
			<th>grade ID</th>
			<th>vineyard ID</th>
			<th>와인 재고</th>
			<th>생산량</th>
			<th>prod_year</th>
			<th>거래량</th>
			<th>trade year</th>
			
			
			
			
		
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
			
			<td><%=result.getNString(8) %></td>
			
			<td><%=result.getNString(9) %></td>
			
			<td><%=result.getInt(10) %></td>
			<td><%=result.getInt(11) %></td>
			<td><%=result.getInt(12) %></td>
			<td><%=result.getInt(13) %></td>
			<td><%=result.getInt(14) %></td>
			
			
		</tr>
		
			
<%
		}
%>
</table>

<div>
<h3>정보 수정</h3>
<form action = 'update_form_winery.jsp' method = 'post'>
		<div>
		<label>와이너리 ID</label> <input name ="winery_ID" type="text" value="<%=winery_ID%>"  />
		</div>
		<button type="submit">수정하기</button>
</form>
</div>


<div>
<h3>와인 생산 목록 출력</h3>
<form action = 'print_produced_list.jsp' method = 'post'>
		<div>
		<label>와이너리 ID</label> <input name ="winery_ID" type="text" value="<%=winery_ID%>"  />
		</div>
		<button type="submit">출력하기</button>
</form>
</div>


<div>
<h3>와인 판매 목록 출력</h3>
<form action = 'print_sell_list.jsp' method = 'post'>
		<div>
		<label>와이너리 ID</label> <input name ="winery_ID" type="text" value="<%=winery_ID%>"  />
		</div>
		<button type="submit">출력하기</button>
</form>
</div>

<div>
<h3>포도 구매하기</h3>
<form action = 'newgrape.jsp' method = 'post'>
		<div>
		<label>와이너리 ID</label> <input name ="winery_ID" type="text" value="<%=winery_ID%>"  />
		</div>
		<button type="submit">구매하기</button>
</form>
</div>

<div>
<h3>생산 정보 추가</h3>
<form action = 'form_wineproduction.jsp' method = 'post'>
		<div>
		<label>와이너리 ID</label> <input name ="winery_ID" type="text" value="<%=winery_ID%>"  />
		</div>
		<button type="submit">생산정보 추가하기</button>
</form>
</div>

<div>
<h3>판매 정보 추가</h3>
<form action = 'form_winetrade.jsp' method = 'post'>
		<div>
		<label>와이너리 ID</label> <input name ="winery_ID" type="text" value="<%=winery_ID%>"  />
		</div>
		<button type="submit">판매정보 추가하기</button>
</form>
</div>

<div>
<h3>판매 내역 수정</h3>
<form action = 'form_update_winetrade.jsp' method = 'post'>
		<div>
		<label>와이너리 ID</label> <input name ="winery_ID" type="text" value="<%=winery_ID%>"  />
		</div>
		<button type="submit">판매 내역 수정하기</button>
</form>
</div>

<div>
<h3>생산 내역 수정</h3>
<form action = 'form_update_wineproduction.jsp' method = 'post'>
		<div>
		<label>와이너리 ID</label> <input name ="winery_ID" type="text" value="<%=winery_ID%>"  />
		</div>
		<button type="submit">생산 내역 수정하기</button>
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