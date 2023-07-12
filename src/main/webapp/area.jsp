<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! %>
<%
String str1 = "hello";
String str2 = "hello";
out.print(str1==str2);
out.print(str1);
%>

<%=(str1==str2) %>
<%=str1 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>