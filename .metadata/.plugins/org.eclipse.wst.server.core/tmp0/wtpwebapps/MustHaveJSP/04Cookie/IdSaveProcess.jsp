<%@ page import="utils.CookieManager"%>
<%@ page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--doPost  -->
<%
String user_id = request.getParameter("user_id");//전송되는 값 하나
String user_pwd = request.getParameter("user_pwd");//전송되는 값 하나
String save_check = request.getParameter("save_check");
if(user_id.equals("must")&&user_pwd.equals("1234")){//하드코딩
	//HyperLink처럼 다른 페이지로 보낸다
	if(save_check!=null&&save_check.equals("Y")){
		CookieManager.makeCookie(response, "loginId", user_id, 86400);// 하루동안
	}
	else{
		CookieManager.deleteCookie(response, "loginId");
	}
	JSFunction.alertLocation("Login Success", "IdSaveMain.jsp", out);
}
else{
	JSFunction.alertBack("Login Failed", out);
}
%>