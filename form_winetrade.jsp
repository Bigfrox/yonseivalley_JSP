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

<title>���� �Ǹ� ���� �Է�</title>
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
		  
		  <h3>���� �Ǹ� ���� �Է� ���</h3>
	
		<% 
		String winery_ID = request.getParameter("winery_ID");
		%>
	
	<form action = 'add_winery_trade.jsp' method = 'post'>
		<div>
		<label>category ID</label> <input name ="category_ID" type="text" />
		</div>
		<div>
		<label>�Ǹų⵵</label> <input name = "year" type="number" />
		</div>
		
		<div>
		<label>�Ǹŷ�</label> <input name = "amount" type="number" />
		</div>
		
		
		<div>
		<label>���̳ʸ� ID</label> <input name = "winery_ID" type="text" value="<%=winery_ID %>" readonly/>
		</div>
		
		<button type="submit">����</button>
	
	
	</form>
</div>
</div>
</body>
</html>