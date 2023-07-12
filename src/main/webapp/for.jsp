<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String[] strs = {"홍길동","김길동","임꺽정"};
for(int i=0; i<strs.length; i++) {
	out.println(strs[i] + "<br>");
}
%>
</body>
</html>