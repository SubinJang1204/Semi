<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
	
<%

String num=request.getParameter("num");


MemberDao dao=new MemberDao();
//비번 체크해서 맞으면 삭제, 틀리면 경고 후 이전으로


	dao.deleteMember(num);
	//실제 이동이기 때문에 ..이 붙는다. 다른 경우는 index가 들어가므로 .. 안 씀
	/* response.sendRedirect("index.jsp?main=manager/member/memberlist.jsp"); */

	%>
	<script type="text/javascript">
	history.back();
	
	</script>
</body>
</html>