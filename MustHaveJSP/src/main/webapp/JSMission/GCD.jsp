<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.Math" %>
<%-- <%

String calcGCD = request.getParameter("GCD");
String calcLCM = request.getParameter("LCM");
%> --%>
<%! public int gcd(int n, int m){//(6,4)
		if(n%m==0)
			return m;
		return gcd(m,n%m);
}
%>

<%
	int num1 = 2;
	int num2 = 3;
	int calcGCD = 1;
	int calcLCM = 6;
	String snum1 = request.getParameter("num1");
	String snum2 = request.getParameter("num2");
	if(snum1!=null&&snum2!=null){
		num1 = Integer.parseInt(snum1);
		num2 = Integer.parseInt(snum2);
		int min=Math.min(num1,num2);
		int max=Math.max(num1,num2);
		/* int rem= max%min; 
		while(rem!=0){
			max=min;
			min=rem;
			rem=max%min;
		}
		calcGCD = rem;
		calcLCM=num1*num2/rem;
			*/
		calcGCD=gcd(max,min);
		calcLCM=num1*num2/calcGCD;
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCM</title>
</head>
<body>
<form><!--form 에 action이 달리지 않으면 submit누를시 자기자신 호출-->
숫자 1: <input type="number" name="num1" value="<%=num1%>" placeholder="2"><br/>
숫자 2: <input type="number" name="num2" value="<%=num2%>" placeholder="3"><br/>
최대공약수: <input type="number" name = "GCD" value ="<%=calcGCD %>" placeholder="1" readOnly><br/>
최소공배수: <input type="number" name = "LCM" value ="<%=calcLCM %>" placeholder="6" readOnly><br/>
<input type="submit" value="실행">
</form>
</body>
</html>