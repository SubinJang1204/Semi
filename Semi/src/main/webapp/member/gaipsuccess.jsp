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
String id=request.getParameter("id");
MemberDao dao=new MemberDao();
//name 값 id를 통해 넘겨받기
String name=dao.getName(id);
%>
<center>
<div style="margin-top:300px;width:300px;width:600px;padding-top:22px;height:200px;border:2px solid #FF7BAC">

<h3><%=id %>님의 회원가입을 축하합니다!</h3><br><br>

<button type="button" class="btn btn-info btn" onclick
="location.href='index.jsp?main=login/loginmain.jsp'" style="background-color:#FF7BAC;color:white;border:none;width:100px;font-size:15px">LOGIN</button>

<button type="button" class="btn btn-default" onclick
="location.href='index.jsp?main=layout/main.jsp'" style="width:100px;font-size:15px">Home</button>
</div>


</center>

</body>
</html>