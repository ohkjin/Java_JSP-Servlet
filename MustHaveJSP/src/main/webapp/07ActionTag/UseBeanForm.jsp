<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - UseBean</title>
</head>
<body>
	<h2> Get Form attributes by once using Action Tag</h2>
	<form action="UseBeanAction.jsp" method="post"> <!-- false일시 출력 안됨 -->
		name: <input type="text" name="name" placeholder="name 입력하세요"><br/>
		age : <input type="text" name="age" placeholder="age 입력하세요"><br/>
		<input type="submit" id="bt"value="submit"><br/>
	</form>
</body>
</html>