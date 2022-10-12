<%@page import="data.dto.DirectOrderDto"%>
<%@page import="data.dao.DirectOrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");


String shopnum=request.getParameter("shopnum");
String num=request.getParameter("num");
String photo=request.getParameter("photo");
String sangpum=request.getParameter("sangpum");
int price=Integer.parseInt(request.getParameter("price"));
String receiver=request.getParameter("receiver");
String addr=request.getParameter("addr");
String hp=request.getParameter("hp");
String bank=request.getParameter("bank");
String cardnum=request.getParameter("cardnum");
String cardpass=request.getParameter("cardpass");


DirectOrderDao dao=new DirectOrderDao();
DirectOrderDto dto=new DirectOrderDto();


dto.setShopnum(shopnum);
dto.setNum(num);
dto.setPhoto(photo);
dto.setSangpum(sangpum);
dto.setPrice(price);
dto.setReceiver(receiver);
dto.setAddr(addr);
dto.setHp(hp);
dto.setBank(bank);
dto.setCardnum(cardnum);
dto.setCardpass(cardpass);

dao.InsertOrder(dto);
%>
