<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//nums 읽는다
String nums=request.getParameter("nums");
//읽어온 nums를 컴마로 분리해서 배열로 만들어 split 이용, delete 가져오기
String [] num=nums.split(",");
//배열의 갯수만큼 delete
//목록 이동
SmartDao dao=new SmartDao();


for(String n:num){
	dao.deleteSmart(n);
}

response.sendRedirect("../../index.jsp?main=manager/event/smartlist.jsp");


%>