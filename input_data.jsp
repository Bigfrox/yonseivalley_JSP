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
				<li><a href="./main.jsp">����ȭ��</a></li>
				<li><a href="./about.html">ABOUT</a></li>
				<li><a href="./service.html">SERVICE</a></li>
				<li><a href="./contact.html">CONTACT</a></li>
				</ul>
			</div>
		<div class="intro_town"></div>
		
			
		<div class="bg-text">
		  
		  <h3>������ �׸��� ������.</h3>
	<% 
		String form_free_field = "./form_free_field.jsp";
		String newvineyardform = "./newvineyardform.jsp";
		String form_winery = "./form_winery.jsp";
		String winecategory_register = "./winecategory_register.jsp";
		String winegrade_register = "./winegrade_register.jsp";
		
	%>

<input type="button" value="���ο� �� ����" onclick="location.href='<%=form_free_field%>'">
<input type="button" value="���ο� �������� ���" onclick="location.href='<%=newvineyardform%>'">
<input type="button" value="���ο� ���� ������ ���" onclick="location.href='<%=form_winery%>'">
<input type="button" value="���� ���� ���� ���" onclick="location.href='<%=winecategory_register%>'">
<input type="button" value="���� ��� ���� ���" onclick="location.href='<%=winegrade_register%>'">
	
	</div>
</div>


</body>
</html>