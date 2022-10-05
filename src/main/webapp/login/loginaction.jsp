<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String cbsave=request.getParameter("cbsave"); //체크 안 하면 null

MemberDao dao=new MemberDao();
boolean b=dao.isIdPass(id, pass);

//아이디와 비번이 맞으면 3개의 세션을 저장하고
//로그인 메인으로 이동
if(b){
	session.setMaxInactiveInterval(60*60*8); //8시간 유지 가능
	session.setAttribute("loginok", "yes");
	session.setAttribute("myid", id);
	session.setAttribute("saveok", cbsave==null?null:"yes");//cbsave가 null이면 null이고 아니면 yes라고 할게요
	
	//로그인 메인으로 이동
	response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
}else{
	%>
	<script>
	alert("아이디나 비번 틀림");
	history.back();
	</script>
	<%
}
%>