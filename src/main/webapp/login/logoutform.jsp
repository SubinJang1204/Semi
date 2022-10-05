<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
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
<div style="margin-left: 100px;margin-top:50px">
<img src="images/cartoon/01.png">
<%
//세션에서 아이디를 먼저 받아야함
String id=(String)session.getAttribute("myid");
MemberDao dao=new MemberDao();
//name 값 id를 통해 넘겨받기
String name=dao.getName(id);
%>
<%=name%>님 어서오세요
<button type="button" class="btn btn-danger" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
</div>
</body>
</html>