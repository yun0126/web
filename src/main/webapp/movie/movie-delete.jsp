<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.web.common.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<%
String miNum = request.getParameter("miNum");

Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
String sql ="DELETE FROM MOVIE_INFO WHERE MI_NUM";
int result = stmt.executeUpdate(sql);
if(result == 1){
%>
<script>
	alert("삭제 되었습니다.");
	location.href="/web/movie/movie-list.jsp";
</script>
<%
	}
%>

<table border ="1">
	

</table>
</body>
</html>