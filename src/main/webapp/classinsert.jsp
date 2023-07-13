<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/include/header.jsp" />
	<h3>Class회원가입 페이지</h3>
<%
String ciName = request.getParameter("ciName");
if(ciName != null && ciName.length() != 0) {
	String ciDesc = request.getParameter("ciDesc");
	out.println("ciName : " + ciName);
	out.println("ciDesc : " + ciDesc);
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "INSERT INTO CLASS_INFO(CI_NAME, CI_DESC)";
	sql += " values ('" + ciName + "','" + ciDesc + "')";
	int result = stmt.executeUpdate(sql);
	if(result == 1) {
%>
<script>
alert("<%=ciName%>님 회원가입이 성공하였습니다. 로그인해주세요.");
location.href = "/web/login.jsp";
</script>
<%		
	}
}
%>
<form>
		<label for="ciName">과목이름</label> <input type="text" id="ciName"
			name="ciName"><br> <label for="ciDesc">난이도</label> <input
			type="text" id="ciDesc" name="ciDesc"><br>
		<button>등록</button>
	</form>
</body>
</html>