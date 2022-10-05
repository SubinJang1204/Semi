<%@page import="data.dao.ShopDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String shopnum=request.getParameter("shopnum");
ShopDao dao=new ShopDao();
dao.updateLikes(shopnum);
//증가된 chu값을 json형식으로 반환
int likes=dao.getData(shopnum).getLikes();

JSONObject ob=new JSONObject();
ob.put("likes", likes);
%>
<%=ob.toString()%>