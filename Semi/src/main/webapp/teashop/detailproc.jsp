<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String shopnum=request.getParameter("shopnum");
String num=request.getParameter("num");
int cnt=Integer.parseInt(request.getParameter("cnt"));
int pojang=Integer.parseInt(request.getParameter("pojang"));

ShopDao dao=new ShopDao();
CartDto dto=new CartDto();

dto.setShopnum(shopnum);
dto.setNum(num);
dto.setCnt(cnt);
dto.setPojang(pojang);

dao.insertCart(dto);
%>
