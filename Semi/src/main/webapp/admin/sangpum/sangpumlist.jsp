<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.photo{
width: 50px;
}

</style>


<%
ShopDao dao=new ShopDao();
List<ShopDto> list=dao.getAllSangpums();
NumberFormat nf=NumberFormat.getCurrencyInstance();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd ");
%>
<body>
  <Resources allowLinking="true" />
  <h2>상품리스트</h2>
  <ul class="nav nav-tabs" style="width: 700px;">
    <li class="active"><a data-toggle="tab" href="#home">전체</a></li>
    <li><a data-toggle="tab" href="#menu1">티 세트</a></li>
    <li><a data-toggle="tab" href="#menu2">티 제품</a></li>
    <li><a data-toggle="tab" href="#menu3">다기&다도구</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>전체</h3>
      <table class="table table-bordered" style="width: 800px;">
      	<tr>
      		<td width="30">번호</td>
      		<td width="150">상품명</td>
      		<td width="80">카테고리</td>
      		<td width="80">사진</td>
      		<td width="80">가격</td>
      	
      	
      	</tr>
      	<%for(ShopDto dto:list){
      		String photo=dto.getPhoto();
      	%>
      	<tr>
      		<td><%=dto.getShopnum() %></td>
      		<td><a style="color: black; cursor: pointer;"><%=dto.getSangpum() %></a></td>
      		<td><%=dto.getCategory() %></td>
      		<td>
      		<img alt="" src="https://www.osulloc.com/upload/kr/ko/adminImage/HB/XA/20211026141423508CU.png" class="photo">
      		</td>
      		<td><%=nf.format(dto.getPrice()) %></td>
      		
      		
      	</tr>
      	<%}%>
      	<tr>
      	<td colspan="5" align="right">
      	<button onclick="location.href='index.jsp?main=sangpum/sangpumaddform.jsp'">추가</button>
      	
      	
      	</td>
      	</tr>
      </table>
      
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>티 세트</h3>
      <table class="table table-bordered" style="width: 800px;">
      	<tr>
      		<td width="30">번호</td>
      		<td width="150">상품명</td>
      		<td width="80">카테고리</td>
      		<td width="80">사진</td>
      		<td width="80">가격</td>
      	
      	
      	</tr>
      	<%for(ShopDto dto:list){
      		String photo=dto.getPhoto();
      		if(dto.getCategory().equals("티 세트")){
      	%>
      	<tr>
      		<td><%=dto.getShopnum() %></td>
      		<td><a style="color: black; cursor: pointer;"><%=dto.getSangpum() %></a></td>
      		<td><%=dto.getCategory() %></td>
      		<td>
      		<img alt="" src="sangpumimg/<%=photo%>" class="photo">
      		</td>
      		<td><%=nf.format(dto.getPrice()) %></td>
      		
      		
      	</tr>
      	<%}}%>
      	
      </table>
      
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>티 제품</h3>
      <table class="table table-bordered" style="width: 800px;">
      	<tr>
      		<td width="30">번호</td>
      		<td width="150">상품명</td>
      		<td width="80">카테고리</td>
      		<td width="80">사진</td>
      		<td width="80">가격</td>
      	
      	
      	</tr>
      	<%for(ShopDto dto:list){
      		String photo=dto.getPhoto();
      		if(dto.getCategory().equals("티 제품")){
      	%>
      	<tr>
      		<td><%=dto.getShopnum() %></td>
      		<td><a style="color: black; cursor: pointer;"><%=dto.getSangpum() %></a></td>
      		<td><%=dto.getCategory() %></td>
      		<td>
      		<img alt="" src="sangpumimg/<%=photo%>">
      		</td>
      		<td><%=nf.format(dto.getPrice()) %></td>
      		
      		
      	</tr>
      	<%}}%>
      	
      </table>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>다기&다도구</h3>
     <table class="table table-bordered" style="width: 800px;">
      	<tr>
      		<td width="30">번호</td>
      		<td width="150">상품명</td>
      		<td width="80">카테고리</td>
      		<td width="80">사진</td>
      		<td width="80">가격</td>
      	
      	
      	</tr>
      	<%for(ShopDto dto:list){
      		String photo=dto.getPhoto();
      		if(dto.getCategory().equals("다기&다도구")){
      	%>
      	<tr>
      		<td><%=dto.getShopnum() %></td>
      		<td><a style="color: black; cursor: pointer;"><%=dto.getSangpum() %></a></td>
      		<td><%=dto.getCategory() %></td>
      		<td>
      		<img alt="" src="sangpumimg/<%=photo%>">
      		</td>
      		<td><%=nf.format(dto.getPrice()) %></td>
      		
      		
      	</tr>
      	<%}}%>
      	
      </table>
    </div>
  </div>

</body>

</html>