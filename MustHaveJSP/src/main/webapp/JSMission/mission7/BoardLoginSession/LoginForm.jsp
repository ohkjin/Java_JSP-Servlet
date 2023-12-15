<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<span style="color: red; font-size:1.2em;">
		<%= request.getAttribute("LoginErrMsg")==null?
				"" : request.getAttribute("LoginErrMsg")%>
		<%MemberDTO m = (MemberDTO)session.getAttribute("member"); %>
	</span>
	<%
	//Login check
	if (m==null){
	
	%>	<!-- LOGOUT MODE -->
		<h3>Please login before using the board</h3>
		<script>
		function validateForm(form){
			if(!form.user_id.value){
				alert("id please");
				return false;
			}
			if(form.user_pw.value==""){
				alert("password please");
				return false;
			}
		}
		</script>
		<form action="LoginProcess.jsp"method="post" name ="loginFrm"
				onsubmit="return validateForm(this);"> <!-- to check error for submit -->
			ID: <input type="text" name="user_id"/><br/>
			PW: <input type="password" name="user_pw"/><br/>
			<input type="submit" value="Login"/>
		</form>
	<% 
	} else{ 
	%>	<!-- LOGIN MODE -->
 
	"<%=m.getName() %>" Login Success.<br/>
		<a href="../InsertBoardForm.jsp">[Board]</a><br/>
		<a href="Logout.jsp">[Logout]</a>
	<% 
	}
	%>
</body>
</html>