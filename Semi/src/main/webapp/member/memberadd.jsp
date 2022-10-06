<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
//post형식
request.setCharacterEncoding("utf-8");

String name=request.getParameter("name");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String hp=request.getParameter("hp");
String addr=request.getParameter("addr");
String email=request.getParameter("email")+"@"+request.getParameter("email2");

//dto 선언
MemberDto dto=new MemberDto();
dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setHp(hp);
dto.setAddr(addr);
dto.setEmail(email);

//insert
MemberDao dao=new MemberDao();
dao.insertMember(dto);

//gaipsuccess로 이동 시키기
response.sendRedirect("../index.jsp?main=member/gaipsuccess.jsp?id="+id);
%>

</body>
</html>