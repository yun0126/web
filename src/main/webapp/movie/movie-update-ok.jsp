<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.web.common.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/include/common.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<%
String miNum = request.getParameter("miNum");
String miTitle = request.getParameter("miTitle");
String miDesc = request.getParameter("miDesc");
String miGenre = request.getParameter("miGenre");
Connection con = DBCon.getCon();
String sql = "UPDATE MOVIE_INFO ";
sql += " SET MI_TITLE=?,";
sql += " MI_DESC=?,";
sql += " MI_GENRE=? ";
sql += " WHERE MI_NUM=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1,miNum);
pstmt.setString(2,miTitle);
pstmt.setString(3,miDesc);
pstmt.setString(4,miGenre);
int result = pstmt.executeUpdate();
if(result==1){
%>
	<script>
		alert('수정이 완료되었습니다.');
		location.href='<%=root%>/movie/movie-view.jsp?miNum=<%=miNum%>';
	</script>
<%
}
%>
miNum : <%=miNum%><br>
miTitle : <%=miTitle%><br>
miDesc : <%=miDesc%><br>
miGenre : <%=miGenre%><br>

</body>
</html>