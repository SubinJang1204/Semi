<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.SmartAnswerDto"%>
<%@page import="data.dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String idx=request.getParameter("idx");
SmartAnswerDao adao=new SmartAnswerDao();
SmartAnswerDto dto=adao.getAnswerData(idx);

JSONObject ob=new JSONObject();

ob.put("idx", dto.getIdx());
ob.put("nickname", dto.getNickname());
ob.put("content",dto.getContent());

%>
<%=ob.toString()%>