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
<jsp:include page="/include/header.jsp"/>
<%
String uiId = request.getParameter("uiId");
if(uiId != null && uiId.length() != 0){
	out.println("uiId : " + uiId);
	String uiPwd = request.getParameter("uiPwd");
	out.println("uiPwd : " + uiPwd);
	String uiName = request.getParameter("uiName");
	out.println("uiName : " + uiName);
	
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "INSERT INTO user_info(UI_ID, UI_PWD, UI_NAME)";
	sql += " values('" + uiId + "','" + uiPwd + "','" + uiName + "')";
	int result = stmt.executeUpdate(sql);
	if(result == 1){
	%>
	<script>
	alert("작성이 완료 되었다 !");
	location.href="/web/board/user-list.jsp";
	</script>
	<%	
	}
}
%>
<form>
<table border="1">
	<tr>
		<th>아이디</th>
		<td><input type="text" id="uiId" name="uiId"></td>
	</tr>
		<tr>
		<th>비밀번호</th>
		<td><input type="text" id="uiPwd" name="uiPwd"></td>
	</tr>
		<tr>
		<th>이름</th>
		<td><input type="text" id="uiName" name="uiName"></td>
	</tr>
	<tr>
		<th colspan="2"><button>등록</button>
	</tr>
</table>
</form>

</body>
</html>