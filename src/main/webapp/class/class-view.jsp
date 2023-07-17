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
String ciNum = request.getParameter("ciNum");

Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
String sql = "SELECT CI_NUM,CI_NAME,CI_DESC FROM class_info";
sql += " WHERE CI_NUM=" + ciNum;
System.out.println(sql);
ResultSet rs = stmt.executeQuery(sql);
if(!rs.next()) {
%>
<script>
alert('이미 삭제된 게시물입니다.');
history.back();
</script>
<%
	return;
}
%>
<table border="1">
<tr>
			<th>이름</th>
			<td><%=rs.getString("BI_NAME") %></td>
		</tr>
		<tr>
			<th>설명</th>
			<td><%=rs.getString("BI_DESC") %></td>
		</tr>
		<tr>
			<th colspan="2"><button>수정</button> <button onclick= "location.href='/web/board/board-list.jsp">삭제</button></th>
		</tr>
</table>
</body>
</html>