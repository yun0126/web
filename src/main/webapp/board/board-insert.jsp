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
String biTitle = request.getParameter("biTitle");
if(biTitle != null && biTitle.length() != 0){
	out.println("biTitle : " + biTitle);
	String biContent = request.getParameter("biContent");
	out.println("biContent : " + biContent);
	String biWriter = request.getParameter("biWriter");
	out.println("biWriter : " + biWriter);
	String biCredat = request.getParameter("biCredat");
	out.println("biCredat : " + biCredat);
	String biCnt = request.getParameter("biCnt");
	out.println("biCnt : " + biCnt);
	
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "INSERT INTO BOARD_INFO(BI_TITLE, BI_CONTENT, BI_WRITER, BI_CREDAT, BI_CNT)";
	sql += " values('" + biTitle + "','" + biContent + "','" + biWriter + "',NOW(),0)";
	int result = stmt.executeUpdate(sql);
	if(result == 1){
	%>
	<script>
	alert("작성이 완료되었습니다.");
	location.href="/web/board/board-list.jsp";
	</script>
	<%	
	}
}
%>
<form>
<table border="1">

	<tr>
		<th>제목</th>
		<td><input type="text" id="biTitle" name="biTitle"></td>
	</tr>
		<tr>
		<th>내용</th>
		<td><textarea id="biContent" name="biContent" style="resize:none" cols="30" rows="15"></textarea></td>
	</tr>
		<tr>
		<th>작성자</th>
		<td><input type="text" id="biWriter" name="biWriter"></td>
	</tr>
	<tr>
		<th colspan="2"><button>등록</button>
	</tr>
</table>

</form>
</body>
</html>