<%@page import="boardManagement.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="boardManagement.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);

// 사용자의 입력 검색 조건을 Map에 저장
Map<String,Object> param = new HashMap<>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if (searchWord!=null){
	param.put("searchField",searchField);
	param.put("searchWord",searchWord);
}
try{
	int totalCnt = dao.selectCount(param);
	List<BoardDTO> boardLists = dao.selectList(param);
}catch(Exception e){
	e.getMessage();
}finally{
dao.close();
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page = "../Common/Link.jsp"/>
	<h2>목록 보기(List)</h2>
	<form method="get">
		<table border="1" width="90%">
		<tr>
		<td align="center">
			<select name="searchField">
				<option value="title">Title</option>
				<option value="content">Content</option>
			</select>
			<input type="text" id="searchWord" name="searchWord">
			<input type="submit" value="검색하기"><br/>
		</td>
		</tr>
		</table>
	</form>
	
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="10%">제목</th>
			<th width="10%">작성자</th>
			<th width="10%">조회사</th>
			<th width="10%">작성일</th>
		</tr>
<%
if(boardLists.isEmpty()){
%>	
	<tr>
		<td colspan="5" align="center">
			등록된 게시물이 없습니다^^*
		</td>
	</tr>
<%
}else{
%>
	</table>
</body>
</html>