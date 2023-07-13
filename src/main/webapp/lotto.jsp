<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border = "1">
<%
List<Integer> lotto = new ArrayList<>();
Random r = new Random();

for (int i=0; i<5; i++) {
	int rNum = r.nextInt(45)+1;
	lotto.add(rNum);
}
for (int i=0; i<lotto.size(); i++) {
out.println("<tr>");
out.println("<td>" + lotto.get(i) + "</td>");
out.println("</tr>");
}
%>

</table>
</body>
</html>