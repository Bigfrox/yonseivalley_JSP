<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Welcome</title>
</head>
<body>
	<%
		String user_ID = (String) session.getAttribute("user_ID");
		String user_mail = (String) session.getAttribute("user_name");
		String url = request.getHeader("referer");
	%>
	<h1>ȯ���մϴ�! <%=user_mail %>�� (id: <%=user_ID %>) :)</h1>
	<input type="button" value="���ư���" onclick="location.href='<%=url%>'">
	<%
		System.out.println(url);
	%>

</body>
</html>