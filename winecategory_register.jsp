<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="NewFile.css">
<title>새로운 와인 종류 테이블 등록</title>
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
		  
		  <h3>wine category 와인 종류 테이블 등록</h3>
	
	<form action = 'newCategory.jsp' method = 'post'>
		<div>
		<label>카테고리 ID</label> <input name ="category_ID" type="text" />
		</div>
		<div>
		<label>이름</label> <input name = "title" type="text" />
		</div>
		
		<div>
		<label>표준가격</label> <input name = "standardPrice" type="number" />
		</div>		
		
		<div>
			<label>데이터베이스에 등록</label>
			<input type="checkbox" name="register">
		</div>
		<button type="submit">전송</button>
	
	
	</form>
</div>
</div>

</body>
</html>