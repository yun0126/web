<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<%
		List<Integer> nums = new ArrayList<>();
		Random r = new Random();
		while (nums.size() < 6) {
			int rNum = r.nextInt(100) + 1;
			if (!nums.contains(rNum)) {
				nums.add(rNum);
			}
		}

		int max = nums.get(0);
		int min = nums.get(0);

		out.println("<tr> </tr>");
		for (int i = 1; i < nums.size(); i++) {
			int num = nums.get(i);
			if (max < num) {
				max = num;
			}
			if (min > num) {
				min = num;
			}
		}
		out.println("<td>최대값: " + max + "</td>"+ "<td>최소값: " + min +"</td>");
		%>
	</table>
</body>
</html>