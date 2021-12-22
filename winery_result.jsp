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

<title>입력 결과</title>
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
		  
		  <h3>입력 결과</h3>
	<%
		try{
			String winery_ID = request.getParameter("winery_ID");
			String owner = request.getParameter("owner");
			String address = request.getParameter("address");
			String tel_number = request.getParameter("tel_number");
			int inv_white = Integer.parseInt(request.getParameter("inv_white"));
			int inv_red = Integer.parseInt(request.getParameter("inv_red"));
			int money = Integer.parseInt(request.getParameter("money"));
			String grade_ID = request.getParameter("grade_ID");
			String vineyard_ID = request.getParameter("vineyard_ID");
			String redirect = null;
			
			
			
			
			String insert = request.getParameter("register");
			if (insert != null && insert.equals("on")){
				session.setAttribute("winery_ID",winery_ID);
				session.setAttribute("owner",owner);
				session.setAttribute("address",address);
				session.setAttribute("tel_number", tel_number);
				session.setAttribute("inv_white", inv_white);
				session.setAttribute("inv_red", inv_red);
				session.setAttribute("money", money);
				session.setAttribute("grade_ID",grade_ID);
				session.setAttribute("vineyard_ID", vineyard_ID);
				redirect = "winery_register.jsp";
				
			}
			if (redirect != null)
				response.sendRedirect(redirect);
		
	%>
	
	<div>
	<h1>결과</h1>
	<p>
		아이디:
		<%=winery_ID %></p>
	<p>
		소유자:
		<%=owner %></p>
	
	</div>
	<%
		}catch (NumberFormatException e) {%>
		<h1>이런!
		</h1>
		<p>
		올바른 정보를 입력해주세요.
		<%} %>
		
</p>
</div>
</div>
</body>
</html>