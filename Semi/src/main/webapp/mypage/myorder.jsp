<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.DirectOrderDto"%>
<%@page import="data.dao.DirectOrderDao"%>
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
<%
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");

MemberDao dao=new MemberDao();

String num=dao.getNum(myid);
String name=dao.getName(myid);

String id = (String) session.getAttribute("myid");

DirectOrderDao ddao=new DirectOrderDao();
DirectOrderDto ddto=ddao.getDatas(num);

List<DirectOrderDto> alist=ddao.getOrderList(num);
%>
<h4 style="margin-top:150px;margin-left:530px;margin-bottom:60px;color:#FF7BAC;font-size:1.5em;"><b>결제 내역</b></h4>
<div style="width:900px;height:auto;margin:0 auto;">

<%
NumberFormat nf=NumberFormat.getCurrencyInstance();
for (int i = 0; i < alist.size(); i++) {
	DirectOrderDto map = alist.get(i);		
	
		%>
		
		<div class="cart" style="width:900px;height:200px;display:inline-block;">
	
		<img src="images2/<%=map.getPhoto() %>" style="float:left;width:200px;height:auto;cursor:pointer"onclick="location.href='index.jsp?main=teashop/shopdetail.jsp?shopnum=<%=map.getShopnum()%>'">
		
		<div style="float:left;display:inline-block;width:300px;height:300px;margin-left:10px;margin-top:10px;">
		<span style="font-size:14px;"><%=map.getOrderday() %></span><br>
		<span style="font-size:20px;position:relative;top:30px;"><%=map.getSangpum() %></span><br>
		<span style="font-size:23px;position:relative;top:40px;"><b style="color:#FF7BAC;"><%=nf.format(map.getPrice()) %></b></span><br>
		</div>
		
		<div style="float:right;margin-top:20px;margin-right:20px;display:inline-block;width:300px;height:300px;font-size:17px;">
		<span>받는 분: <%=map.getReceiver() %></span><br>
		<span>연락처: <%=map.getHp() %></span><br>
		<span>주소: <%=map.getAddr()%></span><br><br>
		<span>은행: <%=map.getBank()%></span><br>
		<span>카드번호: <%=map.getCardnum()%></span><br>
		<span>비밀번호: ****<%-- <%=map.getCardpass()%> --%></span><br>
		</div>
		</div>
	<hr>
		<%
		}		
		%>
		</div>
		
</body>
</html>