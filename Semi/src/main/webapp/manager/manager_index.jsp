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
<style type="text/css">
img{
cursor:pointer;
}
</style>
</head>
<body>
<center>
<div style="margin-top:200px;">


<div style="display:inline-block;" onclick="location.href='index.jsp?main=manager/member/member.jsp'">
<img src="images/manager_member.png"><br>

<span><h4><b>회원 관리</b></h4></span>
</div>

<div style="display:inline-block;" onclick="location.href='index.jsp?main=manager/product/product.jsp'">
<img src="images/manager_product.png"><br>
<span><h4><b>상품 관리</b></h4></span>
</div>

<div style="display:inline-block;" onclick="location.href='index.jsp?main=manager/event/event.jsp'">
<img src="images/manager_event.png"><br>
<span><h4><b>이벤트 관리</b></h4></span>
</div>

</div>
</center>
</body>
</html>