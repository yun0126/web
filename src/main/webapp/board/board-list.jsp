<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.web.common.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<form>
		<input type="text" placeholder="제목" name="biTitle" id="biTitle"
			value="<%=request.getParameter("biTitle") == null ? "" : request.getParameter("biTitle")%>">
		<input type="text" placeholder="작성자" name="biWriter" id="biWriter"
			value="<%=request.getParameter("biWriter") == null ? "" : request.getParameter("biWriter")%>">
		<input type="text" placeholder="내용" name="biContent" id="biContent"
			value="<%=request.getParameter("biContent") == null ? "" : request.getParameter("biContent")%>">
		<button>검색</button>
	</form>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>삭제
			<th>
		</tr>
		<%
		Connection con = DBCon.getCon();
		String sql = " SELECT bi.*, UI.UI_NAME FROM board_info bi";
		sql += " INNER JOIN user_info UI ON BI.BI_WRITER = UI.UI_NUM WHERE 1=1 ";
		String biTitle = request.getParameter("biTitle") == null ? "" : request.getParameter("biTitle");
		String biWriter = request.getParameter("biWriter") == null ? "" : request.getParameter("biWriter");
		String biContent = request.getParameter("biContent") == null ? "" : request.getParameter("biContent");
		
		int cnt = 0;
		if (!biTitle.isEmpty()) {
			sql += " WHERE BI_TITLE LIKE CONCAT('%',?,'%')";
			cnt++;
		}
		if (!biWriter.isEmpty()) {
			sql += " WHERE BI_WRITER LIKE CONCAT('%',?,'%')";
			cnt++;
		}
		if (!biContent.isEmpty()) {
			sql += " WHERE BI_TITLE LIKE CONCAT('%',?,'%')";
			cnt++;
		}
		out.println(sql);
		PreparedStatement ps = con.prepareStatement(sql);
		if (!biContent.isEmpty()) {
			ps.setString(cnt--, biContent);
		}
		if (!biWriter.isEmpty()) {
			ps.setString(cnt--, biWriter);
		}
		if (!biTitle.isEmpty()) {
			ps.setString(cnt--, biTitle);
		}
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("BI_NUM")%></td>
			<td><a
				href="<%=root%>/board/board-view.jsp?biNum=<%=rs.getInt("BI_NUM")%>"><%=rs.getString("BI_TITLE")%></a></td>
			<td><%=rs.getString("BI_CONTENT")%></td>
			<td><%=rs.getString("UI_NAME")%></td>
			<td><%=rs.getString("BI_CREDAT")%></td>
			<td><%=rs.getInt("BI_CNT")%></td>
			<td><button type="button"
					onclick="location.href='<%=root%>/board/board-delete-ok.jsp?biNum=<%=rs.getInt("BI_NUM")%>'">삭제</button></td>
		</tr>
		<%
		}
		%>
		<tr>
			<td colspan="5" align="right"><button
					onclick="location.href='/web/board/board-insert.jsp'">등록</button>
		</tr>
	</table>
</body>
</html>