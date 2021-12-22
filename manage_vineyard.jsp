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
<title>YONSEIVALLEY</title>
	
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
		
		
		String print_field = "./print_field.jsp";
		String print_vineyard = "./print_vineyard.jsp";
		String newfieldregister = "./newfieldregister.jsp";
		
		
	%>

	
	

<input type="button" value="밭 목록 출력" onclick="location.href='<%=print_field%>'">
<input type="button" value="포도농장 목록 출력" onclick="location.href='<%=print_vineyard%>'">
<input type="button" value="새로운 밭 구매" onclick="location.href='<%=newfieldregister%>'">
		  
		</div>
		
	</div>


	
	

</body>
</html>