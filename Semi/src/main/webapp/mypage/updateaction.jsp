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
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");

    String num=request.getParameter("num");
	String name= request.getParameter("name");
	
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	String email= request.getParameter("email1")+"@"+request.getParameter("email2");

	//입력데이타를  dto로 묶기
	MemberDto dto = new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setEmail(email);
	

	//insert 메서드에 전달
	MemberDao dao = new MemberDao();
	dao.updateMember(dto);

	//목록으로 이동-url 주소 바뀜
	response.sendRedirect("../index.jsp?main=mypage/mypage.jsp");
	%>
</body>
</html>