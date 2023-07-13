<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	<%
	List<String> names = new ArrayList<>();
	names.add("김세희");
	names.add("김용준");
	names.add("이원준");
	names.add("이원기");
	names.add("이보성");
	names.add("이왕균");

	List<Integer> points = new ArrayList<>();
	points.add(80);
	points.add(77);
	points.add(99);
	points.add(66);
	points.add(55);
	points.add(54);

	int min = points.get(0);
	int minIdx = 0;
	int max = points.get(0);
	int maxIdx = 0;
	for (int i = 0; i < points.size(); i++) {
		if (max < points.get(i)) {
			max = points.get(i);
			maxIdx = i;
		}
		if (min > points.get(i)) {
			min = points.get(i);
			minIdx = i;
		}
	}
	List<String> addrs = new ArrayList<>();
	addrs.add("서울");
	addrs.add("부산");
	addrs.add("대전");
	addrs.add("대구");
	addrs.add("경기");
	addrs.add("광주");
	
	
	%>
	<table border="1">
		<tr>
			<th>최고점</th>
			<td><%=names.get(maxIdx)%>, <%=max%>, <%=addrs.get(maxIdx)%></td>
		</tr>
		<tr>
			<th>최저점</th>
			<td><%=names.get(minIdx)%>, <%=min%>, <%=addrs.get(minIdx)%></td>
		</tr>


	</table>
</body>
</html>