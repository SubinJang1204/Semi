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
	
	dao.deleteMember(num);
	
	session.removeAttribute("loginok"); 
	
	response.sendRedirect("../index.jsp?main=login/loginform.jsp");

%>

</body>
</html>