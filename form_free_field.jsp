<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="NewFile.css">
	
<title>���ο� �� ����</title>
</head>
<body>

	<div class="wrap">
	<div class="header">
				<ul class="nav">
				<li><a href="./main.jsp">����ȭ��</a></li>
				<li><a href="./about.html">ABOUT</a></li>
				<li><a href="./service.html">SERVICE</a></li>
				<li><a href="./contact.html">CONTACT</a></li>
				</ul>
			</div>
		<div class="intro_town"></div>
		
			
		<div class="bg-text">
		  
		  <h3>������ �׸��� ������.</h3>
		  <div>
		<h1>Form</h1>
		<p> ���� ���� �� ����</p>
		
	</div>
	<form action = 'make_free_field.jsp' method = 'post'>
		<div>
		<label>�� ID</label> <input name ="field_ID" type="text" />
		</div>
		<div>
		<label>��ġ</label> <input name = "location" type="text" />
		</div>
		
		<div>
		<label>����</label> <input name = "area" type="number" />
		</div>
		<div>
		<label>����ǰ��</label>
			<select name="variety">
				<option value ="Red"> ��������</option>
				<option value ="White"> ȭ��Ʈ����</option>
			</select>
		</div>
		
	
		<button type="submit">����</button>
	
	
	</form>
</div>
</div>



</body>
</html>