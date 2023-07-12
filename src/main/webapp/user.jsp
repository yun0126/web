
<%@page import="java.sql.*"%>
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
	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://localhost:3306/kd";
	String user = "root";
	String password = "kd1824java";
	Connection con = DriverManager.getConnection(url, user, password);
	out.println("내가 나오면 에러는 없는거야!");

	Statement stmt = con.createStatement();
	String sql = "SELECT * FROM USER_INFO";
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<%="<tr>"%>
		<%="<td>" + rs.getInt("UI_NUM") + "</td>"%>
		<%="<td>" + rs.getString("UI_TITLE") + "</td>"%>
		<%="<td>" + rs.getString("UI_CNT") + "</td>"%>
		<%="</tr>"%>
		<%
		}
		%>

		<tr>
			<td colspan="4" align=center><button>등록</button></td>
		</tr>
</body>
</html>