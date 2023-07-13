<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!String str = "1";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<%
	for (int i = 1; i <= 9; i++) {
		out.println("<tr>");
		for (int j = 1; j <= 9; j++) {
			out.println("<td>" + i + "X" + j + "=" + (i*j) + "</td>");
		}
		out.println("</tr>");
	}
%>
	</table>
</body>
</html>