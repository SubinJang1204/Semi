<%@page import="java.io.File"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String num = request.getParameter("num");
String currentPage = request.getParameter("currentPage");

//db로부터 저장된 이미지명 얻기
SmartDao dao = new SmartDao();

dao.deleteSmart(num);

//보던 페이지로 이동
response.sendRedirect("../../index.jsp?main=event/smartlist.jsp?currentPage=" +currentPage);
%>

