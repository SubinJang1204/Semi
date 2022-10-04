<%@page import="java.io.File"%>
<%@page import="data.dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String idx=request.getParameter("idx");

//db로부터 저장된 이미지명 얻기
SmartAnswerDao dao=new SmartAnswerDao();

dao.deleteAnswer(idx);
%>
