<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<%
MemberDao dao=new MemberDao();
List<MemberDto> list=dao.getAllMembers();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<center>
<p style="position:relative;margin-top:200px;text-align:center;"><h3><b>회원 목록</b></h3></p>
</center><br>
<table class='table table-bordered' style='width:1000px;margin:0 auto;'>
			
			<tr>
			
			<th width='170'>회원번호</th>
			<th width='120'>성함</th>
		<th width='120'>아이디</th>
			<th width='600'>연락처</th>
			<th width='360'>주소</th>
		<th width='150'>이메일</th>
		<th width='200'>가입일</th>
		<th></th>
		</tr>
		<%
		for(MemberDto dto:list){
		%>
		<tr align="center">
	
				<td><%=dto.getNum() %></td>
				<td><%=dto.getName() %></td>
					<td><%=dto.getId() %></td>
				<td><%=dto.getHp() %></td>
					<td><%=dto.getAddr() %></td>
					<td><%=dto.getEmail() %></td>
					<td><%=dto.getGaipday() %></td>
					<td>
					<a href="index.jsp?main=manager/member/
							updateform.jsp?num=<%=dto.getNum()%>"><button type="button" class="btn btn-info btn-xs">수정</button></a>
					<a href="index.jsp?main=manager/member/
							memberdelete.jsp?num=<%=dto.getNum()%>"><button type="button" class="btn btn-danger btn-xs" style="background-color:#FF7BAC;color:white;border:1px solid #FF7BAC;">삭제</button></a>
					</td></tr>
		<%}
		%>
		</table>
</body>
</html>