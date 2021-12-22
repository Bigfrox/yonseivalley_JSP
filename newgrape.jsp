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


<title>포도 구매 정보 입력</title>
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
		  
		  <h3>포도 구매</h3>
	<form action = 'purchasegrape.jsp' method = 'post'>
		<div>
		<label>구매할 와이너리 ID</label> <input name ="winery_ID" type="text" />
		</div>
		<div>
		<label>화이트포도 구매량</label> <input name = "inv_white" type="number" />
		</div>
		
		<div>
		<label>레드포도 구매량</label> <input name = "inv_red" type="number" />
		</div>
		
		
		
		<div>
			<label>데이터베이스에 등록</label>
			<input type="checkbox" name="register">
		</div>
		<button type="submit">전송</button>
	
	
	</form>

</body>
</html>