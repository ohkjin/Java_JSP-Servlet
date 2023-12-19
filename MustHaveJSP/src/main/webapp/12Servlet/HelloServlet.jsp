<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloServlet.jsp</title>
</head>
<body>
	<h2>web.xml에서 매핑 후 JSP에서 출력하기</h2>
	<p>
		
		<strong><%= request.getAttribute("message") %></strong>
		<!-- 브라우저에서 view를 바로 호출할시 null 값이 표기. 그것을 방지하기 위해선 WEB-INF밑에 넣는다(WEB-INF는 외부에서 접근 불가여서)-->
		<%-- <strong>${ message }</strong> --%>
		<br/>
		<a href="./HelloServlet.do">바로가기</a>
	</p>
</body>
</html>