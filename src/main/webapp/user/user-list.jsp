<%@page import="java.sql.ResultSet"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<table border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<%
		Connection con = DBCon.getCon();
		Statement stmt = con.createStatement();
		String sql = " SELECT UI_NUM, UI_ID, UI_PWD, UI_NAME FROM USER_INFO";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
		%>	
		<tr>
			<td><%=rs.getInt("UI_NUM")%></td>
			<td><%=rs.getString("UI_ID")%></td>
			<td><%=rs.getString("UI_PWD")%></td>
			<td><%=rs.getString("UI_NAME")%></td>
		</tr>
		<%
		}
		%>
<tr>
	<label for="uiId">아이디</label>
	<td colspan="5" align="right"><button onclick= "location.href='/web/board/user-insert.jsp'">등록</button>
</tr>

	</table>
</body>
</html>