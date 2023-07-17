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
String ciName = request.getParameter("ciName");
if(ciName != null && ciName.length() != 0){
	out.println("biTitle : " + ciName);
	String ciDesc = request.getParameter("ciDesc");
	out.println("ciDesc : " + ciDesc);
	
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "INSERT INTO class_info(CI_NAME,CI_DESC)";
	sql += " values('" + ciName + "','" + ciDesc + "')";
	int result = stmt.executeUpdate(sql);
	if(result == 1){
	%>

	<script>
		alert("작성이 등록 되었습니다.");
		location.href = "/web/board/class-list.jsp";
	</script>
	<% 	
	}
}
%>

		<form>
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" id="ciName" name="ciName"></td>
				</tr>
				<tr>
					<th>설명</th>
					<td><textarea id="ciDesc" name="ciDesc" style="resize: none" cols="30" rows="15"></textarea></td>
				</tr>
				<tr>
					<th colspan="2"><button>등록</button>
				</tr>
			</table>
		</form>
		</body>
</html>