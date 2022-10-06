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
	<center>
<%
String key=request.getParameter("key");
String num=request.getParameter("num");
if(key==null){//form이라도 보여야함
	%>

	<div style="margin-top:300px;">
	<form action="index.jsp?main=mypage/updatepassform.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="key" value="yes">
	<b>수정 시 필요한 비밀번호를 입력해주세요</b>
	<br><br>
	<div class="form-inline">
	<input type="password" name="pass" class="form-control"
	style="width:120px;" required="required">
	<button type="button" class="btn btn-info">확인</button>
	</div>
	</form>
	</div>
	<%
}else{ //action 처리
	//비번읽기
	String pass=request.getParameter("pass");
//비번 맞는지 체크
MemberDao dao=new MemberDao();
boolean b=dao.isPassEqual(num, pass);
if(b){
	String path="../index.jsp?main=mypage/updateform.jsp?num="+num;
	response.sendRedirect(path);
}else{
	%>
	<script type="text/javascript">
	alert("비밀번호 틀림");
	history.back();
	</script>
	<%}
}
%>
</center>
</body>
</html>