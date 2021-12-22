<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="NewFile.css">
	
<title>새로운 밭 생성</title>
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
		  <div>
		<h1>Form</h1>
		<p> 주인 없는 밭 생성</p>
		
	</div>
	<form action = 'make_free_field.jsp' method = 'post'>
		<div>
		<label>밭 ID</label> <input name ="field_ID" type="text" />
		</div>
		<div>
		<label>위치</label> <input name = "location" type="text" />
		</div>
		
		<div>
		<label>면적</label> <input name = "area" type="number" />
		</div>
		<div>
		<label>생산품종</label>
			<select name="variety">
				<option value ="Red"> 레드포도</option>
				<option value ="White"> 화이트포도</option>
			</select>
		</div>
		
	
		<button type="submit">전송</button>
	
	
	</form>
</div>
</div>



</body>
</html>