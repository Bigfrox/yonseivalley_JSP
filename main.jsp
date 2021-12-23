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


	
</head>

<title>YONSEIVALLEY</title>
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
		  <h2>Welcome to the</h2>
		  <h1 style="font-size:50px">Yonsei Valley</h1>
		  <p>와인 포도 파는 마을</p>
		</div>
		
	</div>


	<br>
	<br>
	
	<h1>YONSEIVALLEY에 오신 것을 환영합니다.</h1>
<% 
		
		String Manage_vineyard = "./manage_vineyard.jsp";
		String input_data = "./input_data.jsp";
		String Manage_winery = "./manage_winery.jsp";
		String special = "./special.jsp";
		
%>

<input type="button" value="데이터 입력 기능" onclick="location.href='<%=input_data%>'">
<input type="button" value="포도농장 관리" onclick="location.href='<%=Manage_vineyard%>'">
<input type="button" value="와이너리 관리" onclick="location.href='<%=Manage_winery%>'">
<input type="button" value="추가 구현" onclick="location.href='<%=special%>'">


</body>
</html>